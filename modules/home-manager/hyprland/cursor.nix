{ pkgs, ... }:
{
  home.pointerCursor = {
    hyprcursor.enable = true;
    x11.enable = true;
    gtk.enable = true;
    package = pkgs.catppuccin-cursors.latteDark;
    name = "Catppuccin-Cursors Latte Dark";
  };
}
