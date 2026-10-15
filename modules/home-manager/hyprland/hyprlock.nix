{
  programs.hyprlock = {
    enable = false;
    settings = {
      auth.fingerprint.enabled = true;

      background = [
        {
          path = "~/Pictures/wallpapers/rainforest-sabah.jpg";
        }
      ];
    };
  };

  catppuccin.hyprlock.enable = true;
}
