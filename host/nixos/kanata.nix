# TODO mouse keys

# base:
#      : b f d w p   / l o u . _
#      = n s t c y   m h a e i 
#      q , v k g -   j 󰣏 ( ) ; z
#        alt 󱊷 r 󰣎   󰌑 󱁐 󰁮 󰌒
#
# sym:
#        , , , ,
#        1 2 3 4       7 8 9 0
#        0 9 8 5       6 3 2 1
#              .       󱁐
#
# mods:    
#        󰾆 󰓅 󰳾 󰳽        󱕐 󱕑 
#                      ← ↓ ↑ →
#                      󰞗 󰞖 󰞙 󰞘
#              .       󱁐

{
  pkgs,
  lib,
  username,
  ...
}: {


  nixpkgs.overlays = [
    (final: prev: {

kanata-with-cmd = prev.pkgs.rustPlatform.buildRustPackage rec {
  pname = "kanata";
  version = "9deeb0f4f00be7401b17cfe531a838322d7a9d2b";
  cargoLock.lockFile = ../../stuff/kanata/Cargo.lock;

        src = prev.fetchFromGitHub {
          owner = "jtroo";
          repo = "kanata";
          rev = "9deeb0f4f00be7401b17cfe531a838322d7a9d2b";
          hash = "sha256-7o4zWdLJFM3PKX7L7Cij62HUirUC9Z0zjlvzEguJUUw=";
        };

      # kanata-with-cmd = prev.buildRustCrate {
      #   crateName = "kanata-with-cmd";
      #   version = "9deeb0f4f00be7401b17cfe531a838322d7a9d2b";
      #
      #   src = prev.fetchFromGitHub {
      #     owner = "jtroo";
      #     repo = "kanata";
      #     rev = "9deeb0f4f00be7401b17cfe531a838322d7a9d2b";
      #     hash = "sha256-7o4zWdLJFM3PKX7L7Cij62HUirUC9Z0zjlvzEguJUUw=";
      #   };


        # vendorHash = "sha256-ANMeYiN+66F8EF7dB8+zuQyuT3moSuNxX8+vQ9GH2w4=";

        # meta = {
        #   description = "Configurable TUI clipboard manager for Unix ";
        #   homepage = "https://github.com/savedra1/clipse";
        #   license = lib.licenses.mit;
        #   maintainers = [ lib.maintainers.savedra1 ];
        # };
      };
    })
  ];





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

(defalias
  r (switch
    ;; key-timing to not interfere with vim
    ((and (key-history lsft 2) (key-history 0 1) (key-timing 1 less-than 110))) (macro S-0) break
    () r break
  )

  eqsft (switch
    ((or (key-history + 1) (key-history 1 1))) (macro =) break
    ;; () (tap-hold-press 120 120 = lsft) break
    () = break
  )

  space (switch
    ((input-history real bspc 2)) spc break ;; dont = after a ==
    ((key-history lsft 1)) (multi (release-key lsft) (macro = spc)) break
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
    (bspc del up down left right - 0 1 2 3 4 5 6 7 8 9 lsft rsft)
  )

  ;; TODO convert rust ints to c99 ints
  ;; TODO ; -> . (for vim)
  magic (switch


    ;; kb -> keyboard
    ((and (key-history k 2) (key-history b 1))) (multi (release-key b) (macro bspc e y b o a r d)) break
    ;; sb -> svalboard
    ((and (key-history s 2) (key-history b 1))) (multi (release-key b) (macro bspc v a l b o a r d)) break
    ;; linux
    ((and (key-history l 4) (key-history i 3) (key-history n 2) (key-history u 1))) (macro x) break
    ;; yazi
    ((and (key-history y 3) (key-history a 2) (key-history z 1))) (macro i) break
    ;; mkdir
    ((and (key-history m 2) (key-history k 1))) (macro d i r) break
    ;; ascii
    ((and (key-history a 4) (key-history s 3) (key-history c 2) (key-history i 1))) (multi (release-key i) (macro i)) break
    ;; size
    ((and (key-history s 2) (key-history z 1))) (multi (release-key s) (release-key z) (macro bspc i z e)) break


    ;;; MONKEYTYPE
    ;; school FIXME
    ((and (key-history s 5) (key-history c 4) (key-history h 3) (key-history o 2))) l break
    ;; leave
    ((and (key-history l 4) (key-history e 3) (key-history a 2) (key-history v 1))) (macro e) break
    ;; because
    ((and (key-history b 4) (key-history e 3) (key-history c 2) (key-history a 1))) (macro u) break
    ;; ease, increase  etc
    ((and (key-history e 3) (key-history a 2) (key-history s 1))) e break
    ;; problem
    ((and (key-history p 6) (key-history r 5) (key-history o 4) (key-history b 3) (key-history l 2) (key-history e 1))) (macro m) break
    ;; use
    ((and (key-history u 2) (key-history s 1))) (macro e) break
    ;; also
    ((and (key-history a 3) (key-history l 2) (key-history s 1))) (macro o) break
    ;; state
    ((and (key-history s 3) (key-history t 2) (key-history a 1))) (macro t) break
    ;; ((and(key-history e 2) (key-history s 1))) (macro e) break
    ((and(key-history e 2) (key-history y 1))) (multi (release-key e) (macro e)) break
    ((and(key-history e 2) (key-history v 1))) (multi (release-key e) (macro e)) break
    ;; system
    ((and(key-history s 2) (key-history y 1))) (multi (release-key s) (macro s)) break





    ;;; CODE
    ;; Ok(())
    ((and (key-history o 2) (key-history k 1))) (multi (release-key o) (release-key k) (macro C-w bspc S-o k S-9 S-9 S-0 S-0)) break
    ;; Some(
    ((and (key-history s 2) (key-history m 1))) (multi (release-key s) (release-key m) (macro C-w bspc S-s o m e S-9)) break
    ;; None
    ((and (key-history n 2) (key-history o 1))) (multi (release-key n) (release-key o) (macro C-w bspc S-n o n e)) break
    ;; shift after ::
    ((and (key-history lsft 4) (key-history ; 3) (key-history lsft 2) (key-history ; 1))) (one-shot-press 1000 lsft) break
    ;; shift after <
    ((key-history , 1)) (one-shot-press 1000 lsft) break
    ;; sg -> String
    ((and (key-history s 2) (key-history g 1))) (multi (release-key s) (release-key g) (macro C-w S-s t r i n g)) break
    ;; #!
    ((key-history 3 1)) (macro S-1) break
    ;; nix enable
    ((and (key-history e 3) (key-history n 2) (key-history l 1))) (multi (release-key e) (release-key n) (release-key l) (macro bspc a b l e spc = spc t r u e ; esc)) break
    ;; let -> let mut
    ((and (key-history l 4) (key-history e 3) (key-history t 2) (key-history spc 1))) (multi (release-key t) (release-key spc) (macro m u t spc)) break
    ;; println!("
    ((and (key-history p 3) (key-history l 2) (key-history n 1))) (multi (release-key p) (release-key l) (release-key n) (macro bspc bspc r i n t l n S-1 S-9 S-')) break
    ;; printf("
    ((and (key-history p 2) (key-history f 1))) (multi (release-key p) (release-key f) (macro bspc r i n t f S-9 S-')) break
    ;; format!("
    ((and (key-history f 3) (key-history m 2) (key-history t 1))) (multi (release-key f) (release-key m) (release-key t)(macro bspc bspc o r m a t S-1 S-9 S-')) break
    ;; NULL
    ((and (key-history n 2) (key-history l 1))) (multi (release-key n) (release-key l) (macro C-w S-n S-u S-l S-l)) break
    ;; std
    ((and (key-history s 2) (key-history t 1))) (macro d) break
    ;; |&   closures with references
    ((key-history \ 1)) (macro S-7) break
    ;; !(   rust macros
    ((key-history 1 1)) (macro S-9) break
    ;; >>
    ((key-history . 1)) (macro S-.) break
    ;; <=
    ;; ((key-history , 1)) (macro =) break
    ;; ];
    ((key-history ] 1)) (macro ;) break
    ;; auto ; for {}
    ((key-history { 1)) (macro S-] ; left left) break
    ;; ).
    ((key-history 0 1)) (macro .) break
    ((and (key-history 0 2) (key-history ent 1))) (macro .) break
    ;; &&
    ((key-history 7 1)) (macro S-7) break
    ;; ::
    ((key-history ; 1)) (macro S-;) break
    ;; =>
    ((input-history real lctl 2)) (macro (unmod =) S-.) break
    ;; ->
    ((key-history - 1)) (macro S-.) break
    ;; Vec<_>
    ((and (key-history v 3) (key-history e 2) (key-history c 1))) (macro C-w S-v e c S-, S-- S-.) break
    ;; true;
    ((and (key-history t 2) (key-history r 1))) (macro u e) break
    




    ;; ;; date  FIXME
    ;; ((and (key-history d 4) (key-history a 3) (key-history t 2) (key-history e 1))) (cmd-output-keys bash -c "date +'%F %R' | sed 's/./& /g' | sed 's/:/S-;/g' | sed 's/\\(.\\{20\\}\\)\\(.*\\)/\\(\\1 spc \\2\\)/'") break
    ;; insert current date
    ;; ((and (key-history d 4) (key-history a 3) (key-history t 2) (key-history e 1))) (cmd-output-keys bash -c "date") break
    ;; ((and (key-history d 4) (key-history a 3) (key-history t 2) (key-history e 1))) (macro bspc bspc bspc bspc (cmd-output-keys date)) break





    ((input-history real lsft 2)) (macro lctl ent) break



    ((and (key-history f 2) (key-history l 1))) (multi (release-key f) (release-key l) (macro bspc a l s e)) break


    ((key-history ' 1)) (macro S-0) break

    
    ;; faster space for shorter words
    ((and (key-history spc 2) (key-history n 1))) (macro spc) break
    ((and (key-history spc 2) (key-history u 1))) (macro spc) break
    ((and (key-history spc 2) (key-history a 1))) (macro spc) break
    ((and (key-history spc 2) (key-history i 1))) (macro spc) break
    ((and (key-history spc 4) (key-history t 3) (key-history h 2) (key-history e 1))) (macro spc) break


    








    ;; enter sfb
    ((key-history tab 1)) (macro enter) break
    ((key-history up 1)) (macro enter) break
    ((key-history down 1)) (macro enter) break


    ;; query
    ((key-history q 1)) (macro u e r y) break


    ;; https://
    ((and (key-history h 2) (key-history t 1))) (multi (release-key h) (release-key t) (macro t p s S-; / /)) break
    ;; https://www.
    ((and (key-history h 3) (key-history t 2) (key-history w 1))) (multi (release-key h) (release-key t) (release-key w)(macro bspc t p s S-; / / w w w .)) break









;; sfb

    ;; fix
    ((and (key-history f 2) (key-history i 1))) (macro x) break
    ;; six
    ((and (key-history s 2) (key-history i 1))) (macro x) break
    ;; mix
    ((and (key-history m 2) (key-history i 1))) (macro x) break
    ;; nix
    ((and(key-history n 2) (key-history i 1))) (macro x) break









    ((input-history real f16 2)) (macro S-') break
    ((input-history real f17 2)) (macro S-0) break
    ((input-history real lctl 2)) (macro S-0) break


;; sfb
    ((key-history g 1)) y break
    ((key-history i 1)) z break
    ((key-history c 1)) y break
    ((key-history p 1)) y break
    ((key-history y 1)) p break
    ((key-history j 1)) u break ;; big stretch
    ((key-history o 1)) a break
    ((key-history a 1)) o break
    ((key-history u 1)) e break


    () rpt break
  )

  ;; normal rpt with some exceptions
  rpeat (switch

    ;; oar trigram
    ((and(key-history a 1) (input-history real lsft 2))) (macro r) break

    ((key-history , 1)) (macro S-,) break
    ;; ((key-history . 1)) (macro S-.) break
    ((key-history \ 1)) (macro S-\) break
    ((key-history ; 1)) (macro S-;) break
    ((key-history 7 1)) (macro S-7) break
    ((key-history 9 1)) (macro S-9) break
    ((key-history 0 1)) (macro S-0) break

    ((key-history e 1)) (macro u) break


    ((input-history real f16 2)) (macro S-9) break

    ;; repeat the magic key for "nixpkgs"
    ((and(key-history x 1) (input-history real lsft 2))) (macro p k g s) break

    ((key-history spc 1)) (one-shot-press 2000 lsft) break

    () rpt break
  )
)

(deflayermap (base)
j /
/ j
x S--
f15 @magic



r @r

;; TODO not in nixpkgs yet
;; first list does tap if theyre pressed
;; second list does tap if theyre pressed and then released
t (tap-hold-release-tap-keys-release 120 120 t lsft (bspc f15 f16 f17 f18 ; spc) ())
a (tap-hold-release-tap-keys-release 120 120 a rsft (bspc f15 f16 f17 f18 ; spc) ())
c (tap-hold-release-tap-keys-release 120 120 c lctl (bspc f15 f16 f17 f18 ; spc) ())
h (tap-hold-release-tap-keys-release 120 120 h rctl (bspc f15 f16 f17 f18 ; spc) ())




f16 S-9
f17 S-0
lmet (multi (tap-hold-press 120 120 esc lmet) (layer-while-held sup))
f19 @magic
;; rsft (tap-hold-press 120 120 bspc rctl)
rsft bspc
ralt (tap-hold-press 120 120 tab (layer-while-held fn))
f18 S-;
lctrl @eqsft
bspc @rpeat

ent (tap-hold-press 120 120 ent (layer-while-held mods))


spc @space



3 S-[
8 S-]


, (tap-hold-press 120 120 , (layer-while-held syms))
; (tap-hold-press 120 120 ; (layer-while-held syms))

)

(deflayermap mods
;; w (cmd wlr-which-key -k l /home/${username}/.config/wlr-which-key/mpc.yaml)

l (movemouse-left 6 4)
o (movemouse-down 6 4)
u (movemouse-up 6 4)
. (movemouse-right 6 4)

w mlft
d mrtp

f (movemouse-speed 200)
b (movemouse-speed 50)




n lsft
s lsft
t lsft
c lctl

;; h lctl
;; a lsft
;; e lsft
;; i lsft
h left
a down
e up
i right

;; l left
;; o down
;; u up
;; j right

f15 home
f16 pgdn
f17 pgup
; end

;;w (macro C-w)
;;d (macro C-u)

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

)

(deflayermap melee
. j
f18 tab
f15 8
f16 9
f17 0
f19 lsft
n `

)

(deflayermap sup
lctl lctl
rsft rsft


f18 tab
f15 -
f16 9
f17 0
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
;;l left
;;o down
;;u up
;;j right
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
v 5
k 1
g 6
f15 7
f16 0
f17 4
; 8
r .

spc @space2
ent @enter
lmet esc

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
a pgdn
e pgup
i end



)


(defchordsv2
  ;; (r spc) rsft 18 first-release (over sup melee)

  (f15 a) @cw 16 all-released (over sup melee)
  (t g) caps 16 all-released (over sup melee)
  (u i) (macro S-[ S-; S-/ S-]) 16 all-released (over sup melee)
  (a f17) S-5 15 all-released (over sup melee)
  (h l) ' 15 all-released (over sup melee)
  (a o) S-5 15 all-released (over sup melee)

  (, ;) (macro S-; q) 20 all-released (over sup melee)
  (q z) (macro q S-;) 20 all-released (over sup melee)


  (b f    ) S-/ 20 all-released (over sup melee)
  (  f d  ) S-7 15 all-released (over sup melee)
  (  f   w) `   20 all-released (over sup melee)
  (    d w) S-8 15 all-released (over sup melee)
  
  (l o    ) S-' 14 all-released (over sup melee mods)
  (  o u  ) S-1 13 all-released (over sup melee mods)
  (    u .) S-6 15 all-released (over sup melee mods)

  (n s    ) S-, 14 all-released (over sup melee)
  (  s t  ) '   13 all-released (over sup melee)
  (  s   c) S-` 16 all-released (over sup melee)
  (    t c) [   14 all-released (over sup melee)

  ;; (h a    ) ]   14 all-released (over sup melee)
  (h a    ) ]   14 all-released (over sup melee)
  (h   e  ) del 15 all-released (over sup melee)
  (  a e  ) +   14 all-released (over sup melee)
  (    e i) S-. 14 all-released (over sup melee)

  (, v    ) \   20 all-released (over sup melee)
  (  v k  ) S-\ 20 all-released (over sup melee)
  (    k g) S-4 20 all-released (over sup melee)

  (f15 f16      ) S-3 20 all-released (over sup melee)
  ;; (f15     f17  ) S-5 20 all-released (over sup melee)
  (    f16 f17  ) x 15 all-released (over sup melee)
  (        f17 ;) S-2 15 all-released (over sup melee)

  ;; (h spc) \ 15 all-released (over sup melee)

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
