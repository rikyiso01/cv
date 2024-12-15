{
  description = "A basic flake with a shell";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.systems.url = "github:nix-systems/default";
  inputs.flake-utils = {
    url = "github:numtide/flake-utils";
    inputs.systems.follows = "systems";
  };

  outputs =
    { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        compile = pkgs.writeShellApplication {
          name = "compile";
          runtimeInputs = [ pkgs.yq pkgs.nix ];
          text = "exec bash ${./compile.sh} \"$@\"";
        };
      in
      {
        devShells.default = pkgs.mkShell { packages = [ pkgs.bashInteractive pkgs.chromium ]; };
        apps.default = {
          type = "app";
          program = "${compile}/bin/compile";
        };
      }
    );
}
