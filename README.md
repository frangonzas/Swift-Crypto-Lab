# Swift Crypto Lab

> Auditable Apple-platform experiments for secure cryptographic composition.

![Swift](https://img.shields.io/badge/Swift-5.9%2B-informational?logo=swift) ![Scope](https://img.shields.io/badge/scope-defensive-success)

## Mission

Understand how to use platform cryptography correctly without inventing custom algorithms.

### Principles

```text
use vetted primitives
authenticate encrypted data
keep keys out of source control
treat nonce discipline as a requirement
never log secrets
document assumptions
```

## Included experiment

`CryptoEnvelope` demonstrates authenticated encryption with `AES.GCM` using CryptoKit. The example generates an ephemeral key at runtime and intentionally contains no embedded secrets.

### Data flow

```mermaid
flowchart LR
    A[Plaintext] --> B[AES.GCM seal]
    K[SymmetricKey] --> B
    B --> C[Combined sealed box]
    C --> D[AES.GCM open]
    K --> D
    D --> E[Validated plaintext]
```

## Run tests

```bash
swift test
```

## Security notes

- This is educational sample code, not a complete key-management system.
- Production key storage must be designed separately.
- Do not reuse keys or copy sample architecture blindly without a threat model.

## Scope

Defensive, educational and authorized research only.

© 2026 Fran Gonzas