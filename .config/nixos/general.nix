{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    libreoffice-qt6
    hunspell
    hunspellDicts.da_DK
    hunspellDicts.en_US

    imv
    mpv

    signal-desktop

    joplin-desktop
  ];

  programs = {
    localsend = {
      enable = true;
      openFirewall = true;
    };
  };

  services = {
    mullvad-vpn = {
      enable = true;
      enableEarlyBootBlocking = true;
      package = pkgs.mullvad-vpn;
    };
    printing.enable = true;
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

  };
}
