# Overengineered CV

An overengineered CV using nix jinja pandoc and yaml

## Requirements

- nix with flakes enabled

## Usage

```bash
nix run . <base.yml> <jq-filter.jq> <absolute-nix-flake-url>
```

Example:

```bash
nix run . bases/en.yml filters/all.jq $(pwd)/themes/europass
```

## Architecture

- All the possible data of a cv is placed in a yaml file
- The yaml file is filtered using a jq filter file
- A theme is applied using a nix flake

