{
  pkgs,
  inputs,
  lib,
  config,
  ...
}:
let
  dark = config.cfg.theme.dark;
  kvTheme = if dark then "KvLibadwaitaDark" else "KvLibadwaita";
  kvStyle = if dark then "kvantum-dark" else "kvantum";
in
{
  config = {
    environment.sessionVariables.QT_QPA_PLATFORMTHEME = "qt6ct";

    home-manager.users.kr9sis = {
      home.packages = with pkgs; [
        (symlinkJoin {
          inherit (qt6Packages.qtstyleplugin-kvantum)
            name
            pname
            version
            meta
            ;
          paths = [ qt6Packages.qtstyleplugin-kvantum ];
          postBuild = ''
            unlink $out/share/applications/kvantummanager.desktop
          '';
        })
        (symlinkJoin {
          inherit (qt6Packages.qt6ct)
            name
            pname
            version
            meta
            ;
          paths = [ qt6Packages.qt6ct ];
          postBuild = ''
            unlink $out/share/applications/qt6ct.desktop
          '';
        })
      ];

      xdg.configFile = {
        "qt6ct/qt6ct.conf".text = lib.generators.toINI { } {
          Appearance = {
            icon_theme = if dark then "Papirus-Dark" else "Papirus";
            standard_dialogs = "xdgdesktopportal";
            style = kvStyle;
            custom_palette = true;
          };
          Fonts = {
            fixed = ''"monospace,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,Regular"'';
            general = ''"sans-serif,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,Regular"'';
          };
        };
        "Kvantum/Colors".source = "${inputs.KvLibadwaita}/src/Colors";
        "Kvantum/KvLibadwaita".source = "${inputs.KvLibadwaita}/src/KvLibadwaita";
        "Kvantum/kvantum.kvconfig".text = lib.generators.toINI { } {
          General.theme = kvTheme;
        };
      };
    };
  };
}
