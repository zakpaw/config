{pkgs, ...}: {
  environment.customIcons = {
    enable = true;
    icons = [
      {
        path = "/Applications/Alacritty.app";
        icon = ./alacritty.icns;
      }
    ];
  };
}
