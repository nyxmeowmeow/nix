{ lib, ... }: {
  programs.walker.theme = {
    # name = "meow";
    layout = lib.trivial.importTOML ../../../stuff/walker/black.toml;

  style = ''
@define-color foreground #cad3f5;
@define-color background #000000;
@define-color color1 #363a4f;
@define-color subtext #a5adcb;

#window,
#box,
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
  '';
  };

}
