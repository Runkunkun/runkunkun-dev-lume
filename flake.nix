{
  description = "A Nix-flake-based Deno Lume development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { self
    , nixpkgs
    , flake-utils
    }:

    flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs {
        inherit system;
      };
    in
    {
      devShells.default = pkgs.mkShellNoCC {
        packages = with pkgs; [
          deno
        ];
        shellHook = ''
          ${pkgs.deno}/bin/deno run -Ar https://deno.land/x/lume/init.ts
          ${pkgs.deno}/bin/deno install --allow-run --name lume --force --reload https://deno.land/x/lume_cli/mod.ts
        '';
      };
    });
}