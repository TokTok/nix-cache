# nix-cache

Builds custom Nix packages TokTok projects need that don't have existing
builds. Targets [toktok](https://toktok.cachix.org) Cachix cache. Currently,
this is mostly just for Android cross compilers for
[Hatter](https://github.com/iphydf/hatter) which takes hours to build from
scratch.

## Using the cache

Add it to your Nix configuration (`/etc/nix/nix.conf`, or `nix.settings` on
NixOS):

```
extra-substituters = https://toktok.cachix.org
extra-trusted-public-keys = toktok.cachix.org-1:ZijcpD+vG99+1uX65TlXaROvLqP//CGCiFlB5OrIGXY=
```

In GitHub Actions, `cachix/cachix-action` with `name: toktok` does the same.

## Built items

Each directory has a `default.nix` naming what to build for one project:

- `hatter`: Hatter's (like Haskell Flutter) CI and the APK its macOS job
  builds.

To cache a newer revision, change it in that `default.nix`. To cache another
project, add a directory and add it to the matrix in
`.github/workflows/cache.yml`.
