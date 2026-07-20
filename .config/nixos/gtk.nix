{
  pkgs,
  config,
  ...
}:
let
  dark = config.cfg.theme.dark;
  gtkTheme = if dark then "adw-gtk3-dark" else "adw-gtk3";
  gtkThemeEnv = if dark then "adw-gtk3-dark:dark" else "adw-gtk3";
  iconTheme = if dark then "Papirus-Dark" else "Papirus";
  colorScheme = if dark then "prefer-dark" else "default";
  noRounding = ''
    window {
      border-radius: 0;
    }
  '';
in
{
  config = {
    environment.sessionVariables.GTK_THEME = gtkThemeEnv;

    programs.dconf.profiles.user.databases = [
      {
        settings = {
          "org/gnome/desktop/interface" = {
            gtk-theme = gtkTheme;
            icon-theme = iconTheme;
            font-name = "Sans Regular 11";
            document-font-name = "Sans Regular 11";
            monospace-font-name = "Monospace Regular 12";
            color-scheme = colorScheme;

            gtk-enable-primary-paste = false;
            enable-animations = true;
          };
          "org/gnome/desktop/wm/preferences" = {
            button-layout = ":";
          };
        };
      }
    ];

    home-manager.users.kr9sis = {
      home.packages = [
        pkgs.adw-gtk3
        pkgs.papirus-icon-theme
      ];

      xdg.configFile = {
        "gtk-4.0/gtk.css".text = noRounding;
        "gtk-3.0/gtk.css".text = noRounding;
      };

      home.activation.dconf-theme = ''
        ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/gtk-theme "'${gtkTheme}'"
        ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/icon-theme "'${iconTheme}'"
        ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/color-scheme "'${colorScheme}'"
      '';
    };
  };
}
