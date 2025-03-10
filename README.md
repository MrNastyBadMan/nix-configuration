sudo nixos-rebuild switch --flake .#default
- `sudo` - super user do
- `nixos-rebuild` - command that rebuilds
- `switch` - switches current setup to rebuilt setup
- `--flake` specifies to use a flake
- `.` - this folder
- `#default` - name of configuration specified in flake file

sudo nh os switch . -H default
- `nh` - nix helper, installed program
- `os` - NixOS functionality (write instead of nix basically)
- `-H default` - specifying the host

nh home switch .
