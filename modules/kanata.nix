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
 c (t! homerowmod $tot 110 c lsft)
 h (t! homerowmod $tot 110 h rsft)
 t (t! homerowmod $tot 110 t lctl)
 a (t! homerowmod $tot 110 a rctl)
 n (t! homerowmodfiltered $tot 200 n lalt (n))
 i (t! homerowmod $tot 150 i ralt)
 s (t! homerowmod $tot 120 s ralt)
 e (t! homerowmod $tot 120 e ralt)
 ;; define each letter as typing-layer trigger
 q (multi q @.tp) w (multi w @.tp) j (multi j @.tp) r (multi r @.tp) f (multi f @.tp) y (multi y @.tp) u (multi u @.tp) k (multi k @.tp) o (multi o @.tp) p (multi p @.tp)  l (multi l @.tp) z (multi z @.tp) x (multi x @.tp) d (multi d @.tp) v (multi v @.tp) b (multi b @.tp) m (multi m @.tp) 


)


(deflayermap over
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
 a (unshift a)
 b (unshift b)
 d (unshift d)
 f (unshift f)
 g (unshift g)
 i (unshift i)
 j (unshift j)
 k (unshift k)
 l (unshift l)
 m (unshift m)
 n (unshift n)
 o (unshift o)
 p (unshift p)
 q (unshift q)
 r (unshift r)
 t (unshift t)
 u (unshift u)
 v (unshift v)
 w (unshift w)
 x (unshift x)
 y (unshift y)
 z (unshift z) 

 h (multi (t! homerowmod $tot 110 h rsft) (layer-switch base))
 c (multi (t! homerowmod $tot 110 c lsft) (layer-switch base))
 s (t! homerowmod $tot 120 s ralt)
 e (t! homerowmod $tot 120 e ralt)
f15 S--
f16 S-9
f17 S-0
lmet (multi nop1 (tap-hold-press 120 120 esc lmet))
rsft bspc
ralt tab
f18 S-;
lctrl -

 ;;caps XX ;; 5. key deactivations of caps, numbers, ... are optional
)






(defchordsv2

  (b f    ) S-7 15 all-released (typing over)
  (  f d  ) = 15 all-released (typing over)
  (    d w) S-8 15 all-released (typing over)

  (l o    ) S-' 15 all-released (typing over)
  (  o u  ) + 15 all-released (typing over)
  (    u j) S-. 15 all-released (typing over)

  (n s    ) S-, 15 all-released (typing over)
  (  s t  ) S-[ 15 all-released (typing over)
  (  s   c) S-` 15 all-released (typing over)
  (    t c) [ 15 all-released (typing over)

  (h a    ) ] 15 all-released (typing over)
  (h   e  ) del 15 all-released (typing over)
  (  a e  ) S-] 15 all-released (typing over)
  (    e i) S-. 15 all-released (typing over)

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
  ;;wi (tap-hold-press 120 120 enter (layer-toggle win))
  ;;lc (tap-hold-press 120 120 - lctl)
  ;;lm (tap-hold-press 120 120 esc lmet)
  ;;rs (tap-hold-press 120 120 bspc lsft)
  ;;;;col (tap-hold-press 120 120 S-; lctl)

  ;;;;dr (dynamic-macro-record 0)
  ;;;;dp (dynamic-macro-play 0)
  ;;;;dms dynamic-macro-record-stop
  ;;;;dst (dynamic-macro-record-stop-truncate 1)


  ;;win (switch
  ;;  (lmet rmet) (layer-while-held win) break
  ;;  () g break
  ;;)

  ;;cw (caps-word-custom 1000
  ;;  (q b f d w p l o u j x n s t c y m h a e i k g v)
  ;;  (lsft -)
  ;;)



  ;;;; easier (); roll
  ;;semi? (switch
  ;;  ((and
  ;;    (or
  ;;    (key-history ] 1)
  ;;    (key-history . 1) 
  ;;    (key-history 0 1)) 
  ;;  (key-timing 1 less-than 120))) _ break
  ;;  () (tap-hold-press 110 110 ; rsft) break)


  ;;;; easier ); roll
  ;; close (switch
  ;;   (rctl) (macro S-((unmod (rctl) 0)) (unmod (rctl) ;)) break
  ;;   () @semi? break
  ;; )


  ;;rp? (switch
  ;;  ((and
  ;;  (key-history 9 1) 
  ;;  (key-timing 1 less-than 120))) (macro S-0) break
  ;;  () (tap-hold-press 110 110 S-0 rctl) break
  ;;)

  ;;per? (switch
  ;;  ((key-timing 1 less-than 120)) _ break ()
  ;;  (tap-hold-press 110 110 . lctl) break
  ;;)


  ;;;; easier `, `
  ;;sc (switch
  ;;  (lsft) (multi (release-key lsft) (macro , spc)) break
  ;;  () spc break
  ;;)








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
