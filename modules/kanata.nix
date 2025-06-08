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
  
 sft-x (macro S-x)
 sft-p (macro S-p)
 sft-l (macro S-l)
 sft-f (macro S-f)
 sft-j (macro S-j)
 sft-q (macro S-q)
 sft-d (macro S-d)
 sft-n (macro S-n)
 sft-r (macro S-r)
 sft-h (macro S-h)
 sft-k (macro S-k)
 sft-b (macro S-b)
 sft-g (macro S-g)
 sft-w (macro S-w)
 sft-m (macro S-m)
 sft-v (macro S-v)
 sft-z (macro S-z)
 sft-u (macro S-u)
 sft-a (macro S-a)
 sft-c (macro S-c)
 sft-s (macro S-s)
 sft-i (macro S-i)
 sft-o (macro S-o)
 sft-y (macro S-y)
 sft-. (macro S-.)
 sft-, (macro S-,)
 ;; non shift on hand
 nsft-z (macro e z)
 nsft-u (macro e u)
 nsft-a (macro e a)
 nsft-c (macro e c)
 nsft-s (macro e s)
 nsft-i (macro e i)
 nsft-o (macro e o)
 nsft-y (macro e y)
 nsft-. (macro e .)
 nsft-, (macro e ,)
  ;; non shift other hand
 nsft-x (macro t  x )
 nsft-p (macro t  p )
 nsft-l (macro t  l )
 nsft-f (macro t  f )
 nsft-j (macro t  j )
 nsft-q (macro t  q )
 nsft-d (macro t  d )
 nsft-n (macro t  n )
 nsft-r (macro t  r )
 nsft-h (macro t  h )
 nsft-k (macro t  k )
 nsft-b (macro t  b )
 nsft-g (macro t  g )
 nsft-w (macro t  w )
 nsft-m (macro t  m )
 nsft-v (macro t  v )
)

(defseq
 no-lshift (nop1 nop3 nop2)
 no-rshift (nop5 nop7 nop6)
 
 ;; right hand sft
 sft-x (nop1 nop3 x )
 sft-p (nop1 nop3 p )
 sft-l (nop1 nop3 l )
 sft-f (nop1 nop3 f )
 sft-j (nop1 nop3 j )
 sft-q (nop1 nop3 q )
 sft-d (nop1 nop3 d )
 sft-n (nop1 nop3 n )
 sft-r (nop1 nop3 r )
 sft-h (nop1 nop3 h )
 sft-k (nop1 nop3 k )
 sft-b (nop1 nop3 b )
 sft-g (nop1 nop3 g )
 sft-w (nop1 nop3 w )
 sft-m (nop1 nop3 m )
 sft-v (nop1 nop3 v )
 ;; left hand sft
 sft-z (nop5 nop7 z )
 sft-u (nop5 nop7 u )
 sft-a (nop5 nop7 a )
 sft-c (nop5 nop7 c )
 sft-s (nop5 nop7 s )
 sft-i (nop5 nop7 i )
 sft-o (nop5 nop7 o )
 sft-y (nop5 nop7 y )
 sft-. (nop5 nop7 . )
 sft-, (nop5 nop7 , )
 ;; lefthand roles
 nsft-z (nop1 nop3 z )
 nsft-u (nop1 nop3 u )
 nsft-a (nop1 nop3 a )
 nsft-c (nop1 nop3 c )
 nsft-s (nop1 nop3 s )
 nsft-i (nop1 nop3 i )
 nsft-o (nop1 nop3 o )
 nsft-y (nop1 nop3 y )
 nsft-. (nop1 nop3 . )
 nsft-, (nop1 nop3 , )
 ;; right hand roles
 nsft-x (nop5 nop7 x )
 nsft-p (nop5 nop7 p )
 nsft-l (nop5 nop7 l )
 nsft-f (nop5 nop7 f )
 nsft-j (nop5 nop7 j )
 nsft-q (nop5 nop7 q )
 nsft-d (nop5 nop7 d )
 nsft-n (nop5 nop7 n )
 nsft-r (nop5 nop7 r )
 nsft-h (nop5 nop7 h )
 nsft-k (nop5 nop7 k )
 nsft-b (nop5 nop7 b )
 nsft-g (nop5 nop7 g )
 nsft-w (nop5 nop7 w )
 nsft-m (nop5 nop7 m )
 nsft-v (nop5 nop7 v )
)

(defsrc
  esc 
           1    2    3    4    5    6    7    8    9    0    +        
  tab       -    z    u    a        x    p    l    f    j    q        
  caps      c    s    i    e    o    d    t    n    r    h    k   ret
  lsft         y    .        ,        b    g    w    m    v    rsft
            lmet lalt      spc            ralt
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
