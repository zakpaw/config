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
    nix = {
        package = pkgs.nix;
        settings = {
            trusted-users = [username];
            experimental-features = ["nix-command" "flakes"];
        };
        optimise.automatic = true;
        gc = {
            automatic = true;
            options = "--delete-older-than 1w";
            interval = {
                Hour = 3;
                Minute = 0;
            };
        };
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
