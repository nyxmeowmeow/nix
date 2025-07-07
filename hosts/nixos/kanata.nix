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

        # extraDefCfg = ''
        #   process-unmapped-keys yes
        #   concurrent-tap-hold yes
        #   chords-v2-min-idle 40
        #   danger-enable-cmd yes
        # '';

        extraDefCfg = ''
          concurrent-tap-hold no
          '';

        config = /* scheme */ ''
(defsrc
 f j u 
)

(deflayer base
 @f @j @u
)
(defvirtualkeys typingmode nop1)


(defalias
 tp (hold-for-duration  55 typingmode)


 t (t! homerowmod 110 110 t lsft)
 a (t! homerowmod 110 110 a rsft)
 c (t! homerowmod 110 110 c lctl)
 h (t! homerowmod 110 110 h rctl)
 n (t! homerowmod 150 150 n lsft)
 i (t! homerowmod 150 150 i rsft)
 ;; s (t! homerowmod 120 120 s (layer-while-held syms))
 ;; e (t! homerowmod 120 120 e (layer-while-held syms))
 s (t! homerowmod 120 120 s rsft)
 e (t! homerowmod 120 120 e rsft)
 ;; define each letter as typing-layer trigger
 g (t! letter 200 200 g)
 r (t! letter 200 200 r)
 q (t! letter 200 200 q)
 w (t! letter 200 200 w)
 j (t! letter 200 200 j)
 f (t! letter 200 200 f)
 y (t! letter 200 200 y)
 u (t! letter 200 200 u)
 k (t! letter 200 200 k)
 o (t! letter 200 200 o)
 p (t! letter 200 200 p)
 l (t! letter 200 200 l)
 z (t! letter 200 200 z)
 x (t! letter 200 200 x)
 d (t! letter 200 200 d)
 v (t! letter 200 200 v)
 b (t! letter 200 200 b)
 m (t! letter 200 200 m) 
)

(deftemplate homerowmod (timeouttap timeouthold keytap keyhold)
    (tap-hold $timeouttap $timeouthold
      (multi $keytap  @tp)
      (switch 
            (nop1) $keytap break  ;;check for typing mode
                () $keyhold break
    )
  )
)

(deftemplate letter (timeouttap timeouthold keytap)
      (switch 
            (nop1) (multi (unmod $keytap)  @tp) break  ;;check for typing mode
            () (multi                $keytap  @tp) break
    )
  )
        '';
      };

    };
  };

  boot.kernelModules = [ "uinput" ];
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
