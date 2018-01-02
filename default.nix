{ pkgs ? (import <nixpkgs> {}), stdenv ? pkgs.stdenv, texlive ? pkgs.texlive, biber ? pkgs.biber }:

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
  src = ./.;
  buildPhase = "latexmk -view=pdf cv.tex";
  installPhase = "mkdir -p $out && mv cv.pdf $out/";
}
