{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        {
          timeout = 60;
          on-timeout = "hyprctl dispatch dpms off DP-3";
          on-resume = "hyprctl dispatch dpms on DP-3 && brightnessctl -r";
        }
        {
          timeout = 150;
          on-timeout = "loginctl lock-session";
        }
      ];
    };
  };
}
