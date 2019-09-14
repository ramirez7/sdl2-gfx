let pkgs = import ./nix/pkgs.nix;
in pkgs.haskell.packages.ghc865.callCabal2nix "sdl2-gfx" ./. {}
