{
  stdenv,
  lib,
}:

stdenv.mkDerivation {
  pname = "nixos-plymouth-load";
  version = "unstable";

  src = lib.cleanSource ./theme-files;

  dontBuild = true;
  dontConfigure = true;

  installPhase = ''
    themeDir="$out/share/plymouth/themes/nixos"
    mkdir -p "$themeDir"

    cp nixos.plymouth nixos.script "$themeDir/"
    cp *.png "$themeDir/"

    substituteInPlace "$themeDir/nixos.plymouth" \
      --replace-fail "/usr/share/plymouth/themes/nixos" "$themeDir"
  '';

  meta = with lib; {
    description = "Nixos Plymouth splash theme";
    platforms = platforms.linux;
  };
}
