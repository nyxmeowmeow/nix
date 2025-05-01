{ ... }: {

  services.kanata = {
    enable = true;
    keyboards = {
      internalKeyboard = {
        devices = [
          "/dev/input/by-id/usb-liliums_Lily58-event-kbd"
          "/dev/input/by-id/usb-liliums_Lily58-event-if02"
        ];

        extraDefCfg = "process-unmapped-keys yes";
        config = ''

(defchords ch 12
  (p          ) p
  (  S-9      ) S-9
  (      S-0  ) S-0
  (          ;) ;
  (p S-9      ) [
  (p     S-0  ) ]
  (  S-9 S-0  ) /
  (p S-9 S-0  ) S-/
  (      S-0 ;) S-1

  (l    ) l
  (  d  ) d
  (    w) w
  (l d  ) S-\
  (  d w) S-8

  (,      ) ,
  (  .    ) .
  (    m  ) m
  (      c) c
  (, .    ) S-7
  (  . m  ) =
  (    m c) +

  (f    ) f
  (  o  ) o
  (    u) u
  (f o  ) S-'

  (n      ) n
  (  r    ) r
  (    t  ) t
  (      s) s
  (n r    ) S-,
  (  r t  ) S-[
  (    t s) esc

  (h      ) h
  (  a    ) a
  (    e  ) e
  (      i) i
  (h a    ) bspc
  (h a e  ) del
  (  a e  ) S-]
  (    e i) S-.
)


(defsrc
  esc   1 2 3 4 5    6 7 8 9 0 -
        b l d w f15  ' f o u j x
  lctrl n r t s g    y h a e i bspc
        , . m c v    k p f16 f17 ; z
         lmet  spc    f18 enter
)

(deflayer default
  _   _     _     _     _     _      _    _     _       _       _     _
      _     @ch_l @ch_d @ch_w S--    _    @ch_f @ch_o   @ch_u   _     _
  @lc @ch_n @ch_r @ch_t @ch_s _      _    @ch_h @ch_a   @ch_e   @ch_i rpt-any
      @ch_, @ch_. @ch_m @ch_c _      _    @ch_p @ch_S-9 @ch_S-0 @ch_; _
                  @lm   @spc              @col @sym
)

(deflayer over
  esc   1 2 3 4 5    6 7 8 9 0 -
        b l d w S--  ' f o u j x
  lctrl n r t s g    y h a e i bspc
        , . m c v    k p _ _ ; z
         lmet spc    h enter
)

(deflayer syms
  f1 f2  f3  f4  f5  f6      f7  home pgdn pgup end   f12
     `   S-` \   S-5 _       `   left down up   right =
  _  1   2   3   4   S-1     S-3 7    8    9    0     rpt-any
     _   _   _   5   _       S-3 6    S-9  S-0  S-;   _
             del _            _    _
)

(defvirtualkeys
  layersyms (layer-toggle syms)
)


(defalias
  sym (tap-hold-press 120 120 enter (layer-toggle syms))
  lc (tap-hold-press 120 120 - lctl)
  lm (tap-hold-press 120 120 bspc lmet)
  col (tap-hold-press 120 120 S-; lctl) 
  spc (tap-hold-press 120 120 spc (on-idle 100 toggle-vkey layersyms))

  ch_p   (chord ch p)
  ch_S-9 (chord ch S-9)
  ch_S-0 (chord ch S-0)
  ch_;   (chord ch ;)

  ch_, (chord ch ,)
  ch_. (chord ch .)
  ch_m (chord ch m)
  ch_c (chord ch c)

  ch_f (chord ch f)
  ch_o (chord ch o)
  ch_u (chord ch u)

  ch_l (chord ch l)
  ch_d (chord ch d)
  ch_w (chord ch w)

  ch_n (chord ch n)
  ch_r (chord ch r)
  ch_t (chord ch t)
  ch_s (chord ch s)

  ch_h (chord ch h)
  ch_a (chord ch a)
  ch_e (chord ch e)
  ch_i (chord ch i)
)

        '';
      };

    };

  };
  # Enable the uinput module
  boot.kernelModules = [ "uinput" ];

  # Enable uinput
  hardware.uinput.enable = true;

  # Set up udev rules for uinput
  services.udev.extraRules = ''
    KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
  '';

  # Ensure the uinput group exists
  users.groups.uinput = { };

  systemd.services.kanata-internalKeyboard.serviceConfig = {
    # User = "root";
    SupplementaryGroups = [
      "input"
      "uinput"
    ];
  };

}
