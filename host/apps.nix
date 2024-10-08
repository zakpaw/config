# https://daiderd.com/nix-darwin/manual/index.html
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    git
  ];
  nixpkgs.config.allowUnfree = true;

  homebrew = {
    enable = true;
    onActivation.autoUpdate = false;
    onActivation.upgrade = true;
    onActivation.cleanup = "zap";
    taps = [
      "homebrew/services"
    ];

    brews = [
        "dep-tree"
    ];
    casks = [
        "alacritty"
        "raycast"
        "obsidian"
        "cursor"
    ];
  };
}
