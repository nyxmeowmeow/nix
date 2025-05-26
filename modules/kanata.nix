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
        config = /* rust */ ''

(defsrc
  esc   1 2 3 4 5    6 7 8 9 0 -
  q     b f d w p    ' l o u j x
  lctrl n s t c y    m h a e i bspc
  f18   , . k g v    / f15 f16 f17 ; z
      lmet r lsft    f14 spc rsft ralt
)

(deflayer default
  _   _     _     _     _     _      _ _     _      _      _     _
  _   @ch_b @ch_f @ch_d @ch_w _      _ @ch_l @ch_o  @ch_u  @ch_j _
  @lc @ch_n @ch_s @ch_t @ch_c _      _ @ch_h @ch_a  @ch_e  @ch_i @rpeat
  S-; @ch_, @ch_. @ch_k @ch_g _      _ @ch__ @ch_lp @ch_rp @ch_; _
                  @lm   _ @magic     @sym _  @rs tab
)

(deflayer over
  esc   1 2 3 4 5    6 7 8 9 0 -
  q     b f d w p    ' l o u j x
  lctrl n s t c y    m h a e i bspc
  tab   , . k g v    / 8 9 0 ; z
      lmet r lsft    enter spc rsft tab
)

(deflayer syms
  f1 f2  f3  f4  f5  f6      f7  home pgdn pgup end   f12
  _  `   S-` '   '   _       _   left down up   right _
  _  1   2   3   4   _       _   7    8    9    0     rpt-any
  _  _   .   _   5   _       _   6    @dcol _   _     _
             _   _   lsft    _   _    _    _
)

(defchords ch 12
  (b      ) b
  (  f    ) f
  (    d  ) d
  (      w) w
  (b f    ) S-,
  (  f d  ) =
  (    d w) S-8

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
  (n s    ) [
  (  s t  ) S-[
  (    t c) (one-shot-press 300 lsft)
  (  s t c) del

  (h      ) h
  (  a    ) a
  (    e  ) e
  (      i) i
  (h a    ) (one-shot-press 300 rsft)
  (  a e  ) S-]
  (    e i) ]

  (,      ) ,
  (  .    ) .
  (    k  ) k
  (      g) g
  (, .    ) S-7
  (  . k  ) S-\
  (    k g) \

  (S--          ) S--
  (    S-9      ) S-9
  (        S-0  ) S-0
  (            ;) ;
  (S-- S-9      ) S-3
  (S--     S-0  ) S-5
  (    S-9 S-0  ) S-/
  (        S-0 ;) S-1
)

(defalias
  sym (tap-hold-press 120 120 enter (layer-toggle syms))
  lc (tap-hold-press 120 120 - lctl)
  lm (tap-hold-press 120 120 esc lmet)
  rs (tap-hold-press 120 120 bspc lsft)
  ;;col (tap-hold-press 120 120 S-; lctl)

  dcol (macro S-; S-;)

  ch_b (chord ch b)
  ch_f (chord ch f)
  ch_d (chord ch d)
  ch_w (chord ch w)

  ch_l (chord ch l)
  ch_o (chord ch o)
  ch_u (chord ch u)
  ch_j (chord ch j)

  ch_n (chord ch n)
  ch_s (chord ch s)
  ch_t (chord ch t)
  ch_c (chord ch c)

  ch_h (chord ch h)
  ch_a (chord ch a)
  ch_e (chord ch e)
  ch_i (chord ch i)

  ch_, (chord ch ,)
  ch_. (chord ch .)
  ch_k (chord ch k)
  ch_g (chord ch g)

  ch__  (chord ch S--)
  ch_lp (chord ch S-9)
  ch_rp (chord ch S-0)
  ch_;  (chord ch ;)

  magic (switch
    ((key-history spc 1)) (tap-hold-press 120 120 enter (layer-toggle syms)) break
    ((key-history enter 1)) (tap-hold-press 120 120 enter (layer-toggle syms)) break


    ((key-history lsft 1)) (caps-word-custom 1000
             (q b f d w p l o u j x n s t c y m h a e i k g v)
             (lsft -)) break

  ;; // #include <
    ((key-history 3 1)) (macro i n c l u d e spc S-,) break

  ;; // sfb
    ((key-history o 1)) (macro a) break
    ((key-history a 1)) (macro o) break
    ((key-history u 1)) (macro e) break
    ((key-history e 1)) (macro u) break

    ((and(key-history e 2) (key-history s 1))) (macro e) break
    ((and(key-history e 2) (key-history y 1))) (macro e) break
    ((and(key-history e 2) (key-history v 1))) (macro e) break

    ((key-history w 1)) (macro y) break
    ((key-history c 1)) (macro y) break
    ((key-history p 1)) (macro y) break
    ((key-history y 1)) (macro p) break
    ((key-history j 1)) (macro u s t) break

  ;; // non-sfb repeat key for >
    ((key-history . 1)) (macro S-.) break
  ;; // non-sfb ; for ]
    ((key-history ] 1)) (macro ;) break
  ;; // auto ; for {}
    ((key-history { 1)) (macro S-] ; left left) break

    ((key-history = 1)) (macro S-.) break
    ((key-history 0 1)) (macro S-0) break
    () rpt break
  )

  ;; // normal rpt except for syms
  rpeat (switch
    ((key-history , 1)) (macro S-,) break
    ((key-history \ 1)) (macro S-\) break
    ((key-history 7 1)) (macro S-7) break
    ((key-history 9 1)) (macro S-9) break
    ((key-history 0 1)) (macro S-0) break
    () rpt break
  )

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
