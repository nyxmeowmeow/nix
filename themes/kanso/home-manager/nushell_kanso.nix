{ lib, theme, ... }:
let
  col = import ../colors.nix;
in {
  config = lib.mkIf (lib.hasPrefix "kan" theme) {

  programs.nushell.extraConfig = /* nu */ ''
    let color_scheme = {
      hints: "${col.gray4}"
      search_result: { bg: "${col.altBlue2}" fg: "${col.fg}" }
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
  };
}
