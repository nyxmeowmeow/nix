{ inputs, ... }: {

  imports = [
    inputs.walker.homeManagerModules.default
  ];

  programs.walker.theme = {
  name = "meow";
  layout = ''

[ui.anchors]
bottom = true
left = true
right = true
top = true

[ui.window]
h_align = "fill"
v_align = "fill"

[ui.window.box]
h_align = "center"
width = 394

[ui.window.box.bar]
orientation = "horizontal"
position = "end"

[ui.window.box.bar.entry]
h_align = "fill"
h_expand = true

[ui.window.box.bar.entry.icon]
h_align = "center"
h_expand = true
pixel_size = 24
theme = ""

[ui.window.box.margins]
top = 480

[ui.window.box.ai_scroll]
name = "aiScroll"
h_align = "fill"
v_align = "fill"
max_height = 300
min_width = 400
height = 300
width = 400

[ui.window.box.ai_scroll.margins]
top = 8

[ui.window.box.ai_scroll.list]
name = "aiList"
orientation = "vertical"
width = 400
spacing = 10

[ui.window.box.ai_scroll.list.item]
name = "aiItem"
h_align = "fill"
v_align = "fill"
x_align = 0
y_align = 0
wrap = true

[ui.window.box.scroll.list]
max_height = 386
max_width = 350
min_width = 350
width = 350

[ui.window.box.scroll.list.item.activation_label]
h_align = "fill"
v_align = "fill"
width = 20
x_align = 0.5
y_align = 0.5

[ui.window.box.scroll.list.item.icon]
pixel_size = 26
theme = ""

[ui.window.box.scroll.list.margins]
top = 8

[ui.window.box.search.prompt]
name = "prompt"
icon = ""
theme = ""
pixel_size = 18
h_align = "center"
v_align = "center"

[ui.window.box.search.clear]
name = "clear"
icon = ""
theme = ""
pixel_size = 18
h_align = "center"
v_align = "center"

[ui.window.box.search.input]
h_align = "fill"
h_expand = true
icons = true

[ui.window.box.search.spinner]
hide = true
  '';

  style = ''
@define-color foreground #cad3f5;
@define-color background #000000;
@define-color color1 #363a4f;
@define-color subtext #a5adcb;

#window,
#box,
#aiScroll,
#aiList,
#search,
#password,
#input,
#prompt,
#clear,
#typeahead,
#list,
child,
scrollbar,
slider,
#item,
#text,
#label,
#bar,
#sub,
#activationlabel {
  all: unset;
}

#cfgerr {
  background: rgba(255, 0, 0, 0.4);
  margin-top: 20px;
  padding: 8px;
  font-size: 26px;
}

#window {
  color: @foreground;
}

#box {
  border-radius: 10px;
  background: @background;
  padding: 10px;
  border: 2px solid #b7bdf8;
}

#search {
  /* background: #24273a; */
  /* padding: 18px; */
  font-size: 26px;
}

#prompt {
  margin-left: -5px;
  margin-right: 12px;
  color: @foreground;
  opacity: 0;
}

#clear {
  color: @foreground;
  opacity: 1;
}

#password,
#input,
#typeahead {
  border-radius: 0px;
}

#input {
  background: none;
  font-family: "Iosevka Nerd Font Mono";
}

#password {
}

#spinner {
  padding: 8px;
  opacity: 0;
}

#typeahead {
  color: @foreground;
  opacity: 1;
}

#input placeholder {
  opacity: 0.5;
}

#list {
}

child {
  padding: 0px 8px 0px 8px;
  /* border-radius: 10px; */

  font-size: 26px;
}

child:selected,
child:hover {
  background: #b7bdf8;
  color: #000000;
}

#item {
}

#icon {
  margin-right: 8px;
  margin-left: -5px;
}

#text {
}

#label {
  /* font-weight: 400; */
  font-family: "Iosevka Nerd Font Mono";
}

#sub {
  font-size: 0em;
}

#activationlabel {
}

#bar {
}

.barentry {
}

.activation #activationlabel {
}

.activation #text,
.activation #icon,
.activation #search {
  opacity: 0.5;
}

.aiItem {
  padding: 10px;
  border-radius: 2px;
  color: @foreground;
  background: @background;
}

.aiItem.user {
  padding-left: 0;
  padding-right: 0;
}

.aiItem.assistant {
  background: lighter(@background);
}
  '';
  };

}
