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

(defsrc
)

(defvar
  tot 150  ;; tot=time out tap
)

(defvirtualkeys typingmode nop1)

(defalias
 .tp (hold-for-duration 30 typingmode)

  magic (switch
  ;; query
    ((key-history q 1)) (macro u e r y) break
    ((and (input-history fake typingmode 2) (input-history real tab 3))) (macro u e r y) break


    ((and (key-history s 3) (key-history t 2) (key-history nop1 1))) (macro d) break
    ((and (key-history s 3) (key-history nop1 2) (key-history t 1))) (macro d) break
    ((and (input-history real t 4) (input-history real r 3) (input-history fake typingmode 2))) (macro m) break
    ((and (input-history real s 4) (input-history fake typingmode 3) (input-history real t 2))) (macro d) break




  ;; #include
    ;; ((input-history real 3 2)) (macro i n c l u d e) break

  ;; sfb
    ((input-history real o 2)) (macro a) break
    ((input-history real a 2)) (macro o) break
    ((input-history real u 2)) (macro e) break
    ((input-history real e 2)) (macro u) break

    ((and (input-history fake typingmode 2) (input-history real o 3))) (macro a) break
    ((and (input-history fake typingmode 2) (input-history real a 3))) (macro o) break
    ((and (input-history fake typingmode 2) (input-history real u 3))) (macro e) break
    ((and (input-history fake typingmode 2) (input-history real e 3))) (macro u) break

    ((input-history real l 2)) (macro l) break
    ((and (input-history fake typingmode 2) (input-history real l 3))) (macro l) break

    ((input-history real f 2)) (macro f) break
    ((and (input-history fake typingmode 2) (input-history real f 3))) (macro f) break


  ;; sfs
    ;;((and(input-history real e 2) (input-history s 1))) (macro e) break

    ((and (input-history real e 3) (input-history real y 2))) (macro e) break
    ((and (input-history real e 4) (input-history real y 3) (input-history fake typingmode 2))) (macro e) break
    ((and (input-history real e 4) (input-history fake typingmode 3) (input-history real y 2))) (macro e) break

    ((and (input-history real e 3) (input-history real v 2))) (macro e) break
    ((and (input-history real e 4) (input-history real v 3) (input-history fake typingmode 2))) (macro e) break
    ((and (input-history real e 4) (input-history fake typingmode 3) (input-history real v 2))) (macro e) break

    ((and (input-history real n 3) (input-history real i 2))) (macro x) break
    ((and (input-history real n 4) (input-history real i 3) (input-history fake typingmode 2))) (macro x) break
    ((and (input-history real n 4) (input-history fake typingmode 3) (input-history real i 2))) (macro x) break

    ((input-history real i 2)) (macro z) break
    ((and (input-history fake typingmode 2) (input-history real i 3))) (macro z) break

  ;; sfb
    ((input-history real w 2)) (macro y) break
    ((and (input-history fake typingmode 2) (input-history real w 3))) (macro y) break

    ((input-history real c 2)) (macro y) break
    ((and (input-history fake typingmode 2) (input-history real c 3))) (macro y) break

    ((input-history real p 2)) (macro y) break
    ((and (input-history fake typingmode 2) (input-history real p 3))) (macro y) break


    ((input-history real j 2)) (macro u s t) break
    ((and (input-history fake typingmode 2) (input-history real j 3))) (macro u s t) break

    ((key-history \ 1)) (macro n) break


    ((key-history 1 1)) (macro [) break

  ;; non-sfb for >>
    ((key-history . 1)) (macro S-.) break

  ;; non-sfb for <=
    ((key-history , 1)) (macro =) break

  ;; non-sfb ; for ]
    ((key-history ] 1)) (macro ;) break

  ;; auto ; for {}
    ((key-history { 1)) (macro S-] ; left left) break



    ((key-history x 1)) (macro p k g s) break


    ((input-history real 7 2)) (macro S-7) break
    ((input-history real ; 2)) (macro S-;) break

    ((key-history = 1)) (macro S-.) break
    ((and (key-history nop1 1) (key-history = 2))) (macro S-.) break

    ((key-history - 1)) (macro S-.) break
    ((and (key-history nop1 1) (key-history - 2))) (macro S-.) break

    ((input-history real f16 2)) (macro S-') break
    ((input-history real f17 2)) (macro S-0) break
    ((input-history real lctl 2)) (macro S-0) break






    ((key-history t 1)) (macro t) break
    ((and (key-history t 2) (key-history nop1 1))) (macro t) break
    ((and (input-history real t 3) (input-history fake typingmode 2))) (macro t) break

    ((key-history d 1)) (macro d) break
    ((and (key-history d 2) (key-history nop1 1))) (macro d) break
    ((and (input-history real d 3) (input-history fake typingmode 2))) (macro d) break

    ((key-history s 1)) (macro s) break
    ((and (key-history s 2) (key-history nop1 1))) (macro s) break
    ((and (input-history real s 3) (input-history fake typingmode 2))) (macro s) break

    ((key-history m 1)) (macro m) break
    ((and (key-history m 2) (key-history nop1 1))) (macro m) break
    ((and (input-history real m 3) (input-history fake typingmode 2))) (macro m) break




    () rpt break
  )

  ;; normal rpt except for syms
  ;; FIXME
  rpeat (switch
  ;; TODO tr -> ue
    ((key-history , 1)) (macro S-,) break
    ((key-history \ 1)) (macro S-\) break
    ((key-history ; 1)) (macro S-;) break
    ((key-history 7 1)) (macro S-7) break
    ((key-history 9 1)) (macro S-9) break
    ((key-history 0 1)) (macro S-0) break

    ((and (key-history , 2) (key-history nop1 1))) (macro S-,) break
    ((and (key-history \ 2) (key-history nop1 1))) (macro S-\) break
    ((and (key-history ; 2) (key-history nop1 1))) (macro S-;) break
    ((and (key-history 7 2) (key-history nop1 1))) (macro S-7) break
    ((and (key-history 9 2) (key-history nop1 1))) (macro S-9) break
    ((and (key-history 0 2) (key-history nop1 1))) (macro S-0) break

    ((and (key-history t 3) (key-history r 2) (key-history nop1 1))) (macro u e) break
    ((and (key-history t 3) (key-history nop1 2) (key-history r 1))) (macro u e) break
    ((and (input-history real t 4) (input-history real r 3) (input-history fake typingmode 2))) (macro m) break
    ((and (input-history real t 4) (input-history fake typingmode 3) (input-history real r 2))) (macro m) break



    ((key-history o 1)) (macro o) break
    ((key-history p 1)) (macro p) break
    ((key-history t 1)) (macro t) break
    ((key-history d 1)) (macro d) break
    ((key-history s 1)) (macro s) break
    ((key-history c 1)) (macro c) break
    ((key-history b 1)) (macro b) break
    ((key-history f 1)) (macro f) break
    ((key-history l 1)) (macro l) break
    ((key-history g 1)) (macro g) break
    ((key-history e 1)) (macro e) break
    ((key-history m 1)) (macro m) break


    ((and (key-history o 2) (key-history nop1 1))) (macro o) break
    ((and (key-history p 2) (key-history nop1 1))) (macro p) break
    ((and (key-history t 2) (key-history nop1 1))) (macro t) break
    ((and (key-history d 2) (key-history nop1 1))) (macro d) break
    ((and (key-history s 2) (key-history nop1 1))) (macro s) break
    ((and (key-history c 2) (key-history nop1 1))) (macro c) break
    ((and (key-history b 2) (key-history nop1 1))) (macro b) break
    ((and (key-history f 2) (key-history nop1 1))) (macro f) break
    ((and (key-history l 2) (key-history nop1 1))) (macro l) break
    ((and (key-history g 2) (key-history nop1 1))) (macro g) break
    ((and (key-history e 2) (key-history nop1 1))) (macro e) break
    ((and (key-history m 2) (key-history nop1 1))) (macro m) break



    ((and (input-history real o 3) (input-history fake typingmode 2))) (macro o) break
    ((and (input-history real p 3) (input-history fake typingmode 2))) (macro p) break
    ((and (input-history real t 3) (input-history fake typingmode 2))) (macro t) break
    ((and (input-history real d 3) (input-history fake typingmode 2))) (macro d) break
    ((and (input-history real s 3) (input-history fake typingmode 2))) (macro s) break
    ((and (input-history real c 3) (input-history fake typingmode 2))) (macro c) break
    ((and (input-history real b 3) (input-history fake typingmode 2))) (macro b) break
    ((and (input-history real f 3) (input-history fake typingmode 2))) (macro f) break
    ((and (input-history real l 3) (input-history fake typingmode 2))) (macro l) break
    ((and (input-history real g 3) (input-history fake typingmode 2))) (macro g) break
    ((and (input-history real e 3) (input-history fake typingmode 2))) (macro e) break
    ((and (input-history real m 3) (input-history fake typingmode 2))) (macro m) break





    ((input-history real f16 2)) (macro S-9) break



    () rpt break
  )
)

