{
  home.shell.enableFishIntegration = true;
  programs.fish = {
    enable = true;
    shellAbbrs = {
      # nix
      ncg = "nix-collect-garbage";

      nhoss = "nh os switch . -H";
      nhost = "nh os test . -H";

      nhhs = "nh home switch .";

      # git
      ga = "git add";
      gcm = "git commit -m";
      gp = "git push";
    };
  };
}
