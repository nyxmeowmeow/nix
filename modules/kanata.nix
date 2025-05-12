{ ... }: {

  services.kanata = {
    enable = true;
    keyboards = {
      lily58 = {
        port = 10000;
        devices = [
          "/dev/input/by-id/usb-liliums_Lily58-event-kbd"
          "/dev/input/by-id/usb-liliums_Lily58-event-if02"
        ];

        extraDefCfg = "process-unmapped-keys yes";

        # configFile = "/home/meow/.config/kanata/symbols.kbd";
        config = ''
(defchords ch 12
  (S--          ) S--
  (    S-9      ) S-9
  (        S-0  ) S-0
  (            ;) ;
  (S-- S-9      ) [
  (S--     S-0  ) ]
  (    S-9 S-0  ) S-/
  (        S-0 ;) S-1

  (f    ) f
  (  d  ) d
  (    w) w
  (f d  ) S-\
  (  d w) S-8

  (,      ) ,
  (  .    ) .
  (    k  ) k
  (      g) g
  (, .    ) S-7
  (  . k  ) =
  (    k g) +

  (l    ) l
  (  o  ) o
  (    u) u
  (l o  ) S-'

  (n      ) n
  (  s    ) s
  (    t  ) t
  (      c) c
  (n s    ) S-,
  (  s t  ) S-[
  (    t c) esc

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
  q     b f d w p    ' l o u j x
  lctrl n s t c y    m h a e i bspc
  f18   , . k g v    / f15 f16 f17 ; z
      lmet r lsft    f14 spc
)

(deflayer default
  _   _     _     _     _     _      _ _     _      _      _     _
  _   _     @ch_f @ch_d @ch_w _      _ @ch_l @ch_o  @ch_u  _     _
  @lc @ch_n @ch_s @ch_t @ch_c _      _ @ch_h @ch_a  @ch_e  @ch_i rpt-any
  S-; @ch_, @ch_. @ch_k @ch_g _      _ @ch__ @ch_lp @ch_rp @ch_; _
                  @lm   _     _      @sym _
)

(deflayer over
  esc   1 2 3 4 5    6 7 8 9 0 -
  q     b f d w p    ' l o u j x
  lctrl n s t c y    m h a e i bspc
  _     , . k g v    / 8 9 0 ; z
      lmet r lsft    enter spc
)

(deflayer syms
  f1 f2  f3  f4  f5  f6      f7  home pgdn pgup end   f12
  _  `   S-` \   S-5 _       `   left down up   right _
  _  1   2   3   4   _       S-3 7    8    9    0     rpt-any
  _  _   _   _   5   _       S-3 6    _    _    _     _
             del _   _       _   _
)



(defalias
  sym (tap-hold-press 120 120 enter (layer-toggle syms))
  lc (tap-hold-press 120 120 - lctl)
  lm (tap-hold-press 120 120 tab lmet)
  ;;col (tap-hold-press 120 120 S-; lctl) 

  ch__  (chord ch S--)
  ch_lp (chord ch S-9)
  ch_rp (chord ch S-0)
  ch_;  (chord ch ;)

  ch_, (chord ch ,)
  ch_. (chord ch .)
  ch_k (chord ch k)
  ch_g (chord ch g)

  ch_l (chord ch l)
  ch_o (chord ch o)
  ch_u (chord ch u)

  ch_f (chord ch f)
  ch_d (chord ch d)
  ch_w (chord ch w)

  ch_n (chord ch n)
  ch_s (chord ch s)
  ch_t (chord ch t)
  ch_c (chord ch c)

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

  systemd.services.kanata-lily58.serviceConfig = {
    # User = "root";
    SupplementaryGroups = [
      "input"
      "uinput"
    ];
  };

}
