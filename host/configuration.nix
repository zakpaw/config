{
  hostname,
  username,
  pkgs,
  ...
}: {
  imports = [
    ./apps.nix
    ./icons/icons.nix
  ];

  # core
  nix.package = pkgs.nix;
  nix.settings = {
    trusted-users = [username];
    experimental-features = ["nix-command" "flakes"];
    auto-optimise-store = true;
  };
  services.nix-daemon.enable = true;
  nix.gc = {
    automatic = true;
  interval = {
    Hour = 3;
    Minute = 0;
  };
    options = "--delete-older-than 1w";
  };

  # host & users configuration
  networking.hostName = hostname;
  networking.computerName = hostname;

  users.users."${username}" = {
    name = "${username}";
    home = "/Users/${username}";
    description = username;
  };

  # system
  programs.zsh.enable = true;
  system = {
    # activationScripts are executed on every system boot or run `darwin-rebuild`.
    stateVersion = 5;
    activationScripts.postUserActivation.text = ''
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    '';

    defaults = {
      dock.autohide = true;
      menuExtraClock.Show24Hour = true;
      NSGlobalDomain.KeyRepeat = 2;
    };
  };

  security.pam.enableSudoTouchIdAuth = true;
}
