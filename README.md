# Pronto::Tailor

[Pronto](https://github.com/mmozuras/pronto) runner for [Swiftlint](https://github.com/realm/SwiftLint)

Swiftlint is needed to be installed for this runner to work.

# Configuring runner

You can explicitly specify location of SwiftLint runner by passing `PRONTO_SWIFTLINT_PATH` env variable e.g:

`PRONTO_SWIFTLINT_PATH=/usr/very/hidden/bin/swiftlint pronto run --index`

This runner requires `json` formatter to be set. You can do it by modifying `.swiftlint.yml` in directly pronto is run:

```yaml
disabled_rules: # rule identifiers to exclude from running
  - trailing_whitespace
included: # paths to include during linting. `--path` is ignored if present.
  - Source
excluded: # paths to ignore during linting. Takes precedence over `included`.
  - Source/Pods
line_length: 120
type_body_length:
  - 300 # warning
  - 400 # error
reporter: "json"
```
