{ pkgs, ... }:

{
  services = {
    displayManager = {
      sddm = {
        wayland = {
          enable = true;
        };
        autoNumlock = true;
        enable = true;

      };
      defaultSession = "hyprland-uwsm";
      autoLogin.user = "kr9sis";
    };
    hypridle.enable = true;
  };

  environment.systemPackages = with pkgs; [
    hyprpaper
    hyprmon
    hyprshot
    hyprsysteminfo
    hyprsunset
    hyprshutdown
  ];

  programs = {
    uwsm = {
      enable = true;
    };
    hyprland = {
      enable = true;
      withUWSM = true;
    };
    hyprlock.enable = true;

    waybar.enable = true;
  };

  systemd.user.services.waybar = {
    enableDefaultPath = false;
    enableStrictShellChecks = true;

  };
}
