# homebrew-tap

Homebrew tap for [TIER](https://tiermetric.org): `tierd`, which measures how much merged work your AI spend buys.

```sh
brew install tiermetric/tap/tierd
tierd version
```

The formula builds `tierd` from the tagged source release of
[tiermetric/tier](https://github.com/tiermetric/tier), so it needs no prebuilt binary
and carries no download quarantine mark. Each TIER release updates `Formula/tierd.rb`.
The template lives in the TIER repository under `packaging/homebrew/`.

Licensed under Apache-2.0.
