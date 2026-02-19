# nixfiles

Separation of concern:  
See [dotfiles](https://github.com/naeramarth7/nixfiles) for software configurations.

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

## Setup

Prerequisites
  - git
  - nix
  - 1Password

### macOS

```sh
# clone repos
git clone https://github.com/ ~/.nixos

# install nix
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install)
exec zsh # or open a new terminal
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

- [dustinlyons/nixos-config](https://github.com/dustinlyons/nixos-config)

## FAQ / Troubleshooting

### Where to find `*.desktop` files to reference them?

- `/etc/profiles/per-user/$USER/share/applications/`
- `/run/current-system/sw/share/applications/`

### KDE / DOplhin file associations are not working

- Run `kbuildsycoca6` manually

### Bluetooth isnt't working

A mix of [those  comments](https://old.reddit.com/r/archlinux/comments/zweejv/how_to_fix_error_bluetooth_service_was_skipped/lwlq8b5/?cache-bust=1768600578266) was helful on the B850M Riptide with a MT7925 onboard wifi/bluetooth chip.

- Disable both devices in BIOS
- Reboot
- Power off, unplug, Press power button, wait
- Enable both devices in BIOS
- Bluetooth was functional
