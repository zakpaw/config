{
  hostname,
  username,
  pkgs,
  ...
}: {
  # core
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.package = pkgs.nix;

  services.nix-daemon.enable = true;

  # Host & Users configuration
  networking.hostName = hostname;
  networking.computerName = hostname;

  users.users."${username}" = {
    name = "${username}";
    home = "/Users/${username}";
    description = username;
  };
  nix.settings.trusted-users = [username];

  # system
  system = {
    # activationScripts are executed on every system boot or run `darwin-rebuild`.
    activationScripts.postUserActivation.text = ''
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    '';

    defaults = {
      menuExtraClock.Show24Hour = true;
    };
  };

  security.pam.enableSudoTouchIdAuth = true;

  programs.zsh.enable = true;

  # icons
  environment.customIcons = {
    enable = true;
    icons = [
      {
        path = "${pkgs.alacritty}/Applications/Alacritty.app";
        icon = ../icons/alacritty.icns;
      }
    ];
  };
}
