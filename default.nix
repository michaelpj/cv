{ stdenv, texlive }:

let
  tex = texlive.combine { 
    inherit (texlive) 
    scheme-small 
    #collection-fontsrecommended
    moderncv etoolbox xcolor metafont
    latexmk;
  };
in
stdenv.mkDerivation {
  name = "cv";
  buildInputs = [ tex ];
}
