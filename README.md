# Swift Crypto Lab

> Experimentos auditables con criptografía de plataforma en el ecosistema Apple.

**Creador: Fran Gonzas · Swift 5.9+ · CryptoKit · Investigación defensiva**

## Objetivo

Aprender a componer correctamente las funciones criptográficas que proporciona el sistema **sin inventar algoritmos de cifrado propios**.

## Principios de seguridad

~~~text
Utilizar primitivas criptográficas reconocidas
Autenticar siempre los datos cifrados
No guardar claves en el repositorio
Respetar los requisitos de nonce e IV
No registrar secretos en los logs
Documentar las suposiciones de seguridad
~~~

## Ejemplo implementado

\`CryptoEnvelope\` demuestra el uso de cifrado autenticado con **\`AES.GCM\` de CryptoKit**. El ejemplo genera una clave efímera durante la ejecución y no incorpora secretos en el código fuente.

### Flujo de datos

~~~mermaid
flowchart LR
    A[Texto original] --> B[Cifrar y autenticar con AES.GCM]
    K[SymmetricKey] --> B
    B --> C[Contenedor cifrado combinado]
    C --> D[Descifrar y comprobar autenticidad]
    K --> D
    D --> E[Texto validado]
~~~

## Instalación y pruebas

Con Swift instalado:

~~~bash
git clone https://github.com/frangonzas/Swift-Crypto-Lab.git
cd Swift-Crypto-Lab
swift test
~~~

## Consideraciones de seguridad

- Este proyecto es un **ejemplo educativo**, no un sistema completo de gestión de claves.
- El almacenamiento de claves en producción requiere un diseño independiente.
- No reutilices claves ni traslades ejemplos a producción sin analizar previamente las amenazas.
- Las garantías criptográficas dependen también de la protección de los extremos y de la gestión de identidades.

Consulta la [política de seguridad](SECURITY.md).

**Uso exclusivamente defensivo, educativo y autorizado.**

© 2026 Fran Gonzas
