{ pkgs ? (import <nixpkgs> { }), stdenv ? pkgs.stdenv, texlive ? pkgs.texlive, biber ? pkgs.biber }:

let
  tex = texlive.combine {
    inherit (texlive)
      scheme-small
      moderncv
      fontawesome5
      academicons
      collection-bibtexextra
      collection-latexextra
      bibtex biblatex logreq xstring
      latexmk;
  };
in
stdenv.mkDerivation {
  name = "cv";
  buildInputs = [ tex biber ];
  src = pkgs.lib.sourceFilesBySuffices ./. [ ".tex" ".bib" ".cls" ".bst" ];
  buildPhase = "latexmk -view=pdf cv.tex";
  installPhase = "mkdir -p $out && mv cv.pdf $out/";
}
