{
  programs.nushell.extraConfig = /* nu */ ''
    let color_scheme = {
      hints: "#886C9C"
      search_result: { bg: cyan fg: "#cad3f5" }
      shape_garbage: { fg: "#24273a" bg: "#ed8796" attr: b}
      shape_filepath: green
      shape_directory: green
      shape_internalcall: purple
      shape_external: purple
      shape_externalarg: "#A4A0E8"
      shape_flag: "#A4A0E8"
      shape_keyword: "#A4A0E8"
      shape_pipe: purple
    }

    $env.config = {
      color_config: $color_scheme
    }

    '';
}
