{
  programs.hyprlock = {
    enable = true;
    settings = {
      auth.fingerprint.enabled = true;

      background = [
        {
          path = "~/Pictures/wallpapers/bore-hole-wales.JPG";
        }
      ];
    };
  };

  catppuccin.hyprlock.enable = true;
}
