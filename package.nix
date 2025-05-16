{
  lib,
  stdenvNoCC,
}:

stdenvNoCC.mkDerivation {
  pname = "nt";
  version = "1.0.0";

  src = ./.;

  buildPhase = ''
    mkdir -p $out/bin/
    $src/make.sh $out/bin/nt
  '';

  meta = {
    description = "nt, a simple note-management tool!";
    homepage = "https://github.com/aguirre-matteo/nt";
    license = lib.licenses.mit;
  };
}
