{
  config,
  pkgs,
  ...
}:

let
  startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
    ${pkgs.awww}/bin/awww-daemon &
    sleep 1
    ${randomWallpaper}/bin/random-wallpaper

    ${pkgs.networkmanagerapplet}/bin/nm-applet --indicator &
    ${pkgs.waybar}/bin/waybar &
    ${pkgs.dunst}/bin/dunst &
    ${pkgs.hypridle}/bin/hypridle
  '';

  toggleWaybar = pkgs.pkgs.writeShellScriptBin "toggle-bar" ''
    if pgrep waybar; then
      `killall .waybar-wrapped`
    else
      `${pkgs.waybar}/bin/waybar`
    fi
  '';

  randomWallpaper = pkgs.pkgs.writeShellScriptBin "random-wallpaper" ''
    awww img "$(find ~/Pictures/wallpapers/ -type f | shuf -n 1)"
  '';
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    configType = "lua";
  };

  imports = [
    ./hyprlock.nix
    ./hypridle.nix
    ./cursor.nix
  ];
}