(deflayermap (base)

1 b
2 f
3 d
4 w
5 p
q n
w s
e t
r c
t y
a ,
s .
d k
f g
g v

7 -
8 l
9 o
0 u
- j
= x

u m
i h
o a
p e
[ i
] @rpeat
j /
k S--
l S-9
; S-0
' ;
ent z


tab (tap-hold-press 200 200 = lsft)
` S-;
caps q


spc ent
m ent
, spc
. bspc

c r
v @magic

f3 S-[
f4 S-[
f10 S-]
f10 S-]



x (tap-hold-press 120 120 esc (multi (layer-while-held sup) lmet))
v @magic
] @rpeat

)

(deflayermap sup
tab lctl
. rsft
)


(deflayermap syms
esc f1
1 ,
2 .
3 ` 
4 `
8 left
9 down
0 up
- right
q 1
w 2
e 3
r 4
i 7
o 8
p 9
[ 0
ent rpt
a 0
s 9
d 8
f 5
k 6
l 3
; 2
' 1
c @cw

)


(defchordsv2

  (b f    ) S-6 20 all-released (over sup)
  (  f d  ) S-7 15 all-released (over sup)
  (  f   w) `   20 all-released (over sup)
  (    d w) S-8 15 all-released (over sup)
  
  (l o    ) S-' 15 all-released (over sup)
  (  o u  ) caps 13 all-released (over sup)
  (    u j) S-1 17 all-released (over sup)

  (n s    ) S-, 15 all-released (over sup)
  (  s t  ) =   15 all-released (over sup)
  (  s   c) S-` 17 all-released (over sup)
  (    t c) [   15 all-released (over sup)

  (h a    ) ]   15 all-released (over sup)
  (h   e  ) del 15 all-released (over sup)
  (  a e  ) +   15 all-released (over sup)
  (    e i) S-. 15 all-released (over sup)

  (, .    ) \   20 all-released (over sup)
  (  . k  ) S-\ 20 all-released (over sup)
  (    k g) S-4 20 all-released (over sup)

  (f15 f16      ) S-3 20 all-released (over sup)
  (f15     f17  ) S-5 20 all-released (over sup)
  (    f16 f17  ) S-/ 15 all-released (over sup)
  (        f17 ;) S-2 15 all-released (over sup)
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
