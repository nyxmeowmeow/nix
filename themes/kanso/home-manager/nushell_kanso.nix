let
col = import ../colors.nix;
in {
  programs.nushell.extraConfig = /* nu */ ''
    let color_scheme = {
      hints: "${col.gray4}"
      search_result: { bg: "${col.altBlue2} fg: "${col.fg}" }
      shape_garbage: { fg: "${col.zen_bg0}" bg: "${col.red}" attr: b}
      shape_filepath: "${col.yellow}"
      shape_directory: "${col.yellow}"
      shape_internalcall: "${col.fg}"
      shape_external: "${col.fg}"
      shape_externalarg: "${col.fg}"
      shape_flag: "${col.fg}"
      shape_keyword: "${col.fg}"
      shape_pipe: "${col.fg}"
    }

    $env.config = {
      color_config: $color_scheme
    }
    '';
}
