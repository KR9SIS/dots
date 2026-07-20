{
  stdenv,
  lib,
}:

stdenv.mkDerivation {
  pname = "omarchy-plymouth-theme";
  version = "unstable";

  src = lib.cleanSource ./theme-files;

  dontBuild = true;
  dontConfigure = true;

  installPhase = ''
    themeDir="$out/share/plymouth/themes/omarchy"
    mkdir -p "$themeDir"

    cp omarchy.plymouth omarchy.script "$themeDir/"
    cp *.png "$themeDir/"

    substituteInPlace "$themeDir/omarchy.plymouth" \
      --replace-fail "/usr/share/plymouth/themes/omarchy" "$themeDir"
  '';

  meta = with lib; {
    description = "Omarchy Plymouth splash theme";
    platforms = platforms.linux;
  };
}
