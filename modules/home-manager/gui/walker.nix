{
  inputs,
  lib,
  ...
}: {
  imports = [
    inputs.walker.homeManagerModules.default
  ];

  programs.walker = {
    enable = true;
    runAsService = true;
    config = {
      theme = "meow";
      # placeholders."default" = { input = "Search"; list = "Example"; };
      # providers.prefixes = [
      # {provider = "websearch"; prefix = "+";}
      # {provider = "providerlist"; prefix = "_";}
      # ];
      # keybinds.quick_activate = ["F1" "F2" "F3"];
    };

    themes = {
      "meow" = {
# Check out the default css theme as an example https://github.com/abenz1267/walker/blob/master/resources/themes/default/style.css
        style = ''
@define-color foreground #C5C9C7;
@define-color background #090E13CC;
@define-color accent #7FB4CA;
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
  border: 3px solid @accent;
}

#search {
  /* background: #24273a; */
  /* padding: 18px; */
  font-size: 22px;
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
  background: @accent;
  color: @background;
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

# Check out the default layouts for examples https://github.com/abenz1267/walker/tree/master/resources/themes/default
        layouts = {
          "layout" = ''
<?xml version="1.0" encoding="UTF-8"?>
<interface>
  <requires lib="gtk" version="4.0"></requires>
  <object class="GtkWindow" id="Window">
    <style>
      <class name="window"></class>
    </style>
    <property name="resizable">true</property>
    <property name="title">Walker</property>
    <child>
      <object class="GtkBox" id="BoxWrapper">
        <style>
          <class name="box-wrapper"></class>
        </style>
        <property name="overflow">hidden</property>
        <property name="orientation">horizontal</property>
        <property name="valign">center</property>
        <property name="halign">center</property>
        <property name="width-request">600</property>
        <property name="height-request">550</property>
        <child>
          <object class="GtkBox" id="Box">
            <style>
              <class name="box"></class>
            </style>
            <property name="orientation">vertical</property>
            <property name="hexpand-set">true</property>
            <property name="hexpand">true</property>
            <property name="spacing">10</property>
            <child>
              <object class="GtkBox" id="SearchContainer">
                <style>
                  <class name="search-container"></class>
                </style>
                <property name="overflow">hidden</property>
                <property name="orientation">horizontal</property>
                <property name="halign">fill</property>
                <property name="hexpand-set">true</property>
                <property name="hexpand">true</property>
                <child>
                  <object class="GtkEntry" id="Input">
                    <style>
                      <class name="input"></class>
                    </style>
                    <property name="halign">fill</property>
                    <property name="hexpand-set">true</property>
                    <property name="hexpand">true</property>
                  </object>
                </child>
              </object>
            </child>
            <child>
              <object class="GtkBox" id="ContentContainer">
                <style>
                  <class name="content-container"></class>
                </style>
                <property name="orientation">horizontal</property>
                <property name="spacing">10</property>
                <child>
                  <object class="GtkLabel" id="ElephantHint">
                    <style>
                      <class name="elephant-hint"></class>
                    </style>
                    <property name="label">Waiting for elephant...</property>
                    <property name="hexpand">true</property>
                    <property name="vexpand">true</property>
                    <property name="valign">0.5</property>
                  </object>
                </child>
                <child>
                  <object class="GtkLabel" id="Placeholder">
                    <style>
                      <class name="placeholder"></class>
                    </style>
                    <property name="label">No Results</property>
                    <property name="hexpand">true</property>
                    <property name="vexpand">true</property>
                    <property name="valign">0.5</property>
                  </object>
                </child>
                <child>
                  <object class="GtkScrolledWindow" id="Scroll">
                    <style>
                      <class name="scroll"></class>
                    </style>
                    <property name="can_focus">false</property>
                    <property name="overlay-scrolling">true</property>
                    <property name="hexpand">true</property>
                    <property name="vexpand">true</property>
                    <property name="max-content-width">500</property>
                    <property name="min-content-width">500</property>
                    <property name="max-content-height">400</property>
                    <property name="propagate-natural-height">true</property>
                    <property name="propagate-natural-width">true</property>
                    <property name="hscrollbar-policy">automatic</property>
                    <property name="vscrollbar-policy">automatic</property>
                    <child>
                      <object class="GtkGridView" id="List">
                        <style>
                          <class name="list"></class>
                        </style>
                        <property name="max_columns">1</property>
                        <property name="can_focus">false</property>
                      </object>
                    </child>
                  </object>
                </child>
                <child>
                  <object class="GtkBox" id="Preview">
                    <style>
                      <class name="preview"></class>
                    </style>
                  </object>
                </child>
              </object>
            </child>
            <child>
              <object class="GtkBox" id="KeybindsWrapper">
                <property name="hexpand">true</property>
                <style>
                  <class name="keybinds-wrapper"></class>
                </style>
                <child>
                  <object class="GtkBox" id="Keybinds">
                    <property name="hexpand">true</property>
                    <property name="halign">end</property>
                    <property name="spacing">10</property>
                    <property name="margin-top">10</property>
                    <style>
                      <class name="keybinds"></class>
                    </style>
                  </object>
                </child>
              </object>
            </child>
            <child>
              <object class="GtkLabel" id="Error">
                <style>
                  <class name="error"></class>
                </style>
                <property name="xalign">0</property>
               <property name="visible">false</property>
              </object>
            </child>
          </object>
        </child>
      </object>
    </child>
  </object>
</interface>
          '';
          # "item_calc" = '''';
# other provider layouts
        };
      };
# more themes
    };
  };
}
