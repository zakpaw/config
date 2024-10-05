# https://daiderd.com/nix-darwin/manual/index.html
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    git
  ];

  homebrew = {
    enable = true;
    onActivation.autoUpdate = false;
    taps = [
      "homebrew/services"
    ];
    brews = [
        "dep-tree"
    ];
    casks = [
        "alacritty"
        "raycast"
    ];
  };
}
