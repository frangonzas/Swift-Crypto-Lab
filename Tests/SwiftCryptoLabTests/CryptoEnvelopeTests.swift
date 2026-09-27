import CryptoKit
import Foundation
import XCTest
@testable import SwiftCryptoLab

final class CryptoEnvelopeTests: XCTestCase {

    func testRoundTripReturnsOriginalPlaintext() throws {
        let key = CryptoEnvelope.ephemeralKey()
        let message = Data("authorized-test-message".utf8)

        let sealed = try CryptoEnvelope.seal(message, using: key)
        let opened = try CryptoEnvelope.open(sealed, using: key)

        XCTAssertEqual(opened, message)
    }

    func testWrongKeyFailsAuthentication() throws {
        let keyA = CryptoEnvelope.ephemeralKey()
        let keyB = CryptoEnvelope.ephemeralKey()
        let sealed = try CryptoEnvelope.seal(Data("secret".utf8), using: keyA)

        XCTAssertThrowsError(try CryptoEnvelope.open(sealed, using: keyB))
    }
}