# The Coil project

The Coil project combines a number of subprojects in the areas of software building, game development, infrastructure and DevOps. The project is being developed by [Alexander Bich](https://github.com/quyse).

The project primarily uses [Nix and NixOS](https://nixos.org/) for its goals.

The subprojects mutually depend on each other, so this repository contains a simple umbrella [default.nix](./default.nix) file for easy initialization of all the subprojects. For example, to build the `nixos-pkgs.coil-core` attribute of the `coil-core` subproject while using the umbrella `default.nix`, simply prepend `core.` to the attribute:

```bash
nix build -Lf ./default.nix core.nixos-pkgs.coil-core
```

## Projects

* [coil-core](https://github.com/quyse/coil-core) - C++-20 game engine
* [coil-toolchain](https://github.com/quyse/coil-toolchain) - generic Nix-based building utils
* [coil-toolchain-linux](https://github.com/quyse/coil-toolchain-linux) - Nix-based toolchain for non-NixOS Linux builds
* [coil-toolchain-windows](https://github.com/quyse/coil-toolchain-windows) - Nix-based toolchain for Windows builds
* [coil-toolchain-msvs](https://github.com/quyse/coil-toolchain-msvs) - Nix-based support for building with MSVS on Linux
* [coil-toolchain-macos](https://github.com/quyse/coil-toolchain-macos) - Nix-based macOS VMs on Linux
* [coil-toolchain-deploy](https://github.com/quyse/coil-toolchain-deploy) - Nix/Terraform-based helpers for software deployment
