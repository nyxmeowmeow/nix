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

        extraDefCfg = ''
          process-unmapped-keys yes
          concurrent-tap-hold yes
        '';

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
  S-; b f d w _      _ l o  u  j _
  @lc n s t c _      _ h a  e  i @rpeat
  q   @, @. k g _      _ @_ @lp @rp @; _
                  @lm  _ @magic     @sym @sc @rs tab
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
  _   `   .   _   _   _       _   left down up   right _
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


(defvirtualkeys
  to-base (layer-switch base)
)

(defvar
  tot 100 ;; tot=timeouttap
)


(deftemplate homerowmod (timeouttap timeouthold keytap keyhold)
	(tap-hold $timeouttap $timeouthold 
		(multi $keytap  @.tp) 
		$keyhold
	)
)

;; homerowmodfiltered: include a way to fix problematic bigrams
(deftemplate homerowmodfiltered (timeouttap timeouthold keytap keyhold typinglist)
  (tap-hold-release-keys $timeouttap $timeouthold
    (multi $keytap  @.tp)
    $keyhold
    $typinglist ;; Activates $keytap early if a key within $typinglist is pressed before hold activates.
  )
)

(defalias
  ;; call @.tp whenever you want to enter typing-layer
  .tp (switch
        ;;(lsft rsft) XX break ;; skip typing-layer activation for upper case keys might this solves some FJ problems
        ()  (multi
              (layer-switch typing)
              (on-idle  95 tap-vkey to-base )
            ) break
      )
  .spc-typing   (multi (layer-switch base) spc) ;; expilcitly leave typing-layer when hitting `space` - this allows experimenting with higher idle timeouts
)


(deflayermap (base)
 ;; define home row mods (they act as typing-layer triggers, too )
 c (t! homerowmod $tot 100 c lsft)
 h (t! homerowmod $tot 100 h rsft)
 t (t! homerowmod $tot 100 t lctl)
 a (t! homerowmod $tot 100 a rctl)
 n (t! homerowmodfiltered $tot 200 n lalt (n))
 i (t! homerowmod $tot 200 i ralt)
 s (t! homerowmod $tot 150 s lmet)
 ;; define each letter as typing-layer trigger
 q (multi q @.tp) w (multi w @.tp) j (multi j @.tp) r (multi r @.tp) f (multi f @.tp) y (multi y @.tp) u (multi u @.tp) k (multi k @.tp) o (multi o @.tp) p (multi p @.tp) g (multi g @.tp) l (multi l @.tp) z (multi z @.tp) x (multi x @.tp) d (multi d @.tp) v (multi v @.tp) b (multi b @.tp) e (multi e @.tp) m (multi m @.tp) 
)

(deflayermap (typing) 
 a (unshift a) b (unshift b) c (unshift c) d (unshift d) e (unshift e) f (unshift f) g (unshift g) h (unshift h) i (unshift i) j (unshift j) k (unshift k) l (unshift l) m (unshift m) n (unshift n) o (unshift o) p (unshift p) q (unshift q) r (unshift r) s (unshift s) t (unshift t) u (unshift u) v (unshift v) w (unshift w) x (unshift x) y (unshift y) z (unshift z) 
 caps XX ;; 5. key deactivations of caps, numbers, ... are optional
)






(defchordsv2

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


  (b f    ) S-, 15 all-released (typing)
  (  f d  ) = 15 all-released (typing)
  (    d w) S-8 15 all-released (typing)

  (l o    ) S-' 15 all-released (typing)
  (  o u  ) + 15 all-released (typing)
  (    u j) S-. 15 all-released (typing)

  (n s    ) (one-shot-press 300 (layer-toggle syms)) 15 all-released (typing)
  (  s t  ) S-[ 15 all-released (typing)
  (  s   c) S-` 15 all-released (typing)
  (    t c) [ 15 all-released (typing)

  (h a    ) ] 15 all-released (typing)
  (h   e  ) del 15 all-released (typing)
  (  a e  ) S-] 15 all-released (typing)
  (    e i) (one-shot-press 300 (layer-toggle syms)) 15 all-released (typing)

  (, .    ) \ 15 all-released (typing)
  (  . k  ) S-\ 15 all-released (typing)
  (    k g) S-1 15 all-released (typing)

  (- 9    ) S-3 15 all-released (typing)
  (-   0  ) S-5 15 all-released (typing)
  (  9 0  ) S-/ 15 all-released (typing)
  (    0 ;) S-7 15 all-released (typing)
)

(defalias
  sym (tap-hold-press 120 120 enter (layer-toggle syms))
  lc (tap-hold-press 120 120 - lctl)
  lm (tap-hold-press 120 120 esc lmet)
  rs (tap-hold-press 120 120 bspc lsft)
  ;;col (tap-hold-press 120 120 S-; lctl)



  ;; FIXME stopped working for no reason
  win (switch
    (lmet rmet) (layer-while-held win) break
    () g break
  )

  cw (caps-word-custom 1000
    (q b f d w p l o u j x n s t c y m h a e i k g v)
    (lsft -)
  )




  ;; easier (); roll
  semi? (switch
    ((and(or (key-history ] 1) (key-history . 1) (key-history 0 1)) (key-timing 1 less-than 120))) _ break () (tap-hold-press 110 110 ; rsft) break)
  
  ;; easier `, `
  sc (switch
    (lsft) (multi (release-key lsft) (macro , spc)) break
    () spc break
  )


  ;; chords disabled if pressed < 40ms after a different key

  b (switch ((key-timing 1 less-than 40)) _ break () b break)
  f (switch ((key-timing 1 less-than 40)) _ break () f break)
  d (switch ((key-timing 1 less-than 40)) _ break () d break)
  w (switch ((key-timing 1 less-than 40)) _ break () w break)

  l (switch ((key-timing 1 less-than 40)) _ break () l break)
  o (switch ((key-timing 1 less-than 40)) _ break () o break)
  u (switch ((key-timing 1 less-than 40)) _ break () u break)
  j (switch ((key-timing 1 less-than 40)) _ break () j break)

  n (switch ((key-timing 1 less-than 40)) _ break () n break)
  s (switch ((key-timing 1 less-than 40)) _ break () s break)
  t (switch ((key-timing 1 less-than 40)) _ break () t break)
  c (switch ((key-timing 1 less-than 40)) _ break () c break)

  h (switch ((key-timing 1 less-than 40)) _ break () h break)
  a (switch ((key-timing 1 less-than 40)) _ break () a break)
  e (switch ((key-timing 1 less-than 40)) _ break () e break)
  i (switch ((key-timing 1 less-than 40)) _ break () i break)

  , (switch ((key-timing 1 less-than 40)) _ break () , break)
  . (switch ((key-timing 1 less-than 40)) _ break () . break)
  k (switch ((key-timing 1 less-than 40)) _ break () k break)
  g (switch ((key-timing 1 less-than 40)) _ break () g break)

  _  (switch ((key-timing 1 less-than 40)) _ break () S-- break)
  lp S-9
  rp S-0
  ;  ;







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
