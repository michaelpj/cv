{ stdenv, texlive, biber }:

let
  tex = texlive.combine { 
    inherit (texlive) 
    scheme-small 
    moderncv 
    fontawesome
    collection-bibtexextra
    bibtex biblatex logreq xstring 
    latexmk;
  };
in
stdenv.mkDerivation {
  name = "cv";
  buildInputs = [ tex biber ];
}
