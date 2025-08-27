{ lib, theme, config, ... }:
let
  col = import ../colors.nix;
in {
  config = lib.mkIf (theme == "kanso_mist" || theme == "kanso_ink" || theme == "kanso_zen") {

#   programs.walker.theme = {
#     # name = "meow";
#     layout = lib.trivial.importTOML ../../../stuff/walker/black.toml;
#
#   style = ''
# @define-color foreground ${col.fg};
# @define-color background ${col.zen_bg0};
# @define-color color1 ${col.gray5};
# @define-color subtext ${col.gray5};
#
# #window,
# #box,
# #search,
# #password,
# #input,
# #prompt,
# #clear,
# #typeahead,
# #list,
# child,
# scrollbar,
# slider,
# #item,
# #text,
# #label,
# #bar,
# #sub,
# #activationlabel {
#   all: unset;
# }
#
# #cfgerr {
#   background: rgba(255, 0, 0, 0.4);
#   margin-top: 20px;
#   padding: 8px;
#   font-size: 26px;
# }
#
# #window {
#   color: @foreground;
# }
#
# #box {
#   border-radius: 10px;
#   background: @background;
#   padding: 10px;
#   border: 2px solid ${col.blue};
# }
#
# #search {
#   /* background: #24273a; */
#   /* padding: 18px; */
#   font-size: 26px;
# }
#
# #prompt {
#   margin-left: -5px;
#   margin-right: 12px;
#   color: @foreground;
#   opacity: 0;
# }
#
# #clear {
#   color: @foreground;
#   opacity: 1;
# }
#
# #password,
# #input,
# #typeahead {
#   border-radius: 0px;
# }
#
# #input {
#   background: none;
#   font-family: "${config.stylix.fonts.monospace.name}";
# }
#
# #password {
# }
#
# #spinner {
#   padding: 8px;
#   opacity: 0;
# }
#
# #typeahead {
#   color: @foreground;
#   opacity: 1;
# }
#
# #input placeholder {
#   opacity: 0.5;
# }
#
# #list {
# }
#
# child {
#   padding: 0px 8px 0px 8px;
#   /* border-radius: 10px; */
#
#   font-size: 26px;
# }
#
# child:selected,
# child:hover {
#   background: ${col.blue};
#   color: ${col.zen_bg0};
# }
#
# #item {
# }
#
# #icon {
#   margin-right: 8px;
#   margin-left: -5px;
# }
#
# #text {
# }
#
# #label {
#   /* font-weight: 400; */
#   font-family: "${config.stylix.fonts.monospace.name}";
# }
#
# #sub {
#   font-size: 0em;
# }
#
# #activationlabel {
# }
#
# #bar {
# }
#
# .barentry {
# }
#
# .activation #activationlabel {
# }
#
# .activation #text,
# .activation #icon,
# .activation #search {
#   opacity: 0.5;
# }
#   '';
#   };
  };

}
