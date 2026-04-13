rec {
  description = "Shantou University Thesis Typst Template Development";
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };
  };
  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
      };
    in
    {
      devShells = {
        x86_64-linux = {
          default = pkgs.mkShell {
            name = description;
            shellHook = ''
              unset SOURCE_DATE_EPOCH
            '';
            packages = with pkgs; [
              markdown-oxide
              rumdl
              typst
              tinymist
              typstyle
            ];
          };
        };
      };
    };
}
