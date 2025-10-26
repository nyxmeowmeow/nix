{
  home.file.".config/rustfmt.toml".text = ''
    edition = 2024;
    style_edition = 2024;

    # max_width

    # array_width
    # attr_fn_like_width
    # chain_width
    # comment_width


    blank_lines_upper_bound = 1;
    combine_control_expr = true;
    condense_wildcard_suffixes = true;

    control_brace_style = "AlwaysSameLine";
    empty_item_single_line = false;
    fn_single_line = false;
    single_line_if_else_max_width = 0;
    single_line_let_else_max_width = 0;
    struct_lit_single_line = false;

    hex_literal_case = "lower";
    match_arm_blocks = false;


    imports_granularity = "Module";
    reorder_imports = true;

    reorder_impl_items = false;

    trailing_semicolon = false;
    use_try_shorthand = true;
  '';
}
