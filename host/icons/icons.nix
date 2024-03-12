{pkgs, ...}: {
  environment.customIcons = {
    enable = true;
    icons = [
      {
        path = "${pkgs.alacritty}/Applications/Alacritty.app";
        icon = ./alacritty.icns;
      }
    ];
  };
}
