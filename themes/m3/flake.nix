{
  description = "Markdown to pdf using pandoc and pagedjs-cli";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs =
    { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        pagedjs-cli = pkgs.buildNpmPackage rec {
          pname = "pagedjs-cli";
          version = "0.4.3";

          src = pkgs.fetchgit {
            url = "https://gitlab.coko.foundation/pagedjs/pagedjs-cli.git";
            rev = "v${version}";
            hash = "sha256-3FeTnHAoxJE2X9MxPPX03x5xVpG2jLHAi9aVNXMrpyE=";
          };

          npmDepsHash = "sha256-yYAaUzfDNTSJojaRD9rwBbVy7lSxLZ7Pqf71RjXMP9E=";

          # The prepack script runs the build script, which we'd rather do in the build phase.
          npmPackFlags = [ "--ignore-scripts" ];

          NODE_OPTIONS = "--openssl-legacy-provider";
          PUPPETEER_SKIP_DOWNLOAD = true;

          postFixup = ''
            wrapProgram $out/bin/pagedjs-cli \
              --set PUPPETEER_EXECUTABLE_PATH ${pkgs.chromium.outPath}/bin/chromium
          '';
        };
        compile = pkgs.writeShellApplication {
          name = "compile";
          runtimeInputs = [ pkgs.yq pkgs.jinja2-cli pkgs.pandoc pagedjs-cli ];
          text = ''
            cat > data.yml
            jinja2 "${./templates}/$(yq -r .language data.yml).html" data.yml --outfile result.html
            # pandoc --defaults ${./pandoc.yml} result.md --output result.html
            # pagedjs-cli result.html --output result.pdf
          '';
        };
      in
      {
        apps.default = { type = "app"; program = "${compile.outPath}/bin/compile"; };
      }
    );
}
