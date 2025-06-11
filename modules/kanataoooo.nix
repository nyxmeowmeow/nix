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

        config = /* rust */ ''
(defsrc)

(deflayermap (base)

)


(deflayermap over)





(defchordsv2

  (b f    ) S-, 15 all-released (over)
  (  f d  ) = 15 all-released (over)
  (    d w) S-8 15 all-released (over)

  (l o    ) S-' 15 all-released (over)
  (  o u  ) + 15 all-released (over)
  (    u j) S-. 15 all-released (over)

  (  s t  ) S-[ 15 all-released (over)
  (  s   c) S-` 15 all-released (over)
  (    t c) [ 15 all-released (over)

  (h a    ) ] 15 all-released (over)
  (h   e  ) del 15 all-released (over)
  (  a e  ) S-] 15 all-released (over)

  (, .    ) \ 15 all-released (over)
  (  . k  ) S-\ 15 all-released (over)
  (    k g) S-1 15 all-released (over)

  (f15 f16      ) S-3 15 all-released (over)
  (f15     f17  ) S-5 15 all-released (over)
  (    f16 f17  ) S-/ 15 all-released (over)
  (        f17 ;) S-7 15 all-released (over)
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
