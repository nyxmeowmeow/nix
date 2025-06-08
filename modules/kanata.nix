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
        '';

        # configFile = "/home/meow/.config/kanata/symbols.kbd";
        config = /* rust */ ''
;; timeings should work fine for 40 to 80 words per minute; 

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

(defsrc )

(deflayermap (base)
 ;; define home row mods (they act as typing-layer triggers, too )
 f (t! homerowmod $tot 160 f lsft)
 j (t! homerowmod $tot 140 j rsft)
 d (t! homerowmod $tot 300 d lctl)
 k (t! homerowmod $tot 300 k rctl)
 s (t! homerowmodfiltered $tot 400 s lalt (a))
 l (t! homerowmod $tot 400 l ralt)
 a (t! homerowmod $tot 450 a lmet)
 ;; define each letter as typing-layer trigger
 q (multi q @.tp) w (multi w @.tp) e (multi e @.tp) r (multi r @.tp) t (multi t @.tp) y (multi y @.tp) u (multi u @.tp) i (multi i @.tp) o (multi o @.tp) p (multi p @.tp) g (multi g @.tp) h (multi h @.tp) z (multi z @.tp) x (multi x @.tp) c (multi c @.tp) v (multi v @.tp) b (multi b @.tp) n (multi n @.tp) m (multi m @.tp) 
)

(deflayermap (typing) 
 a (unshift a) b (unshift b) c (unshift c) d (unshift d) e (unshift e) f (unshift f) g (unshift g) h (unshift h) i (unshift i) j (unshift j) k (unshift k) l (unshift l) m (unshift m) n (unshift n) o (unshift o) p (unshift p) q (unshift q) r (unshift r) s (unshift s) t (unshift t) u (unshift u) v (unshift v) w (unshift w) x (unshift x) y (unshift y) z (unshift z) 
 caps XX ;; 5. key deactivations of caps, numbers, ... are optional
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
