# TODO
{ lib, theme, ... }:
let
  col = import ../colors.nix;
in
{
  config = lib.mkIf (theme == "kanso_mist" || theme == "kanso_ink" || theme == "kanso_zen") {

  home.file.".config/btop/themes/btop.theme".text = /* ini */ ''

    # Main background, empty for terminal default, need to be empty if you want transparent background
    theme[main_bg]=""

    # Main text color
    theme[main_fg]="${col.fg}"

    # Title color for boxes
    theme[title]="${col.blue}"

    # Highlight color for keyboard shortcuts
    theme[hi_fg]="${col.green2}"

    # Background color of selected item in processes box
    theme[selected_bg]="${col.blue}"

    # Foreground color of selected item in processes box
    theme[selected_fg]="${col.zen_bg0}"

    # Color of inactive/disabled text
    theme[inactive_fg]="${col.gray5}"

    # Color of text appearing on top of graphs, i.e uptime and current network graph scaling
    theme[graph_text]="#b7bdf8"

    # Background color of the percentage meters
    theme[meter_bg]="${col.zen_bg2}"

    # Misc colors for processes box including mini cpu graphs, details memory graph and details status text
    theme[proc_misc]="#c6a0f6"

    # Cpu box outline color
    theme[cpu_box]="${col.blue}"

    # Memory/disks box outline color
    theme[mem_box]="${col.blue}"

    # Net up/down box outline color
    theme[net_box]="${col.blue}"

    # Processes box outline color
    theme[proc_box]="${col.blue}"

    # Box divider line and small boxes line color
    theme[div_line]=""

    # Temperature graph colors
    theme[temp_start]="#bd93f9"
    theme[temp_mid]="#ff79c6"
    theme[temp_end]="#ff33a8"

    # CPU graph colors
    theme[cpu_start]="#c6a0f6"
    theme[cpu_mid]="#7dc4e4"
    theme[cpu_end]="#a6da95"

    # Mem/Disk free meter
    theme[free_start]="#ffa6d9"
    theme[free_mid]="#ff79c6"
    theme[free_end]="#ff33a8"

    # Mem/Disk cached meter
    theme[cached_start]="#b1f0fd"
    theme[cached_mid]="#8be9fd"
    theme[cached_end]="#26d7fd"

    # Mem/Disk available meter
    theme[available_start]="#ffd4a6"
    theme[available_mid]="#ffb86c"
    theme[available_end]="#ff9c33"

    # Mem/Disk used meter
    theme[used_start]="#96faaf"
    theme[used_mid]="#50fa7b"
    theme[used_end]="#0dfa49"

    # Download graph colors
    theme[download_start]="#bd93f9"
    theme[download_mid]="#50fa7b"
    theme[download_end]="#8be9fd"

    # Upload graph colors
    theme[upload_start]="#8c42ab"
    theme[upload_mid]="#ff79c6"
    theme[upload_end]="#ff33a8"

    # Process box color gradient for threads, mem and cpu usage
    theme[process_start]="${col.blue}"
    theme[process_mid]="#6E8A98" # mid point of blue and grey5
    theme[process_end]="${col.gray5}"

  '';
  };
}
