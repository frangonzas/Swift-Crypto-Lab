import CryptoKit
import Foundation

/// Contenedor educativo para cifrado autenticado con AES-GCM.
/// No gestiona persistencia de claves; esa responsabilidad pertenece a otra capa.
public enum CryptoEnvelope {

    public enum EnvelopeError: Error {
        case invalidCombinedBox
    }

    /// Cifra datos con AES-GCM y devuelve la representación combinada
    /// que contiene nonce, ciphertext y authentication tag.
    public static func seal(_ plaintext: Data, using key: SymmetricKey) throws -> Data {
        let box = try AES.GCM.seal(plaintext, using: key)
        guard let combined = box.combined else {
            throw EnvelopeError.invalidCombinedBox
        }
        return combined
    }

    /// Abre un sealed box. CryptoKit valida autenticidad antes de devolver plaintext.
    public static func open(_ combined: Data, using key: SymmetricKey) throws -> Data {
        let box = try AES.GCM.SealedBox(combined: combined)
        return try AES.GCM.open(box, using: key)
    }

    /// Genera una clave efímera para pruebas. No se almacena ni se serializa.
    public static func ephemeralKey() -> SymmetricKey {
        SymmetricKey(size: .bits256)
    }
}