{ pkgs, ... }: {
  services.kanata = {
    enable = true;
    package = pkgs.kanata-with-cmd;
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
          danger-enable-cmd yes
        '';

        config = /* scheme */ ''

(defvirtualkeys
    fast    (layer-while-held typing)
)

(defvar
  tot 120  ;; tot=time out tap
)

(deftemplate homerowmod (timeouttap timeouthold keytap keyhold)
	(tap-hold $timeouttap $timeouthold 
		(multi $keytap  @.tp) 
		$keyhold
	)
)

(defalias
  ;; call @.tp whenever you want to enter fast typing-layer
  .tp (hold-for-duration 55 fast)  ;; timeouts from 30 to 100 are wide spread
  .spc-typing   (multi (on-press release-vkey fast) spc) ;; expilcitly leave typing-layer when hitting `space` - this allows experimenting with higher idle timeouts
)

(defsrc )

(deflayermap (base)
 ;; define home row mods (they act as typing-layer triggers, too )
 f19 @magic
 t (t! homerowmod $tot 160 t lsft)
 a (t! homerowmod $tot 160 a rsft)
 c (t! homerowmod $tot 300 c lctl)
 h (t! homerowmod $tot 300 h rctl)
 s (t! homerowmod $tot 400 s lalt)
 e (t! homerowmod $tot 400 e ralt)
 n (t! homerowmod $tot 450 n lmet)
 i (t! homerowmod $tot 450 i rmet)
 ;; define each letter as typing-layer trigger
 q (multi q @.tp)
 w (multi w @.tp)
 r (multi r @.tp)
 y (multi y @.tp)
 u (multi u @.tp)
 o (multi o @.tp)
 p (multi p @.tp)
 g (multi g @.tp)
 z (multi z @.tp)
 x (multi x @.tp)
 v (multi v @.tp)
 b (multi b @.tp)
 m (multi m @.tp) 
)

(deflayermap over)
(deflayermap krita)

(deflayermap (typing) 
 h (unshift h)
 b (unshift b)
 d (unshift d)
 f (unshift f)
 g (unshift g)
 j (unshift j)
 k (unshift k)
 l (unshift l)
 m (unshift m)
 o (unshift o)
 p (unshift p)
 q (unshift q)
 r (unshift r)
 c (unshift c)
 u (unshift u)
 v (unshift v)
 w (unshift w)
 x (unshift x)
 y (unshift y)
 z (unshift z) 
)

(defchordsv2

  (b f    ) S-7 15 all-released (over)
  (  f d  ) = 15 all-released (over)
  (    d w) S-8 15 all-released (over)

  (l o    ) S-' 15 all-released (over)
  (  o u  ) + 15 all-released (over)
  (    u j) S-. 15 all-released (over)

  (n s    ) S-, 15 all-released (over)
  (  s t  ) S-[ 15 all-released (over)
  (  s   c) S-` 15 all-released (over)
  (    t c) [ 15 all-released (over)

  (h a    ) ] 15 all-released (over)
  (h   e  ) del 15 all-released (over)
  (  a e  ) S-] 15 all-released (over)
  (    e i) S-. 15 all-released (over)

  (, .    ) \ 15 all-released (over)
  (  . k  ) S-\ 15 all-released (over)
  (    k g) S-1 15 all-released (over)

  (f15 f16      ) S-3 15 all-released (over)
  (f15     f17  ) S-5 15 all-released (over)
  (    f16 f17  ) S-/ 15 all-released (over)
  (        f17 ;) S-7 15 all-released (over)
)

  (defalias
  magic (switch

  ;; // query
    ((key-history q 1)) (macro u e r y) break

  ;; // #include
    ((key-history 3 1)) (macro i n c l u d e) break

  ;; // sfb
    ((key-history o 1)) (macro a) break
    ((key-history a 1)) (macro o) break
    ((key-history u 1)) (macro e) break
    ((key-history e 1)) (macro u) break
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
