# Pronto::Swiftlint

[Pronto](https://github.com/mmozuras/pronto) runner for [Swiftlint](https://github.com/realm/SwiftLint)

Swiftlint is needed to be installed for this runner to work.

# Configuring runner

You can explicitly specify location of SwiftLint runner by passing `PRONTO_SWIFTLINT_PATH` env variable e.g:

`PRONTO_SWIFTLINT_PATH=/usr/very/hidden/bin/swiftlint pronto run --index`
