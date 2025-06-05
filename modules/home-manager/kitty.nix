{ config, ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = 0.7;
      background_blur = 20;
      confirm_os_window_close = 1;
      shell = "fish";

      background = "#${config.colorScheme.palette.base00}";
      foreground = "#${config.colorScheme.palette.base05}";
      selection_background = "#${config.colorScheme.palette.base03}";
      selection_foreground = "#${config.colorScheme.palette.base05}";

      cursor = "#${config.colorScheme.palette.base05}";
      cursor_text_color = "#${config.colorScheme.palette.base00}";

      color0 = "#${config.colorScheme.palette.base00}";
      color1 = "#${config.colorScheme.palette.base08}";
      color2 = "#${config.colorScheme.palette.base0B}";
      color3 = "#${config.colorScheme.palette.base0A}";
      color4 = "#${config.colorScheme.palette.base0D}";
      color5 = "#${config.colorScheme.palette.base0E}";
      color6 = "#${config.colorScheme.palette.base0C}";
      color7 = "#${config.colorScheme.palette.base05}";

      color8 = "#${config.colorScheme.palette.base02}";
      color9 = "#${config.colorScheme.palette.base08}";
      color10 = "#${config.colorScheme.palette.base0B}";
      color11 = "#${config.colorScheme.palette.base0A}";
      color12 = "#${config.colorScheme.palette.base0D}";
      color13 = "#${config.colorScheme.palette.base0E}";
      color14 = "#${config.colorScheme.palette.base0C}";
      color15 = "#${config.colorScheme.palette.base07}";

      window_padding_width = 4;
    };
  };
}
