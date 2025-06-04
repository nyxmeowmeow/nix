{

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
        config = /* rust */ ''

(defsrc
  esc   1 2 3 4 5    6 7 8 9 0 -
  f18   b f d w p    ' l o u j x
  lctrl n s t c y    m h a e i bspc
  q     , . k g v    / f15 f16 f17 ; z
      lmet r lsft    ent spc rsft ralt
)

(deflayer default
  _   _     _     _     _     _      _ _     _      _      _     _
  S-;   @ch_b @ch_f @ch_d @ch_w _      _ @ch_l @ch_o  @ch_u  @ch_j _
  @lc @ch_n @ch_s @ch_t @ch_c _      _ @ch_h @ch_a  @ch_e  @ch_i _
  q   @ch_, @ch_. @ch_k @ch_g _      _ @ch__ @ch_lp @ch_rp @ch_; _
                  @lm   _ _        @sym _  @rs tab
)
(deflayer syms
  f1 f2  f3  f4  f5  f6      f7  home pgdn pgup end   f12
  _  `   _   _   _   _       _   left down up   right _
  _  1   2   3   4   _       _   7    8    9    0     rpt
  _  _   .   _   5   _       _   6    _    _    _     _
             _   _   lsft    _   _    _    _
)

(defchords ch 15
  (b      ) b
  (  f    ) f
  (    d  ) d
  (      w) w

  (l    )   l
  (  o    ) o
  (    u  ) u
  (      j) j
  (l o    ) S-'
  (  o u  ) +
  (    u j) S-.

  (n      ) n
  (  s    ) s
  (    t  ) t
  (      c) c

  (h      ) h
  (  a    ) a
  (    e  ) e
  (      i) i

  (,      ) ,
  (  .    ) .
  (    k  ) k
  (      g) g

  (S--          ) S--
  (    S-9      ) S-9
  (        S-0  ) S-0
  (            ;) ;
)

(defalias
  sym (tap-hold-press 120 120 enter (layer-toggle syms))
  lc (tap-hold-press 120 120 - lctl)
  lm (tap-hold-press 120 120 esc lmet)
  rs (tap-hold-press 120 120 bspc lsft)



;; chords disabled if pressed < 40ms after a different key


  ch_b (switch ((key-timing 2 less-than 40)) _ break () (chord ch b) break)
  ch_f (switch ((key-timing 2 less-than 40)) _ break () (chord ch f) break)
  ch_d (switch ((key-timing 2 less-than 40)) _ break () (chord ch d) break)
  ch_w (switch ((key-timing 2 less-than 40)) _ break () (chord ch w) break)

  ch_l (switch ((key-timing 2 less-than 40)) _ break () (chord ch l) break)
  ch_o (switch ((key-timing 2 less-than 40)) _ break () (chord ch o) break)
  ch_u (switch ((key-timing 2 less-than 40)) _ break () (chord ch u) break)
  ch_j (switch ((key-timing 2 less-than 40)) _ break () (chord ch j) break)

  ch_n (switch ((key-timing 2 less-than 40)) _ break () (chord ch n) break)
  ch_s (switch ((key-timing 2 less-than 40)) _ break () (chord ch s) break)
  ch_t (switch ((key-timing 2 less-than 40)) _ break () (chord ch t) break)
  ch_c (switch ((key-timing 2 less-than 40)) _ break () (chord ch c) break)

  ch_h (switch ((key-timing 2 less-than 40)) _ break () (chord ch h) break)
  ch_a (switch ((key-timing 2 less-than 40)) _ break () (chord ch a) break)
  ch_e (switch ((key-timing 2 less-than 40)) _ break () (chord ch e) break)
  ch_i (switch ((key-timing 2 less-than 40)) _ break () (chord ch i) break)

  ch_, (switch ((key-timing 2 less-than 40)) _ break () (chord ch ,) break)
  ch_. (switch ((key-timing 2 less-than 40)) _ break () (chord ch .) break)
  ch_k (switch ((key-timing 2 less-than 40)) _ break () (chord ch k) break)
  ch_g (switch ((key-timing 2 less-than 40)) _ break () (chord ch g) break)

  ch__  (switch ((key-timing 2 less-than 40)) _ break () (chord ch S--) break)
  ch_lp (switch ((key-timing 2 less-than 40)) _ break () (chord ch S-9) break)
  ch_rp (switch ((key-timing 2 less-than 40)) _ break () (chord ch S-0) break)
  ch_;  (switch ((key-timing 2 less-than 40)) _ break () (chord ch ;) break)




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
