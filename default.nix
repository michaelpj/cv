{ stdenv, texlive }:

let
  tex = texlive.combine { 
    inherit (texlive) 
    scheme-small 
    moderncv 
    fontawesome
    collection-bibtexextra
    bibtex biblatex logreq xstring biber
    latexmk;
  };
in
stdenv.mkDerivation {
  name = "cv";
  buildInputs = [ tex ];
}
