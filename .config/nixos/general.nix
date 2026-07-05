{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    brave
    impala
    wiremix
    bluetui
    evince
    nautilus

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

    gvfs.enable = true;

    playerctld.enable = true;
  };
}
