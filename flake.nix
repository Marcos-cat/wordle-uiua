{
  description = "Wordle";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs =
    { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
      pkgs = (import nixpkgs { system = "x86_64-linux"; });
    in
    {
      devShells = forAllSystems (system: {
        default = (let
          packages = with pkgs; [
            uiua-unstable

            libGL
            pkg-config
            xorg.libXrandr
            xorg.libXinerama
            xorg.libXcursor
            xorg.libXi
            xorg.libX11
          ];
        in
          pkgs.mkShell {
            # Get dependencies from the main package
            nativeBuildInputs = packages;
            buildInputs = packages;
            env = {
              LIBCLANG_PATH = "${pkgs.libclang.lib}/lib";
              LD_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath packages}";
            };
          });
      });
    };
}
