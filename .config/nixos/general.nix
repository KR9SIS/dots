{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    brave
    impala
    wiremix
    bluetui
    evince
    nautilus
    gnome-calculator
    grim
    slurp
    satty

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

  hardware.printers = {
    ensureDefaultPrinter = "EPSON_ET-2750_Series";
    ensurePrinters = [
      {
        deviceUri = "ipp://192.168.10.216/ipp/print";
        location = "Home";
        name = "EPSON_ET-2750_Series";
        model = "everywhere";
        ppdOptions = {
          PageSize = "A4";
          Duplex = "DuplexNoTumble";
        };
      }
    ];
  };

  services = {
    printing.enable = true;
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    mullvad-vpn = {
      enable = true;
      enableEarlyBootBlocking = true;
      package = pkgs.mullvad-vpn;
    };

    gvfs.enable = true;

    playerctld.enable = true;
  };
}
