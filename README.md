# rti's simple neovim flake configuration

Based on [Quoteme/neovim-luca](https://github.com/Quoteme/neovim-luca).

## Installation

### TODO

Set GITHUB_TOKEN env var to avoid api rate limit

### Run over the internet

`nix run github:rti/neovim-flake /some/file`

### Run from a folder (for hacking )

Clone the repo and run `nix run /some/file` inside the new folder.

### Install system-wide

Open `/etc/nixos/flake.nix` and add the following:

```
inputs = {
    # ...blabla...
    neovim-flake.url = "github:rti/neovim-flake";
}

outputs = {self, nixpkgs, ...}@attr: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = attrs;
        modules = [
            ({ config, nixpkgs, ...}@inputs:
                # ...blabla...
                environment.systemPackages = with pkgs; [
                    # ...blabla...
                    inputs.neovim-flake.defaultPackage.x86_64-linux
                ];
            )
        ];
    }
}
```

Note that `...blabla...` is a placeholder for any other configuration
you might have set inside your `flake.nix`!
