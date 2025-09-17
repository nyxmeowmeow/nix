# base:
#          : b f d w p   ' l o u j x
#          - n s t c y   m h a e i rpt
#          q , . k g v   / _ ( ) ; z
# alt esc/meta r magic   ent/mods spc bspc/ctrl tab
#
# sym:
#                          l d u r
#            1 2 3 4       7 8 9 0
#            0 9 8 5       6 3 2 1
#                  .       spc

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


(defalias
  eqsft (switch
    ((or (key-history + 1) (key-history 1 1))) (macro =) break
    () (tap-hold-press 120 120 = lsft) break
  )

  space (switch
    ((input-history real bspc 2)) spc break ;; dont = after a ==
    ((key-history lsft 1)) (macro (unmod =) spc) break
    () spc break
  )

  space2 (switch
    ((input-history real , 2)) (multi (layer-switch base) (macro , spc)) break
    ((input-history real ; 2)) (multi (layer-switch base) (macro ; spc)) break

    () spc break
  )

  enter (switch
    ((input-history real , 2)) (multi (layer-switch base) (macro , ent)) break
    ((input-history real ; 2)) (multi (layer-switch base) (macro ; ent)) break

    () ent break
  )

  cw (caps-word-custom
    2000
    (a b c d e f g h i j k l m n o p q r s t u v w x y z)
    (bspc del up down left rght - 0 1 2 3 4 5 6 7 8 9 lsft rsft)
  )

  magic (switch
  ;; TODO convert rust ints to c99 ints
  ;; TODO? fl -> false
  ;; TODO sg -> String

    ((key-history 3 1)) (macro S-1) break


    ;; shift after ::
    ((and (key-history lsft 4) (key-history ; 3) (key-history lsft 2) (key-history ; 1))) (one-shot-press 1000 lsft) break

    ((and (key-history s 2) (key-history z 1))) (macro bspc i z e) break

    ((and (key-history b 4) (key-history e 3) (key-history c 2) (key-history a 1))) (macro u) break



    ((key-history ' 1)) (macro S-0) break

    ;; println!("
    ((and (key-history p 3) (key-history l 2) (key-history n 1))) (macro bspc bspc r i n t l n S-1 S-9 S-') break
    ;; printf("
    ((and (key-history p 2) (key-history f 1))) (macro bspc r i n t f S-9 S-') break
    ;; format!("
    ((and (key-history f 3) (key-history m 2) (key-history t 1))) (macro bspc bspc o r m a t S-1 S-9 S-') break
    
    ;; faster space for shorter words
    ((and (key-history spc 2) (key-history a 1))) (macro spc) break
    ((and (key-history spc 2) (key-history i 1))) (macro spc) break
    ((and (key-history spc 4) (key-history t 3) (key-history h 2) (key-history e 1))) (macro spc) break


    ((and (key-history u 2) (key-history s 1))) (macro e) break
    

    ;; seem (yikes stretch)
    ;; FIXME
    ((and (key-history s 3) (key-history e 2) (input-history real bspc 1))) (macro m) break

    ;; ((and (key-history n 3) (key-history u 2) (key-history l 1))) (macro bspc bspc bspc S-n S-u S-l S-l) break
    ((and (key-history n 3) (key-history u 2) (key-history l 1))) (macro C-w S-n S-u S-l S-l) break







    ((key-history tab 1)) (macro enter) break


  ;; query
    ((key-history q 1)) (macro u e r y) break

  ;; std
    ((and (key-history s 2) (key-history t 1))) (macro d) break

  ;; https://
    ((and (key-history h 2) (key-history t 1))) (macro t p s S-; / /) break

  ;; https://www.
    ((and (key-history h 3) (key-history t 2) (key-history w 1))) (macro bspc t p s S-; / / w w w .) break




  ;; #include
    ;; ((input-history real 3 2)) (macro i n c l u d e) break





;; sfs
    ;; ((and(key-history e 2) (key-history s 1))) (macro e) break
    ((and(key-history e 2) (key-history y 1))) (macro e) break
    ((and(key-history e 2) (key-history v 1))) (macro e) break
    ;; sys
    ((and(key-history s 2) (key-history y 1))) (macro s) break


;; sfb

    ;; fix
    ((and (key-history f 2) (key-history i 1))) (macro x) break
    ;; six
    ((and (key-history s 2) (key-history i 1))) (macro x) break
    ;; mix
    ((and (key-history m 2) (key-history i 1))) (macro x) break

    ;; nix
    ((and(key-history n 2) (key-history i 1))) (macro x) break
    ;; nixpkgs
    ((and(key-history n 3) (key-history i 2) (key-history x 1) (input-history real lsft 2))) (macro p k g s) break




    ;; |& closures with references
    ((key-history \ 1)) (macro S-7) break


    ((key-history 1 1)) (macro S-9) break

  ;; >>
    ((key-history . 1)) (macro S-.) break

  ;; <=
    ((key-history , 1)) (macro =) break

  ;; ];
    ((key-history ] 1)) (macro ;) break

  ;; auto ; for {}
    ((key-history { 1)) (macro S-] ; left left) break





    ((key-history 7 1)) (macro S-7) break
    ((key-history ; 1)) (macro S-;) break

    ;; =>
    ((input-history real lctl 2)) (macro (unmod =) S-.) break

    ((key-history - 1)) (macro S-.) break

    ((input-history real f16 2)) (macro S-') break
    ((input-history real f17 2)) (macro S-0) break
    ((input-history real lctl 2)) (macro S-0) break






;; sfb
    ((key-history g 1)) (macro y) break
    ((key-history i 1)) (macro z) break
    ((key-history w 1)) (macro g) break ;; wget
    ((key-history c 1)) (macro y) break
    ((key-history p 1)) (macro y) break
    ((key-history y 1)) (macro p) break
    ((key-history j 1)) (macro i) break
    ((key-history o 1)) (macro a) break
    ((key-history a 1)) (macro o) break
    ((key-history u 1)) (macro e) break


    () rpt break
  )

  ;; normal rpt except for syms
  ;; FIXME
  rpeat (switch

    ((input-history real lctl 2)) (macro (unmod =) (unmod =)) break

    ((key-history , 1)) (macro S-,) break
    ;; ((key-history . 1)) (macro S-.) break
    ((key-history \ 1)) (macro S-\) break
    ((key-history ; 1)) (macro S-;) break
    ((key-history 7 1)) (macro S-7) break
    ((key-history 9 1)) (macro S-9) break
    ((key-history 0 1)) (macro S-0) break

    ((key-history e 1)) (macro u) break

    ((and (key-history t 2) (key-history r 1))) (macro u e) break

    ((input-history real f16 2)) (macro S-9) break

    ;; repeat the magic key for "nixpkgs"
    ((key-history x 1)) (macro p k g s) break

    ((key-history spc 1)) (one-shot-press 2000 lsft) break

    () rpt break
  )
)

(deflayermap (base)
f15 S--
f16 S-9
f17 S-0
lmet (multi (tap-hold-press 120 120 esc lmet) (layer-while-held sup))
f19 @magic
rsft (tap-hold-press 120 120 bspc rctl)
ralt (tap-hold-press 120 120 tab (layer-while-held fn))
f18 S-;
lctrl @eqsft
bspc @rpeat

ent (tap-hold-press 120 120 ent (layer-while-held mods))


spc @space

' -


3 S-[
8 S-]


, (tap-hold-press 120 120 , (layer-while-held syms))
; (tap-hold-press 120 120 ; (layer-while-held syms))

)

(deflayermap mods
n lsft
s lsft
t lsft
c lctl

h lctl
a lsft
e lsft
i lsft

l left
o down
u up
j right

f15 home
f16 pgdn
f17 pgup
; end

w (macro C-w)
d (macro C-u)

3 (macro ent S-[)
8 (macro ent S-])
)

(deflayermap krita
lsft lsft
lctl lctl
r spc
spc r
)

(deflayermap over
f18 tab
f15 8
f16 9
f17 0
f19 lsft

;; b (multi b (layer-switch over))
;; f (multi f (layer-switch over))
;; d (multi d (layer-switch over))
;; w (multi w (layer-switch over))
;; p (multi p (layer-switch over))
;; n (multi n (layer-switch over))
;; s (multi s (layer-switch over))
;; t (multi t (layer-switch over))
;; c (multi c (layer-switch over))
;; y (multi y (layer-switch over))
;; , (multi , (layer-switch over))
;; . (multi . (layer-switch over))
;; k (multi k (layer-switch over))
;; g (multi g (layer-switch over))
;; v (multi v (layer-switch over))
;; ' (multi ' (layer-switch over))
;; l (multi l (layer-switch over))
;; o (multi o (layer-switch over))
;; u (multi u (layer-switch over))
;; j (multi j (layer-switch over))
;; x (multi x (layer-switch over))
;; m (multi m (layer-switch over))
;; h (multi h (layer-switch over))
;; a (multi a (layer-switch over))
;; e (multi e (layer-switch over))
;; i (multi i (layer-switch over))
)

(deflayermap sup
lctl lctl
rsft rsft


f18 tab
f15 S--
f16 S-9
f17 S-0
f19 lsft

b b
f f
d d
w w
p p
n n
s s
t t
c c
y y
, ,
. .
k k
g g
v v
' '
l l
o o
u u
j j
x x
m m
h h
a a
e e
i i

)

(deflayermap syms


b ,
f ,
d ,
w ,
l left
o down
u up
j right
n 8
s 4
t 0
c 2
h 3
a 1
e 5
i 9
bspc rpt
, 9
. 5
k 1
g 6
f15 7
f16 0
f17 4
; 8
r .

spc @space2
ent @enter

)

(deflayermap fn
b f1
f f2
d f3
w f4
n f5
s f6
t f7
c f8
, f9
. f10
k f11
g f12

h home
a pgup
e pgdn
i end



)


(defchordsv2

  (f15 a) @cw 16 all-released (over sup)
  (u i) (macro S-[ S-; S-/ S-]) 16 all-released (over sup)

  (, ;) (macro S-; q) 20 all-released (over sup)
  (q z) (macro q S-;) 20 all-released (over sup)


  (b f    ) S-6 20 all-released (over sup)
  (  f d  ) S-7 15 all-released (over sup)
  (  f   w) `   20 all-released (over sup)
  (    d w) S-8 15 all-released (over sup)
  
  (l o    ) S-' 14 all-released (over sup)
  (  o u  ) S-1 13 all-released (over sup)
  (    u j) caps 15 all-released (over sup)

  (n s    ) S-, 14 all-released (over sup)
  (  s t  ) '   14 all-released (over sup)
  (  s   c) S-` 16 all-released (over sup)
  (    t c) [   14 all-released (over sup)

  (h a    ) ]   14 all-released (over sup)
  (h   e  ) del 15 all-released (over sup)
  (  a e  ) +   14 all-released (over sup)
  (    e i) S-. 14 all-released (over sup)

  (, .    ) \   20 all-released (over sup)
  (  . k  ) S-\ 20 all-released (over sup)
  (    k g) S-4 20 all-released (over sup)

  (f15 f16      ) S-3 20 all-released (over sup)
  (f15     f17  ) S-5 20 all-released (over sup)
  (    f16 f17  ) S-/ 15 all-released (over sup)
  (        f17 ;) S-2 15 all-released (over sup)

  (h spc) \ 15 all-released (over sup)



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
