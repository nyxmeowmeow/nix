{ pkgs, ... }: {
  programs.nixvim = {
    extraPlugins = [ pkgs.vimPlugins.smear-cursor-nvim ];
    extraConfigLua = ''
      require('smear-cursor-nvim').setup({
          opts = {


-- How fast the smear's head moves towards the target.
-- 0: no movement, 1: instantaneous
M.stiffness = 0.8

-- How fast the smear's tail moves towards the target.
-- 0: no movement, 1: instantaneous
M.trailing_stiffness = 0.7

-- Initial velocity factor in the direction opposite to the target
M.anticipation = 0.5

-- Velocity reduction over time. O: no reduction, 1: full reduction
M.damping = 0.65

-- Controls if middle points are closer to the head or the tail.
-- < 1: closer to the tail, > 1: closer to the head
M.trailing_exponent = 2

-- Stop animating when the smear's tail is within this distance (in characters) from the target.
M.distance_stop_animating = 0.1

-- Set of parameters for insert mode
M.stiffness_insert_mode = 0.5
M.trailing_stiffness_insert_mode = 0.5
M.damping_insert_mode = 0.7
M.trailing_exponent_insert_mode = 1
M.distance_stop_animating_vertical_bar = 0.875 -- Can be decreased (e.g. to 0.1) if using legacy computing symbols

-- When to switch between rasterization methods
M.max_slope_horizontal = 0.5
M.min_slope_vertical = 2

M.color_levels = 16 -- Minimum 1, don't set manually if using cterm_cursor_colors
M.gamma = 2.2 -- For color blending
M.max_shade_no_matrix = 0.75 -- 0: more overhangs, 1: more matrices
M.matrix_pixel_threshold = 0.7 -- 0: all pixels, 1: no pixel
M.matrix_pixel_threshold_vertical_bar = 0.3 -- 0: all pixels, 1: no pixel
M.matrix_pixel_min_factor = 0.5 -- 0: all pixels, 1: no pixel
M.volume_reduction_exponent = 0.3 -- 0: no reduction, 1: full reduction
M.minimum_volume_factor = 0.7 -- 0: no limit, 1: no reduction
M.max_length = 25 -- Maximum smear length
M.max_length_insert_mode = 1





          smear_to_cmd = false

          -- If the smear goes to the wrong location when enabled, try increasing `delay_after_key`.
          smear_terminal_mode = false

          time_interval = 6 -- milliseconds


          -- Smear cursor when switching buffers or windows.
          smear_between_buffers = true,

          -- Smear cursor when moving within line or to neighbor lines.
          -- Use `min_horizontal_distance_smear` and `min_vertical_distance_smear` for finer control
          smear_between_neighbor_lines = true,

          -- Draw the smear in buffer space instead of screen space when scrolling
          scroll_buffer_space = true,

          -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
          -- Smears will blend better on all backgrounds.
          legacy_computing_symbols_support = true,

          -- Smear cursor in insert mode.
          -- See also `vertical_bar_cursor_insert_mode` and `distance_stop_animating_vertical_bar`.
          smear_insert_mode = true,
          },
          })
    '';
  };
}
