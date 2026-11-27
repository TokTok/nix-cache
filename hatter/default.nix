let
  hatter = builtins.fetchTarball {
    url = "https://github.com/iphydf/hatter/archive/7de711536a06549402b17a2d22d2f40b14fc26f2.tar.gz";
    sha256 = "1ykchpx9v3manaarnc5ggf07kh0rjm42gakb4iirs7kw0w7whlax";
  };
  ci = import "${hatter}/nix/ci.nix" { };
in
{
  inherit (ci) all-builds emulator-all emulator-armv7a;
  apk = import "${hatter}/nix/apk.nix" { };
}
