{pkgs, ...}: {
    programs.nushell = {
        enable = true;
        extraConfig = ''
            $env.STARSHIP_SHELL = "nu"
            $env.config = {
              show_banner: false,
              edit_mode: vi
            }
            $env.PATH = ($env.PATH | split row (char esep) | append "~/.npm-global/bin")

            let carapace_completer = {|spans|
                carapace $spans.0 nushell ...$spans | from json
            }

            let zoxide_completer = {|spans|
                $spans | skip 1 | zoxide query -l ...$in | lines | where {|x| $x != $env.PWD}
            }

            let multiple_completers = {|spans|
                match $spans.0 {
                    z => $zoxide_completer
                    _ => $carapace_completer
                } | do $in $spans
            }
        '';
        configFile.source = ./zoxide.nu;
        shellAliases = {
            # code = "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code";
            v = "nvim";
            vi = "nvim";
            vim = "nvim";
            "v." = "nvim .";
            tree = "eza --tree --icons";
        };
    };  
    programs.carapace  = {
        enable = true;
        enableNushellIntegration = true;
    };
    programs.starship = { 
        enable = true;
        enableNushellIntegration = true;
        settings = pkgs.lib.importTOML ./starship.toml;
    };
}
