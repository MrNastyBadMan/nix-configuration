{
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ../../modules/home-manager/hyprland/mod.nix
    ../../modules/home-manager/kitty.nix
    ../../modules/home-manager/helix.nix
    ../../modules/home-manager/fastfetch.nix
    ../../modules/home-manager/fish.nix
    ../../modules/home-manager/starship.nix
    inputs.nix-colors.homeManagerModules.default
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "wrc";
  home.homeDirectory = "/home/wrc";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  programs.bash.enable = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.hello
    pkgs.firefox
    pkgs.fastfetch
    pkgs.kitty
    pkgs.swww
    pkgs.rofi-wayland
    pkgs.dunst
    pkgs.libnotify
    pkgs.networkmanagerapplet
    pkgs.brightnessctl
    pkgs.slurp
    pkgs.grim
    pkgs.yazi
    pkgs.nwg-displays
    pkgs.zip
    pkgs.unzip
    pkgs.nil
    pkgs.nwg-look

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
  };

  # For hotplugging usb drives
  services.udiskie = {
    enable = true;
    settings = {
      program_options.file_manager = "${pkgs.yazi}/bin/yazi";
    };
  };

  programs.helix.defaultEditor = true;

  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/wrc/etc/profile.d/hm-session-vars.sh
  #
  # home.sessionVariables = {
  #   EDITOR = "hx";
  # };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
