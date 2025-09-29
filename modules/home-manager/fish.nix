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
      gs = "git status";
      ga = "git add";
      gaa = "git add -A";
      gcm = "git commit -m";
      gp = "git push";
    };
    shellAliases = {
      "Nix" = "cd ~/Nix";
    };
  };
}
