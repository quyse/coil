{ pkgsFun ? import <nixpkgs>
, pkgs ? pkgsFun {}
, lib ? pkgs.lib
}: let

  # this is GitHub version of the Coil umbrella .nix file

  repo = name: builtins.fetchGit {
    url = "https://github.com/quyse/${name}.git";
  };

in lib.makeScope lib.callPackageWith (coil: lib.makeExtensible (_: with coil; {
  inherit pkgsFun pkgs coil;
  core = callPackage (repo "coil-core") {};
  toolchain = callPackage (repo "coil-toolchain") {};
  toolchain-linux = callPackage (repo "coil-toolchain-linux") {};
  toolchain-windows = callPackage (repo "coil-toolchain-windows") {};
  toolchain-msvs = callPackage (repo "coil-toolchain-msvs") {};
  toolchain-macos = callPackage (repo "coil-toolchain-macos") {};
  toolchain-deploy = callPackage (repo "toolchain-deploy") {};

  # a number of projects is not public due to non-redistributable dependencies
  # they are optional for other projects, but need to be set to null explicitly
  toolchain-steam = null;
  toolchain-switch = null;
}))
