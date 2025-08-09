let
  col = import ../colors.nix;
in {
  programs.nushell.extraConfig = /* nu */ ''
    let color_scheme = {
      hints: "${col.surface1}"
      search_result: { bg: cyan fg: "#cad3f5" }
      shape_garbage: { fg: "${col.base}" bg: "${col.red}" attr: b}
      shape_filepath: "${col.green}"
      shape_directory: "${col.green}"
      shape_internalcall: "${col.text}"
      shape_external: "${col.text}"
      shape_externalarg: "${col.text}"
      shape_flag: "${col.text}"
      shape_keyword: "${col.lavender}"
      shape_pipe: "${col.lavender}"
    }

    $env.config = {
      color_config: $color_scheme
    }
    '';
}
