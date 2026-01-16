# nixfiles

## Structure

```
.
├── apps/
├── flake.nix
├── home/
├── hosts/
├── modules/
└── setup/
```

## Manual steps

### noctalia-shell

In general, noctalia seems to generate theme files with 444 permission. This might need to be manually fixed to 644 to allow updating those..

- [vscode]: Install "NoctaliaTheme" plugin
  - The plugin may not be installed with nixos, as due to the immutability, noctalia can't change the colors
- [pywalfox]: Manually install once `pywalfox install`

## Debugging

Start a nix repl and import nixpkgs to be able to evaluate the environment.

```bash
nix repl
nix-repl> :l <nixpkgs>
```

## Credits

- https://github.com/dustinlyons/nixos-config


## FAQ

**Where to find `*.desktop` files to reference them?**

- `/etc/profiles/per-user/$USER/share/applications/`
- `/run/current-system/sw/share/applications/`
