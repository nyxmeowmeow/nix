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

#chords-v2-min-idle 40
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
  S-; @ch_b @ch_f @ch_d @ch_w _      _ @ch_l @ch_o  @ch_u  @ch_j _
  @lc @ch_n @ch_s @ch_t @ch_c _      _ @ch_h @ch_a  @ch_e  @ch_i @rpeat
  q   @ch_, @ch_. @ch_k @ch_g _      _ @ch__ @ch_lp @ch_rp @ch_; _
                  @lm  _ @magic      @ent @sc @rs tab
)

(deflayer over
  esc   1 2 3 4 5    6 7 8 9 0 -
  tab   b f d w p    ' l o u j x
  lctrl n s t c y    m h a e i bspc
  q     , . k g v    / 8 9 0 ; z
      lmet r lsft    enter spc rsft tab
)

(deflayer syms
  f1  f2  f3  f4  f5  f6      f7  home pgdn pgup end   f12
  _   ,   .   `   `   _       _   left down up   right _
  _   1   2   3   4   _       _   7    8    9    0     rpt
  _   0   9   8   5   _       _   6    3    2    1     _
              _   @cw lsft    _   _    _    _
)

(deflayer win
  _  _   _   _   _   _       _   _    _    _    _     _
  _  _   @fl _   _   _       _   _    _    _    _     _
  _  _   @sp @wt @cn _       _   @wl  @wd  @wu  @wr   _
  _  _   _   _   _   _       _   _    _    _    _     _
             _   _   _       _   _    _    _
)

