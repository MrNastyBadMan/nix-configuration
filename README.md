sudo nixos-rebuild switch --flake .#default
- `sudo` - super user do
- `nixos-rebuild` - command that rebuilds
- `switch` - switches current setup to rebuilt setup
- `--flake` specifies to use a flake
- `.` - this folder
- `#default` - name of configuration specified in flake file
