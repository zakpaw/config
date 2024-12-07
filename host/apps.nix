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

    # Uninstalling ios-deploy... (6 files, 263.2KB)
    # Uninstalling libplist... (32 files, 653.1KB)
    # Uninstalling libimobiledevice-glue... (21 files, 262KB)
    # Uninstalling libtasn1... (62 files, 720.7KB)
    # Uninstalling libusbmuxd... (17 files, 294.7KB)
    # Uninstalling libimobiledevice... (73 files, 2.0MB)
    brews = [
        "aider"
        "dep-tree"
        "xcodegen"
    ];
    casks = [
        "alacritty"
        "raycast"
        "obsidian"
        "cursor"
    ];
  };
}
