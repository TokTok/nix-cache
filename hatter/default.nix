let
  hatter = builtins.fetchTarball {
    url = "https://github.com/iphydf/hatter/archive/16576ebb1e77cb089b63d17d208bc085f390da6d.tar.gz";
    sha256 = "0y5l83hqw5343zay2j3nvv8b6zjidscdg1smlbmadb60h0rvh1xg";
  };
  ci = import "${hatter}/nix/ci.nix" { };
in
{
  inherit (ci) all-builds emulator-all emulator-armv7a;
  apk = import "${hatter}/nix/apk.nix" { };
}
