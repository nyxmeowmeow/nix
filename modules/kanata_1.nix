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
          chords-v2-min-idle 40
        '';

        config = /* rust */ ''
(defsrc)

(deflayermap (base)
 ;; define home row mods (they act as typing-layer triggers, too )
 c (t! homerowmod $tot 100 c lsft)
 h (t! homerowmod $tot 100 h rsft)
 t (t! homerowmod $tot 100 t lctl)
 a (t! homerowmod $tot 100 a rctl)
 n (t! homerowmodfiltered $tot 200 n lalt (n))
 i (t! homerowmod $tot 150 i ralt)
 s (t! homerowmod $tot 110 s (layer-while-held syms))
 e (t! homerowmod $tot 110 e (layer-while-held syms))
 ;; define each letter as typing-layer trigger
 q (multi q @.tp) w (multi w @.tp) j (multi j @.tp) r (multi r @.tp) f (multi f @.tp) y (multi y @.tp) u (multi u @.tp) k (multi k @.tp) o (multi o @.tp) p (multi p @.tp)  l (multi l @.tp) z (multi z @.tp) x (multi x @.tp) d (multi d @.tp) v (multi v @.tp) b (multi b @.tp) m (multi m @.tp) 

f18 S-;
lctrl -
bspc @rpeat
g (switch
    (nop1) (one-shot-press 500 (layer-while-held win)) break
    (lmet rmet) (layer-while-held win) break
    () g break
)
f15 S--
f16 S-9
f17 S-0
lmet (multi nop1 (tap-hold-press 120 120 esc lmet))
lsft @magic
rsft bspc
ralt tab
;;, (tap-hold-press 110 110 , lsft)
;;. @per?


)


(deflayermap over
f18 tab
f15 8
f16 9
f17 0
)

(deflayermap syms
esc f1
1 f2
2 f3
3 f4
4 f5
5 f6
6 f7
7 home
8 pgdn
9 pgup
0 end
b ,
f .
d ` 
w `
l left
o down
u up
j right
n 1
s 2
t 3
c 4
h 7
a 8
e 9
i 0
bspc rpt
, 0
. 9
k 8
g 5
f15 6
f16 3
f17 2
; 1
r @cw

)

;;(deflayer win
;;  _  _   _   _   _   _       _   _    _    _    _     _
;;  _  _   @fl _   _   _       _   _    _    _    _     _
;;  _  _   @sp @wt @cn _       _   @wl  @wd  @wu  @wr   _
;;  _  _   _   _   _   _       _   _    _    _    _     _
;;             _   _   _       _   _    _    _
;;)
(deflayermap win
  f @fl
  s @sp
  t @wt
  c @cn
  h @wl
  a @wd
  e @wu
  i @wr
)




(defvirtualkeys
  to-base (layer-switch base)
)

(defvar
  tot 80 ;; tot=timeouttap
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



(deflayermap (typing) 
 a (unshift a) b (unshift b) c (unshift c) d (unshift d) e (unshift e) f (unshift f) g (unshift g) h (unshift h) i (unshift i) j (unshift j) k (unshift k) l (unshift l) m (unshift m) n (unshift n) o (unshift o) p (unshift p) q (unshift q) r (unshift r) s (unshift s) t (unshift t) u (unshift u) v (unshift v) w (unshift w) x (unshift x) y (unshift y) z (unshift z) 

f15 S--
f16 S-9
f17 S-0
lmet (multi nop1 (tap-hold-press 120 120 esc lmet))
lsft @magic
rsft bspc
ralt tab
f18 S-;
lctrl -
bspc @rpeat

 ;;caps XX ;; 5. key deactivations of caps, numbers, ... are optional
)






(defchordsv2

  (b f    ) S-, 15 all-released (typing over)
  (  f d  ) = 15 all-released (typing over)
  (    d w) S-8 15 all-released (typing over)

  (l o    ) S-' 15 all-released (typing over)
  (  o u  ) + 15 all-released (typing over)
  (    u j) S-. 15 all-released (typing over)

  (n s    ) (one-shot-press 300 (layer-toggle syms)) 15 all-released (typing over)
  (  s t  ) S-[ 15 all-released (typing over)
  (  s   c) S-` 15 all-released (typing over)
  (    t c) [ 15 all-released (typing over)

  (h a    ) ] 15 all-released (typing over)
  (h   e  ) del 15 all-released (typing over)
  (  a e  ) S-] 15 all-released (typing over)
  (    e i) (one-shot-press 300 (layer-toggle syms)) 15 all-released (typing over)

  (, .    ) \ 15 all-released (typing over)
  (  . k  ) S-\ 15 all-released (typing over)
  (    k g) S-1 15 all-released (typing over)

  (f15 f16      ) S-3 15 all-released (typing over)
  (f15     f17  ) S-5 15 all-released (typing over)
  (    f16 f17  ) S-/ 15 all-released (typing over)
  (        f17 ;) S-7 15 all-released (typing over)
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
    ;;((and(key-history e 2) (key-history s 1))) (macro e) break
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
