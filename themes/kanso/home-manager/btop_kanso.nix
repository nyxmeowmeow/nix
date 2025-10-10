# TODO
{ lib, theme, ... }:
let
  col = import ../colors.nix;
in
{
  config = lib.mkIf (theme == "kanso_mist" || theme == "kanso_ink" || theme == "kanso_zen" || theme == "kantsi") {

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
    theme[graph_text]="${col.fg}"

    # Background color of the percentage meters
    theme[meter_bg]="${col.zen_bg2}"

    # Misc colors for processes box including mini cpu graphs, details memory graph and details status text
    theme[proc_misc]="${col.blue}"

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
    theme[temp_start]="${col.violet}"
    theme[temp_mid]="#BC7990"
    theme[temp_end]="${col.red2}"

    # CPU graph colors
    theme[cpu_start]="${col.blue}"
    theme[cpu_mid]="#859EBD"
    theme[cpu_end]="${col.violet_sat}"

    # Mem/Disk free meter
    theme[free_start]="${col.violet}"
    theme[free_mid]="${col.violet}"
    theme[free_end]="${col.violet}"

    # Mem/Disk cached meter
    theme[cached_start]="${col.aqua}"
    theme[cached_mid]="${col.aqua}"
    theme[cached_end]="${col.aqua}"

    # Mem/Disk available meter
    theme[available_start]="${col.yellow2}"
    theme[available_mid]="${col.yellow2}"
    theme[available_end]="${col.yellow2}"

    # Mem/Disk used meter
    theme[used_start]="${col.green}"
    theme[used_mid]="${col.green}"
    theme[used_end]="${col.green}"

    # Download graph colors
    theme[download_start]="${col.blue}"
    theme[download_mid]="#859EBD"
    theme[download_end]="${col.violet_sat}"

    # Upload graph colors
    theme[upload_start]="${col.blue}"
    theme[upload_mid]="#859EBD"
    theme[upload_end]="${col.violet_sat}"

    # Process box color gradient for threads, mem and cpu usage
    theme[process_start]="${col.blue}"
    theme[process_mid]="#6E8A98"
    theme[process_end]="${col.gray5}"

  '';
  };
}
