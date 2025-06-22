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

    # Fix GID mismatch for existing Nix installation
    ids.gids.nixbld = 30000;

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
        stateVersion = 6;
        primaryUser = username;
        activationScripts.activateSettings.text = ''
            sudo -u ${username} /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
        '';
        defaults = {
            dock.autohide = true;
            menuExtraClock.Show24Hour = true;
            NSGlobalDomain.KeyRepeat = 2;
        };
    };
}