(defchords ch 15

  ;;crackhead idea
  ;;(h c) 1
  ;;(a c) 2
  ;;(e c) 3
  ;;(i c) 4
  ;;(h t) 5
  ;;(a t) 6
  ;;(e t) 7
  ;;(i t) 8
  ;;(a s) 9
  ;;(e s) 0


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
  (n s    ) (one-shot-press 300 (layer-toggle syms))
  (  s t  ) S-[
  (  s   c) S-`
  (    t c) [

  (h      ) h
  (  a    ) a
  (    e  ) e
  (      i) i
  (h a    ) ]
  (h   e  ) del
  (  a e  ) S-]
  (    e i) (one-shot-press 300 (layer-toggle syms))

  (,      ) (tap-hold-press 110 110 , lsft)
  (  .    ) @per?
  (    k  ) k
  (      g) g
  (, .    ) \
  (  . k  ) S-\
  (    k g) S-1

  (S--          ) S--
  (    S-9      ) S-9
  (        S-0  ) @rp?
  (            ;) @close
  (S-- S-9      ) S-3
  (S--     S-0  ) S-5
  (    S-9 S-0  ) S-/
  (        S-0 ;) S-7
)

(defseq
  float (M-g f)
)

(defvirtualkeys
  float (macro M-S-C-A-1)
)

(defalias
  ;;sym (tap-hold-press 120 120 enter (layer-toggle syms))
  wi (tap-hold-press 120 120 enter (layer-toggle win))
  lc (tap-hold-press 120 120 - lctl)
  lm (tap-hold-press 120 120 esc lmet)
  rs (tap-hold-press 120 120 bspc lsft)
  ;;col (tap-hold-press 120 120 S-; lctl)

  ;;dr (dynamic-macro-record 0)
  ;;dp (dynamic-macro-play 0)
  ;;dms dynamic-macro-record-stop
  ;;dst (dynamic-macro-record-stop-truncate 1)


  win (switch
    (lmet rmet) (layer-while-held win) break
    () g break
  )

  cw (caps-word-custom 1000
    (q b f d w p l o u j x n s t c y m h a e i k g v)
    (lsft -)
  )


   ent (switch
    ((and
    (key-history lsft 1) 
    (key-timing 1 less-than 120))) (macro (unmod , enter)) break
    ((and
    (key-history rsft 1) 
    (key-timing 1 less-than 120))) (macro (unmod ; enter)) break

     ;;(rsft) (macro (unmod ; enter)) break
     ;;(lsft) (macro (unmod , enter)) break
     () @wi break
   )


  ;; easier (); roll
  semi? (switch
    ((and
      (or
      (key-history ] 1)
      (key-history . 1) 
      (key-history 0 1)) 
    (key-timing 1 less-than 120))) _ break
    () (tap-hold-press 110 110 ; rsft) break)


  ;; easier ); roll
   close (switch
     (rctl) (macro S-((unmod (rctl) 0)) (unmod (rctl) ;)) break
     () @semi? break
   )


  rp? (switch
    ((and
    (key-history 9 1) 
    (key-timing 1 less-than 120))) (macro S-0) break
    () (tap-hold-press 110 110 S-0 rctl) break
  )

  per? (switch
    ((key-timing 1 less-than 120)) _ break ()
    (tap-hold-press 110 110 . lctl) break
  )


  ;; easier `, `
  sc (switch
    (lsft) (multi (release-key lsft) (macro , spc)) break
    () spc break
  )


  ;; chords disabled if pressed < 40ms after a different key

  ch_b (switch ((key-timing 1 less-than 40)) _ break () (chord ch b) break)
  ch_f (switch ((key-timing 1 less-than 40)) _ break () (chord ch f) break)
  ch_d (switch ((key-timing 1 less-than 40)) _ break () (chord ch d) break)
  ch_w (switch ((key-timing 1 less-than 40)) _ break () (chord ch w) break)

  ch_l (switch ((key-timing 1 less-than 40)) _ break () (chord ch l) break)
  ch_o (switch ((key-timing 1 less-than 40)) _ break () (chord ch o) break)
  ch_u (switch ((key-timing 1 less-than 40)) _ break () (chord ch u) break)
  ch_j (switch ((key-timing 1 less-than 40)) _ break () (chord ch j) break)

  ch_n (switch ((key-timing 1 less-than 40)) _ break () (chord ch n) break)
  ch_s (switch ((key-timing 1 less-than 40)) _ break () (chord ch s) break)
  ch_t (switch ((key-timing 1 less-than 40)) _ break () (chord ch t) break)
  ch_c (switch ((key-timing 1 less-than 40)) _ break () (chord ch c) break)

  ch_h (switch ((key-timing 1 less-than 40)) _ break () (chord ch h) break)
  ch_a (switch ((key-timing 1 less-than 40)) _ break () (chord ch a) break)
  ch_e (switch ((key-timing 1 less-than 40)) _ break () (chord ch e) break)
  ch_i (switch ((key-timing 1 less-than 40)) _ break () (chord ch i) break)

  ch_, (switch ((key-timing 1 less-than 40)) _ break () (chord ch ,) break)
  ch_. (switch ((key-timing 1 less-than 40)) _ break () (chord ch .) break)
  ch_k (switch ((key-timing 1 less-than 40)) _ break () (chord ch k) break)
  ch_g (switch ((key-timing 1 less-than 40)) _ break () (chord ch g) break)

  ch__  (switch ((key-timing 1 less-than 40)) _ break () (chord ch S--) break)
  ch_lp (chord ch S-9)
  ch_rp (chord ch S-0)
  ch_;  (chord ch ;)







  ;; magic keys:
  ;; a -> o
  ;; o -> a
  ;; e -> u
  ;; u -> e
  ;; i -> x
  ;;
  ;; c -> y
  ;; p -> y

  ;; ( -> "
  ;; ! -> [
  ;; = -> >
  ;; - -> >
  ;; { -> };
  ;; < -> =
  ;; > -> >
  ;; # -> include
  ;; \ -> n

  ;; TODO: 
  ;; us -> e
  ;; st -> d
  ;;  ! -> =
  ;; degrees -> sym
  ;; euro -> sym
  ;; pound -> sym



  magic (switch
    ((key-history spc 1)) (tap-hold-press 120 120 enter (layer-toggle syms)) break
    ((key-history enter 1)) (tap-hold-press 120 120 enter (layer-toggle syms)) break







  ;; // #include
    ((key-history 3 1)) (macro i n c l u d e) break

  ;; // sfb
    ((key-history o 1)) (macro a) break
    ((key-history a 1)) (macro o) break
    ((key-history u 1)) (macro e) break
    ((key-history e 1)) (macro u) break
    ;;((key-history i 1)) (macro x) break
    ((key-history i 1)) (macro x) break

  ;; // sfs
    ((and(key-history e 2) (key-history s 1))) (macro e) break
    ((and(key-history e 2) (key-history y 1))) (macro e) break
    ((and(key-history e 2) (key-history v 1))) (macro e) break

    ((and(key-history n 2) (key-history i 1))) (macro x) break
  ;; // sfb
    ((key-history w 1)) (macro y) break
    ((key-history c 1)) (macro y) break
    ((key-history p 1)) (macro y) break

    ((key-history j 1)) (macro u s t) break

    ((key-history \ 1)) (macro n) break


    ;; non-sfb for !=
    ;;((and(key-history spc 2) (key-history 1 1))) (macro =) break

    ;; non-sfb for vec![]
    ;;((and(key-history c 2) (key-history 1 1))) (macro [) break

    ((key-history 1 1)) (macro [) break

  ;; // non-sfb for >>
    ((key-history . 1)) (macro S-.) break
  ;; // non-sfb for <=
    ((key-history , 1)) (macro =) break
  ;; // non-sfb ; for ]
    ((key-history ] 1)) (macro ;) break
  ;; // auto ; for {}
    ((key-history { 1)) (macro S-] ; left left) break


    ((key-history x 1)) (macro p k g s) break


    ((key-history 7 1)) (macro S-7) break
    ((key-history ; 1)) (macro S-;) break
    ((key-history = 1)) (macro S-.) break
    ((key-history - 1)) (macro S-.) break
    ((key-history 9 1)) (macro S-') break
    ((key-history 0 1)) (macro S-0) break
    () rpt break
  )

  ;; // normal rpt except for syms
  rpeat (switch
    ((key-history , 1)) (macro S-,) break
    ((key-history \ 1)) (macro S-\) break
    ((key-history ; 1)) (macro S-;) break
    ((key-history 7 1)) (macro S-7) break
    ((key-history 9 1)) (macro S-9) break
    ((key-history 0 1)) (macro S-0) break
    () rpt break
  )

  wl (macro M-C-h M-C-h M-C-h M-C-h M-C-h M-C-h M-C-h M-C-h M-C-h M-C-h M-C-h M-C-h M-C-h)
  wr (macro M-C-i M-C-i M-C-i M-C-i M-C-i M-C-i M-C-i M-C-i M-C-i M-C-i M-C-i M-C-i M-C-i)
  wd (macro M-C-a M-C-a M-C-a M-C-a M-C-a M-C-a M-C-a M-C-a)
  wu (macro M-C-e M-C-e M-C-e M-C-e M-C-e M-C-e M-C-e M-C-e)
  wt (macro M-C-h M-C-h M-C-h M-C-h M-C-h M-C-h M-C-h M-C-h M-C-h M-C-h M-C-h M-C-h M-S-C-A-2)
  fl (macro M-S-C-A-1) ;; float window
  sp (macro M-S-C-A-2) ;; change split orientation
  cn (macro M-S-C-A-3) ;; center window

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
