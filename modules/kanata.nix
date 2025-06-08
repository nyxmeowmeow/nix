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
        sequence-timeout 2002
        sequence-input-mode hidden-suppressed
        sequence-backtrack-modcancel no
        '';

        # configFile = "/home/meow/.config/kanata/symbols.kbd";
        config = /* rust */ ''
        
(defvirtualkeys
  lshift-start nop1
  lshift-end nop2
  lshift-down nop3
  lshift-pre nop4
  rshift-start nop5
  rshift-end nop6
  rshift-down nop7
  rshift-pre nop8
  seq-start sldr
  no-lshift (macro c)
  no-rshift (macro h)
  
 sft-b (macro S-b)
 sft-f (macro S-f)
 sft-d (macro S-d)
 sft-w (macro S-w)
 sft-p (macro S-p)
 sft-n (macro S-n)
 sft-s (macro S-s)
 sft-t (macro S-t)
 sft-c (macro S-c)
 sft-y (macro S-y)
 sft-k (macro S-k)
 sft-g (macro S-g)
 sft-v (macro S-v)
 sft-l (macro S-l)
 sft-o (macro S-o)
 sft-u (macro S-u)
 sft-j (macro S-j)
 sft-m (macro S-m)
 sft-h (macro S-h)
 sft-a (macro S-a)
 sft-e (macro S-e)
 sft-i (macro S-i)
 sft-. (macro S-.)
 sft-, (macro S-,)
 ;; non shift on hand
 nsft-b (macro c b)
 nsft-f (macro c f)
 nsft-d (macro c d)
 nsft-w (macro c w)
 nsft-p (macro c p)
 nsft-n (macro c n)
 nsft-s (macro c s)
 nsft-t (macro c t)
 nsft-c (macro c c)
 nsft-y (macro c y)
 nsft-k (macro c k)
 nsft-g (macro c g)
 nsft-v (macro c v)
  ;; non shift other hand
 nsft-l (macro h  l )
 nsft-o (macro h  o )
 nsft-u (macro h  u )
 nsft-j (macro h  j )
 nsft-m (macro h  m )
 nsft-h (macro h  h )
 nsft-a (macro h  a )
 nsft-e (macro h  e )
 nsft-i (macro h  i )
)

(defseq
 no-lshift (nop1 nop3 nop2)
 no-rshift (nop5 nop7 nop6)
 
 ;; right hand sft
 sft-l (nop1 nop3 l )
 sft-o (nop1 nop3 o )
 sft-u (nop1 nop3 u )
 sft-j (nop1 nop3 j )
 sft-m (nop1 nop3 m )
 sft-h (nop1 nop3 h )
 sft-a (nop1 nop3 a )
 sft-e (nop1 nop3 e )
 sft-i (nop1 nop3 i )
 ;; left hand sft
 sft-b (nop5 nop7 b )
 sft-f (nop5 nop7 f )
 sft-d (nop5 nop7 d )
 sft-w (nop5 nop7 w )
 sft-p (nop5 nop7 p )
 sft-n (nop5 nop7 n )
 sft-s (nop5 nop7 s )
 sft-t (nop5 nop7 t )
 sft-c (nop5 nop7 c )
 sft-y (nop5 nop7 y )
 sft-k (nop5 nop7 k )
 sft-g (nop5 nop7 g )
 sft-v (nop5 nop7 v )
 ;; lefthand roles
 nsft-b (nop1 nop3 b )
 nsft-f (nop1 nop3 f )
 nsft-d (nop1 nop3 d )
 nsft-w (nop1 nop3 w )
 nsft-p (nop1 nop3 p )
 nsft-n (nop1 nop3 n )
 nsft-s (nop1 nop3 s )
 nsft-t (nop1 nop3 t )
 nsft-c (nop1 nop3 c )
 nsft-y (nop1 nop3 y )
 nsft-k (nop1 nop3 k )
 nsft-g (nop1 nop3 g )
 nsft-v (nop1 nop3 v )
 ;; right hand roles
 nsft-l (nop5 nop7 l )
 nsft-o (nop5 nop7 o )
 nsft-u (nop5 nop7 u )
 nsft-j (nop5 nop7 j )
 nsft-m (nop5 nop7 m )
 nsft-h (nop5 nop7 h )
 nsft-a (nop5 nop7 a )
 nsft-e (nop5 nop7 e )
 nsft-i (nop5 nop7 i )
)

(defsrc
  esc 
           1    2    3    4    5    6    7    8    9    0            
  tab       -    z    u    a        x    p    l    f    j    q        
  caps      c    s    i    e    o    d    t    n    r    h    k   ret
  lsft         y    .        ,        b    g    w    m    v    rsft
            lmet lalt      spc            ralt bspc
)

(deflayermap (base icon base.ico)
 c (fork    
	(multi 
		(on-press tap-vkey lshift-pre) ;;not used
		(on-press tap-vkey seq-start) 
		(on-press tap-vkey lshift-start)
		(on-press press-vkey lshift-down)
		(on-release release-vkey lshift-down)
		(on-release tap-vkey lshift-end))
    (multi (unicode E) f17) ;; there is a BUG preventing me from using S-e. And (unicode) will not end a sequence therefore f17
    (nop7)
   )
 h (fork   
	(multi     
	    (on-press tap-vkey rshift-pre)
		(on-press tap-vkey seq-start) 
		(on-press tap-vkey rshift-start)
		(on-press press-vkey rshift-down)
		(on-release release-vkey rshift-down)
		(on-release tap-vkey rshift-end))
	(multi (unicode T) f17 ) 
	(nop3)
   )
)'';
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
