let pkgs-fork = "NixOS";
    pkgs-rev = "41fa251ebceb14c5bed4fa3fe5a0e30b19d17b3f";
    pkgs-sha256="1vzyqm5mi8hfdarwh9nns1qnivik48n1kw2w7y2nb37wx6i27rj7";
    mkPkgs = import (builtins.fetchTarball {
      url = "github.com/${pkgs-fork}/nixpkgs/archive/${pkgs-rev}.tar.gz";
      sha256 = pkgs-sha256;
    });
in
  mkPkgs {}
