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
  };
  services.nix-daemon.enable = true;

  # host & users configuration
  networking.hostName = hostname;
  networking.computerName = hostname;

  users.users."${username}" = {
    name = "${username}";
    home = "/Users/${username}";
    description = username;
  };

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
}
