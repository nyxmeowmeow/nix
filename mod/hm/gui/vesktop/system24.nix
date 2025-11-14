{
  lib,
  theme,
  config,
  ...
}:
let
  theme_trimmed = lib.strings.removeSuffix "_zen" theme;
  col = import ../../../../theme/${theme_trimmed}/colors.nix;
  unrounding = if (import ../../../os/config.nix).config.rounding then "off" else "on";
in
{
  home.file.".config/vesktop/themes/system24_1.css".text = /* css */ ''
/* main.css */
@import url('https://refact0r.github.io/midnight-discord/build/midnight.css');
@import url('https://fonts.googleapis.com/css2?family=DM+Mono:ital,wght@0,300;0,400;0,500;1,300;1,400;1,500&display=swap');

@font-face {
    font-family: 'asciid';
    font-style: normal;
    font-weight: 400;
    src: local('asciid'), url('https://refact0r.github.io/system24/assets/asciid.woff') format('woff');
}

body {
    /* font, change to  for default discord font */
    --font: 'DM Mono'; /* change to  for default discord font */
    --code-font: 'DM Mono'; /* change to  for default discord font */
    font-weight: 300; /* text font weight. 300 is light, 400 is normal. DOES NOT AFFECT BOLD TEXT */
    letter-spacing: -0.05ch; /* decreases letter spacing for better readability. recommended on monospace fonts.*/

    /* sizes */
    --gap: 10px; /* spacing between panels */
    --divider-thickness: 4px; /* thickness of unread messages divider and highlighted message borders */
    --border-thickness: 2px; /* thickness of borders around main panels. DOES NOT AFFECT OTHER BORDERS */
    --border-hover-transition: 0.2s ease; /* transition for borders when hovered */

    /* animation/transition options */
    --animations: on; /* off: disable animations/transitions, on: enable animations/transitions */
    --list-item-transition: 0.2s ease; /* transition for list items */
    --dms-icon-svg-transition: 0.4s ease; /* transition for the dms icon */

    /* top bar options */
    --top-bar-height: var(--gap); /* height of the top bar (discord default is 36px, old discord style is 24px, var(--gap) recommended if button position is set to titlebar) */
    --top-bar-button-position: titlebar; /* off: default position, hide: hide buttons completely, serverlist: move inbox button to server list, titlebar: move inbox button to channel titlebar (will hide title) */
    --top-bar-title-position: off; /* off: default centered position, hide: hide title completely, left: left align title (like old discord) */
    --subtle-top-bar-title: off; /* off: default, on: hide the icon and use subtle text color (like old discord) */

    /* window controls */
    --custom-window-controls: off; /* off: default window controls, on: custom window controls */
    --window-control-size: 14px; /* size of custom window controls */

    /* dms button options */
    --custom-dms-icon: off; /* off: use default discord icon, hide: remove icon entirely, custom: use custom icon */
    --dms-icon-svg-url: url(""); /* icon svg url. MUST BE A SVG. */
    --dms-icon-svg-size: 90%; /* size of the svg (css mask-size property) */
    --dms-icon-color-before: var(--icon-secondary); /* normal icon color */
    --dms-icon-color-after: var(--white); /* icon color when button is hovered/selected */
    --custom-dms-background: off; /* off to disable, image to use a background image (must set url variable below), color to use a custom color/gradient */
    --dms-background-image-url: url(""); /* url of the background image */
    --dms-background-image-size: cover; /* size of the background image (css background-size property) */
    --dms-background-color: linear-gradient(70deg, var(--blue-2), var(--purple-2), var(--red-2)); /* fixed color/gradient (css background property) */

    /* background image options */
    --background-image: off; /* off: no background image, on: enable background image (must set url variable below) */
    --background-image-url: url(""); /* url of the background image */

    /* transparency/blur options */
    /* NOTE: TO USE TRANSPARENCY/BLUR, YOU MUST HAVE TRANSPARENT BG COLORS. FOR EXAMPLE: --bg-4: hsla(220, 15%, 10%, 0.7); */
    --transparency-tweaks: off; /* off: no changes, on: remove some elements for better transparency */
    --remove-bg-layer: off; /* off: no changes, on: remove the base --bg-3 layer for use with window transparency (WILL OVERRIDE BACKGROUND IMAGE) */
    --panel-blur: off; /* off: no changes, on: blur the background of panels */
    --blur-amount: 12px; /* amount of blur */
    --bg-floating: var(--bg-3); /* set this to a more opaque color if floating panels look too transparent. only applies if panel blur is on  */

    /* other options */
    --small-user-panel: on; /* off: default user panel, on: smaller user panel like in old discord */

    /* unrounding options */
    --unrounding: ${unrounding}; /* off: default, on: remove rounded corners from panels */

    /* styling options */
    --custom-spotify-bar: on; /* off: default, on: custom text-like spotify progress bar */
    --ascii-titles: on; /* off: default, on: use ascii font for titles at the start of a channel */
    --ascii-loader: system24; /* off: default, system24: use system24 ascii loader, cats: use cats loader */

    /* panel labels */
    --panel-labels: on; /* off: default, on: add labels to panels */
    --label-color: var(--text-muted); /* color of labels */
    --label-font-weight: 500; /* font weight of labels */
}

/* color options */
:root {
    --colors: on; /* off: discord default colors, on: midnight custom colors */

    /* text colors */
    --text-0: var(--bg-4); /* text on colored elements */
    --text-1: oklch(95% 0 0); /* other normally white text */
    --text-2: oklch(85% 0 0); /* headings and important text */
    --text-3: oklch(75% 0 0); /* normal text */
    --text-4: oklch(60% 0 0); /* icon buttons and channels */
    --text-5: oklch(40% 0 0); /* muted channels/chats and timestamps */

    /* background and dark colors */
    --bg-1: oklch(31% 0 0); /* dark buttons when clicked */
    --bg-2: oklch(27% 0 0); /* dark buttons */
    --bg-3: oklch(23% 0 0); /* spacing, secondary elements */
    --bg-4: oklch(19% 0 0); /* main background color */
    --hover: oklch(54% 0 0 / 0.1); /* channels and buttons when hovered */
    --active: oklch(54% 0 0 / 0.2); /* channels and buttons when clicked or selected */
    --active-2: oklch(54% 0 0 / 0.3); /* extra state for transparent buttons */
    --message-hover: var(--hover); /* messages when hovered */

    /* accent colors */
    --accent-1: var(--purple-1); /* links and other accent text */
    --accent-2: var(--purple-2); /* small accent elements */
    --accent-3: var(--purple-3); /* accent buttons */
    --accent-4: var(--purple-4); /* accent buttons when hovered */
    --accent-5: var(--purple-5); /* accent buttons when clicked */
    --accent-new: var(--red-2); /* stuff that's normally red like mute/deafen buttons */
    --mention: linear-gradient(to right, color-mix(in hsl, var(--accent-2), transparent 90%) 40%, transparent); /* background of messages that mention you */
    --mention-hover: linear-gradient(to right, color-mix(in hsl, var(--accent-2), transparent 95%) 40%, transparent); /* background of messages that mention you when hovered */
    --reply: linear-gradient(to right, color-mix(in hsl, var(--text-3), transparent 90%) 40%, transparent); /* background of messages that reply to you */
    --reply-hover: linear-gradient(to right, color-mix(in hsl, var(--text-3), transparent 95%) 40%, transparent); /* background of messages that reply to you when hovered */

    /* status indicator colors */
    --online: var(--green-2); /* change to #40a258 for default */
    --dnd: var(--red-2); /* change to #d83a41 for default */
    --idle: var(--yellow-2); /* change to #cc954c for default */
    --streaming: var(--purple-2); /* change to ##9147ff for default */
    --offline: var(--text-4); /* change to #82838b for default offline color */

    /* border colors */
    --border-light: var(--hover); /* general light border color */
    --border: var(--active); /* general normal border color */
    --border-hover: var(--accent-2); /* border color of panels when hovered */
    --button-border: hsl(220, 0%, 100%, 0.1); /* neutral border color of buttons */

    /* base colors */
    --red-1: oklch(75% 0.13 0);
    --red-2: oklch(70% 0.13 0);
    --red-3: oklch(65% 0.13 0);
    --red-4: oklch(60% 0.13 0);
    --red-5: oklch(55% 0.13 0);

    --green-1: oklch(75% 0.12 170);
    --green-2: oklch(70% 0.12 170);
    --green-3: oklch(65% 0.12 170);
    --green-4: oklch(60% 0.12 170);
    --green-5: oklch(55% 0.12 160);

    --blue-1: oklch(75% 0.11 215);
    --blue-2: oklch(70% 0.11 215);
    --blue-3: oklch(65% 0.11 215);
    --blue-4: oklch(60% 0.11 215);
    --blue-5: oklch(55% 0.11 215);

    --yellow-1: oklch(80% 0.12 90);
    --yellow-2: oklch(75% 0.12 90);
    --yellow-3: oklch(70% 0.12 90);
    --yellow-4: oklch(65% 0.12 90);
    --yellow-5: oklch(60% 0.12 90);

    --purple-1: oklch(75% 0.12 310);
    --purple-2: oklch(70% 0.12 310);
    --purple-3: oklch(65% 0.12 310);
    --purple-4: oklch(60% 0.12 310);
    --purple-5: oklch(55% 0.12 310);
}

body {
    --custom-chatbar: separated !important; /* off: default chatbar, aligned: chatbar aligned with the user panel, separated: chatbar separated from chat */
    --chatbar-height: 56px !important; /* height of the chatbar (52px by default, 47px recommended for aligned, 56px recommended for separated) */
}

.visual-refresh {
    .bg__960e4 {
        background: var(--bg-base-primary);
    }
    .container__01ae2 {
        background-color: var(--bg-base-primary);
    }
    .container__37e49 {
        padding: 8px;
    }
}

/* ascii.css */
@property --ascii-titles {
    syntax: 'off | on';
    inherits: false;
    initial-value: on;
}

@container body style(--ascii-titles: on) {
    h3[data-text-variant='heading-xxl/extrabold'] {
        font-family: 'asciid';
        font-size: 50px;
        font-weight: 400;
    }
}

@property --ascii-loader {
    syntax: 'off | system24 | cats';
    inherits: false;
    initial-value: system24;
}

@container body style(--ascii-loader: system24) {
    .content_a2f514 {
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 20px;
    }
    .content_a2f514 > .spinner_a2f514 {
        display: none;
    }
    .content_a2f514::before {
        display: block;
        content: '                    __                ___  __ __\A    _______  _______/ /____  ____ ___ |__ \\/ // /\A   / ___/ / / / ___/ __/ _ \\/ __ `__ \\__/ / // /_\A  (__  ) /_/ (__  ) /_/  __/ / / / / / __/__  __/\A/____/\\__, /____/\\__/\\___/_/ /_/ /_/____/ /_/   \A      /____/                                     ';
        font-size: 18px;
        font-family: monospace;
        white-space: pre;
        line-height: 1.2;
        background: linear-gradient(to right, var(--brand-360) 0%, var(--background-accent) 25%, var(--background-accent) 75%, var(--brand-360) 100%);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-size: 200% auto;
        animation: textShine 1.5s linear infinite reverse;
    }
    .text_a2f514 {
        position: static;
    }

    @keyframes textShine {
        0% {
            background-position: 0% 50%;
        }
        50% {
            background-position: 100% 50%;
        }
        50.0001% {
            background-position: -100%, 50%;
        }
        100% {
            background-position: 0% 50%;
        }
    }
}

@container body style(--ascii-loader: cats) {
    .content_a2f514 {
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 32px;
        position: static;
    }
    .content_a2f514 > .spinner_a2f514 {
        display: none;
    }
    .content_a2f514::before {
        display: block;
        content: url('https://raw.githubusercontent.com/refact0r/system24/refs/heads/main/assets/cats.gif');
    }
    .text_a2f514 {
        position: static;
    }
}

/* colors.css */
@container root style(--colors: on) {
    #app-mount .wrapper__44b0c,
    #app-mount .container__1ce5d {
        --online-2: var(--online);
        --dnd-2: var(--dnd);
        --idle-2: var(--idle);
        --offline-2: var(--offline);
        --streaming-2: var(--streaming);
    }
}

/* panel-labels.css */
body {
    --label-color: var(--text-muted);
    --label-hover-color: var(--brand-360);
    --label-font-weight: 500;
}

@property --panel-labels {
    syntax: 'off | on';
    inherits: false;
    initial-value: on;
}

@container body style(--panel-labels: on) {
    .visual-refresh {
        .guilds_c48ade,
        .panels_c48ade,
        .sidebarList_c48ade,
        .subtitleContainer_f75fb0,
        .messagesWrapper__36d07,
        .channelTextArea_f75fb0,
        .content_f75fb0 > .membersWrap_c8ffbb,
        .container_c8ffbb,
        .container__133bf > .container__9293f,
        .peopleColumn__133bf,
        .nowPlayingColumn__133bf,
        .container__01ae2 > .container__9293f,
        .callContainer_cb9592 {
            &::after {
                display: block;
                color: var(--label-color);
                font-weight: var(--label-font-weight);
                position: absolute;
                top: -10px;
                left: 8px;
                background-color: var(--bg-base-primary);
                padding: 0 4px;
                z-index: 100;
                font-size: 16px;
                transition: color var(--border-hover-transition);
            }

            &:hover::after {
                color: var(--label-hover-color);
            }
        }

        .guilds_c48ade::after {
            content: 'nav';
        }
        .panels_c48ade::after {
            content: 'user';
        }
        .sidebarList_c48ade::after {
            content: 'channels';
        }
        .subtitleContainer_f75fb0::after {
            content: 'channel';
        }
        .messagesWrapper__36d07::after {
            content: 'chat';
        }
        .channelTextArea_f75fb0::after {
            content: 'input';
        }
        .container_c8ffbb::after,
        .content_f75fb0 > .membersWrap_c8ffbb::after {
            content: 'members';
        }
        .container__133bf > .container__9293f:after {
            content: 'friends';
        }
        .peopleColumn__133bf::after {
            content: 'list';
        }
        .nowPlayingColumn__133bf::after {
            content: 'activity';
        }
        .container__01ae2 > .container__9293f::after {
            content: 'thread';
        }
        .callContainer_cb9592::after {
            content: 'vc';
        }

        .content_f75fb0 > .membersWrap_c8ffbb,
        .panels_c48ade,
        .sidebar_c48ade,
        .sidebarList_c48ade,
        .chat_f75fb0,
        .page_c48ade,
        .channelTextArea_f75fb0,
        .container__133bf,
        .container_c8ffbb,
        .guilds_c48ade,
        .peopleColumn__133bf,
        .tabBody__133bf,
        .container__01ae2,
        .chatContent_f75fb0 {
            overflow: visible;
        }
        .page_c48ade,
        .tabBody__133bf {
            min-height: 0;
        }
        .peopleColumn__133bf {
            min-width: 0;
        }
        .sidebarList_c48ade,
        .container_c8ffbb,
        .peopleColumn__133bf,
        .nowPlayingColumn__133bf {
            position: relative;
        }

        .scroller__36d07 {
            top: 8px;
        }
        .membersWrap_c8ffbb,
        .guilds_c48ade,
        .sidebarList_c48ade {
            padding-top: 8px;
        }
        .membersWrap_c8ffbb {
            height: calc(100% - 8px);
        }

        .scroller_ef3116 {
            padding-top: calc(var(--custom-guild-list-padding) - 8px);
        }

        .animatedContainer_f37cb1,
        .headerGlass_f37cb1 {
            left: 8px;
            right: 8px;
            width: auto;
        }
        .header_f37cb1 {
            margin: 0 8px;
        }
        .container__2637a {
            overflow: hidden;
        }

        .headerEllipseForeground_f37cb1 {
            display: none;
        }

        .callContainer_cb9592 {
            padding: 8px;
        }

        .messagesWrapper__36d07 {
            mask: none !important;
        }
    }
}

/* spotify-bar.css */
@property --custom-spotify-bar {
    syntax: 'off | on';
    inherits: false;
    initial-value: on;
}

@container body style(--custom-spotify-bar: on) {
    .visual-refresh {
        /* text-like spotify progress bar */
        #vc-spotify-progress-bar {
            margin: 8px 0 0 0;
        }
        .vc-spotify-button-row {
            margin-top: 8px;
        }
        #app-mount #vc-spotify-progress-bar .bar_a562c8 {
            height: 22px !important;
            top: 0 !important;
            background-color: var(--background-surface-high);
        }
        #app-mount #vc-spotify-progress-bar .barFill_a562c8 {
            height: 22px !important;
        }
        #vc-spotify-progress-bar .vc-spotify-time-left,
        #vc-spotify-progress-bar .vc-spotify-time-right {
            z-index: 1;
            top: 0;
            margin-top: 0;
            mix-blend-mode: difference;
            font-size: 16px;
            line-height: 22px;
            pointer-events: none;
        }
        #vc-spotify-progress-bar .vc-spotify-time-left {
            left: 6px;
        }
        #vc-spotify-progress-bar .vc-spotify-time-right {
            right: 6px;
        }
        #vc-spotify-progress-bar .grabber_a562c8 {
            visibility: hidden;
        }
    }
}

/* unrounding.css */
@property --unrounding {
    syntax: 'off | on';
    inherits: false;
    initial-value: on;
}

@container body style(--unrounding: on) {
    *,
    *::before,
    *::after {
        border-radius: 0px !important;
    }

    .svg_cc5dd2 > mask,
    .svg__44b0c > rect,
    .svg__44b0c > circle,
    .svg__44b0c > g,
    .svg__44b0c rect[mask='url(#:rhi:)'],
    .avatar__20a53 .status_a423bd {
        display: none;
    }

    .mask__68edb > foreignObject,
    .svg__44b0c > foreignObject,
    .svg__2338f > foreignObject {
        mask: none;
    }

    .wrapper__44b0c,
    .container__1ce5d {
        --online-2: #43a25a;
        --dnd-2: #d83a41;
        --idle-2: #ca9654;
        --offline-2: #82838b;
        --streaming-2: #9147ff;
    }
    .wrapper__44b0c:has(rect)::after,
    .container__1ce5d:has(.status_a423bd)::after {
        content: "";
        display: block;
        position: absolute;
        height: 8px;
        width: 8px;
        bottom: -4px;
        right: -4px;
        border: 2px solid var(--background-base-lower);
    }
    .wrapper__44b0c:has(rect[fill='#43a25a'])::after,
    .container__1ce5d:has(.status_a423bd[style='background-color: rgb(67, 162, 90);'])::after {
        background: var(--online-2) !important;
    }
    .wrapper__44b0c:has(rect[fill='#d83a42'])::after {
        background: var(--dnd-2) !important;
    }
    .wrapper__44b0c:has(rect[fill='#ca9654'])::after {
        background: var(--idle-2) !important;
    }
    .wrapper__44b0c:has(rect[fill='#82838b'])::after {
        background: var(--offline-2) !important;
    }
    .wrapper__44b0c:has(rect[fill='#9147ff'])::after {
        background: var(--streaming-2);
    }

    .lowerBadge_cc5dd2 {
        border: 2px solid var(--background-base-lower);
        bottom: -4px;
        right: -4px;
    }
    .upperBadge_cc5dd2 {
        border: 2px solid var(--background-base-lower);
        top: -4px;
        right: -4px;
    }
    .folderGroup__48112.isExpanded__48112 > .stack_dbd263 {
        overflow: visible !important;
    }

    .slider__87bf1 > rect[rx='10'] {
        rx: 0 !important;
    }

    ::-webkit-scrollbar-thumb {
        border-radius: 0px !important;
    }
}

'';
















































  home.file.".config/vesktop/themes/system24_2.css".text = ''
/**
 * @name system24
 * @description a tui-style discord theme.
 * @author refact0r
 * @version 2.0.0
 * @invite nz87hXyvcy
 * @website https://github.com/refact0r/system24
 * @source https://github.com/refact0r/system24/blob/master/theme/system24.theme.css
 * @authorId 508863359777505290
 * @authorLink https://www.refact0r.dev
*/

/* import theme modules */
/* @import url('https://refact0r.github.io/system24/build/system24.css'); */

body {
    --font: '${config.stylix.fonts.monospace.name}'; /* change to for default discord font */
    --code-font: 'Iosevka Nerd Font Mono'; /* change to for default discord font */
    /* font-weight: 300; /* text font weight. 300 is light, 400 is normal. DOES NOT AFFECT BOLD TEXT */ */
    letter-spacing: -0.05ch; /* decreases letter spacing for better readability. recommended on monospace fonts.*/

    /* sizes */
    --gap: 10px; /* spacing between panels */
    --divider-thickness: 4px; /* thickness of unread messages divider and highlighted message borders */
    --border-thickness: 2px; /* thickness of borders around main panels. DOES NOT AFFECT OTHER BORDERS */
    --border-hover-transition: 0.2s ease; /* transition for borders when hovered */

    /* animation/transition options */
    --animations: on; /* off: disable animations/transitions, on: enable animations/transitions */
    --list-item-transition: 0.2s ease; /* transition for list items */
    --dms-icon-svg-transition: 0.4s ease; /* transition for the dms icon */

    /* top bar options */
    --top-bar-height: var(--gap); /* height of the top bar (discord default is 36px, old discord style is 24px, var(--gap) recommended if button position is set to titlebar) */
    --top-bar-button-position: titlebar; /* off: default position, hide: hide buttons completely, serverlist: move inbox button to server list, titlebar: move inbox button to channel titlebar (will hide title) */
    --top-bar-title-position: off; /* off: default centered position, hide: hide title completely, left: left align title (like old discord) */
    --subtle-top-bar-title: off; /* off: default, on: hide the icon and use subtle text color (like old discord) */

    /* window controls */
    --custom-window-controls: off; /* off: default window controls, on: custom window controls */
    --window-control-size: 14px; /* size of custom window controls */

    /* dms button options */
    --custom-dms-icon: off; /* off: use default discord icon, hide: remove icon entirely, custom: use custom icon */
    --dms-icon-svg-url: url(""); /* icon svg url. MUST BE A SVG. */
    --dms-icon-svg-size: 90%; /* size of the svg (css mask-size property) */
    --dms-icon-color-before: var(--icon-secondary); /* normal icon color */
    --dms-icon-color-after: var(--white); /* icon color when button is hovered/selected */
    --custom-dms-background: off; /* off to disable, image to use a background image (must set url variable below), color to use a custom color/gradient */
    --dms-background-image-url: url(""); /* url of the background image */
    --dms-background-image-size: cover; /* size of the background image (css background-size property) */
    --dms-background-color: linear-gradient(70deg, var(--blue-2), var(--purple-2), var(--red-2)); /* fixed color/gradient (css background property) */

    /* background image options */
    --background-image: off; /* off: no background image, on: enable background image (must set url variable below) */
    --background-image-url: url(""); /* url of the background image */

    /* transparency/blur options */
    /* NOTE: TO USE TRANSPARENCY/BLUR, YOU MUST HAVE TRANSPARENT BG COLORS. FOR EXAMPLE: --bg-4: hsla(220, 15%, 10%, 0.7); */
    --transparency-tweaks: on; /* off: no changes, on: remove some elements for better transparency */
    --remove-bg-layer: off; /* off: no changes, on: remove the base --bg-3 layer for use with window transparency (WILL OVERRIDE BACKGROUND IMAGE) */
    --panel-blur: off; /* off: no changes, on: blur the background of panels */
    --blur-amount: 12px; /* amount of blur */
    --bg-floating: var(--bg-3); /* set this to a more opaque color if floating panels look too transparent. only applies if panel blur is on  */

    /* other options */
    --small-user-panel: on; /* off: default user panel, on: smaller user panel like in old discord */

    /* unrounding options */
    --unrounding: ${unrounding}; /* off: default, on: remove rounded corners from panels */

    /* styling options */
    --custom-spotify-bar: on; /* off: default, on: custom text-like spotify progress bar */
    --ascii-titles: off; /* off: default, on: use ascii font for titles at the start of a channel */
    --ascii-loader: system24; /* off: default, system24: use system24 ascii loader, cats: use cats loader */

    /* panel labels */
    --panel-labels: off; /* off: default, on: add labels to panels */
    --label-color: var(--text-muted); /* color of labels */
    --label-font-weight: 500; /* font weight of labels */
}

/* color options */
:root {
    --colors: on; /* off: discord default colors, on: midnight custom colors */

    /* text colors */
    --text-0: var(--bg-4); /* text on colored elements */
    --text-1: ${col.fg}; /* other normally white text */
    --text-2: ${col.fg}; /* headings and important text */
    --text-3: ${col.fg}; /* normal text */
    --text-4: #75797f; /* icon buttons and channels */
    --text-5: #75797f; /* muted channels/chats and timestamps */

    /* background and dark colors */
    --bg-1: ${col.bgtrans}; /* dark buttons when clicked */
    --bg-2: #22262D; /* dark buttons */
    --bg-3: #22262D; /* spacing, secondary elements */
    --bg-4: ${col.bgtrans}; /* main background color */
    --hover: oklch(54% 0 0 / 0.1); /* channels and buttons when hovered */
    --active: oklch(54% 0 0 / 0.2); /* channels and buttons when clicked or selected */
    --active-2: oklch(54% 0 0 / 0.3); /* extra state for transparent buttons */
    --message-hover: var(--hover); /* messages when hovered */

    /* accent colors */
    --accent-1: #7FB4CA; /* links and other accent text */
    --accent-2: #7FB4CA; /* small accent elements */
    --accent-3: #7FB4CA; /* accent buttons */
    --accent-4: #7FB4CA; /* accent buttons when hovered */
    --accent-5: #7FB4CA; /* accent buttons when clicked */
    --accent-new: var(--red-2); /* stuff that's normally red like mute/deafen buttons */
    --mention: linear-gradient(to right, color-mix(in hsl, var(--accent-2), transparent 90%) 40%, transparent); /* background of messages that mention you */
    --mention-hover: linear-gradient(to right, color-mix(in hsl, var(--accent-2), transparent 95%) 40%, transparent); /* background of messages that mention you when hovered */
    --reply: linear-gradient(to right, color-mix(in hsl, var(--text-3), transparent 90%) 40%, transparent); /* background of messages that reply to you */
    --reply-hover: linear-gradient(to right, color-mix(in hsl, var(--text-3), transparent 95%) 40%, transparent); /* background of messages that reply to you when hovered */

    /* status indicator colors */
    --online: var(--green-2); /* change to #40a258 for default */
    --dnd: var(--red-2); /* change to #d83a41 for default */
    --idle: var(--yellow-2); /* change to #cc954c for default */
    --streaming: var(--purple-2); /* change to ##9147ff for default */
    --offline: var(--text-4); /* change to #82838b for default offline color */

    /* border colors */
    --border-light: var(--hover); /* general light border color */
    --border: var(--active); /* general normal border color */
    --border-hover: var(--accent-2); /* border color of panels when hovered */
    --button-border: hsl(220, 0%, 100%, 0.1); /* neutral border color of buttons */

    /* base colors */
    --red-1: #C34043;
    --red-2: #C34043;
    --red-3: #C34043;
    --red-4: #C34043;
    --red-5: #C34043;

    --green-1: #98BB6C;
    --green-2: #98BB6C;
    --green-3: #98BB6C;
    --green-4: #98BB6C;
    --green-5: #98BB6C;

    --blue-1: oklch(75% 0.11 215);
    --blue-2: oklch(70% 0.11 215);
    --blue-3: oklch(65% 0.11 215);
    --blue-4: oklch(60% 0.11 215);
    --blue-5: oklch(55% 0.11 215);

    --yellow-1: #DCA561;
    --yellow-2: #DCA561;
    --yellow-3: #DCA561;
    --yellow-4: #DCA561;
    --yellow-5: #DCA561;

    --purple-1: oklch(75% 0.12 310);
    --purple-2: oklch(70% 0.12 310);
    --purple-3: oklch(65% 0.12 310);
    --purple-4: oklch(60% 0.12 310);
    --purple-5: oklch(55% 0.12 310);
}















*::-webkit-scrollbar-thumb,
*::-webkit-scrollbar-track {
  background-color: transparent !important;
}



.visual-refresh .wrapper_ef3116 {
    background-color: transparent !important;
}
.theme-dark .container__37e49 {
    background: transparent !important;
}
.visual-refresh .scroller__99e7c {
    background: transparent !important;
}
.visual-refresh .privateChannels__35e86 {
    background: transparent;
}
.visual-refresh .sidebar_c48ade:after {
    background: transparent;
}


/* top right search bar */
.searchBar__97492 {
    border: none;
}

/* hide youtube watch together thing */
.itemContainer__675e5 {
  display: none;
}

/* remove border at top of homepage */
.container__9293f {
  border-bottom: none !important;
}

/* hide replying to x button */
.closeButton_e876a8 {
  visibility: hidden;
}

/* top right button */
.visual-refresh .iconWrapper__9293f {
  display: none;
}

.visual-refresh .side_b3f026 .themed_b3f026.selected_b3f026.item_b3f026,
.visual-refresh .topPill_b3f026 .themed_b3f026.selected_b3f026.item_b3f026 {
  background-color: transparent;
}

.dot__9293f {
  display: none;
}


/* remove text below the friend bar */
.container__13cf1 {
  display: none;
}

.header__7d20c {
  display: none;
}

/* remove the buttons to the right of items in online friends list on homepage */
.actions_fc004c {
  display: none;
}



/* remove message hover popup thing */
.message__5126c>.buttonContainer_c19a55 {
  display: none !important;
}

/* transparent chat area */
.visual-refresh .chatContent_f75fb0,
.visual-refresh.channelTextArea_f75fb0 {
  background: transparent !important;
}


/* transparent homepage */
.visual-refresh .tabBody__133bf {
  background-color: transparent;
}

.theme-dark .themed__9293f {
  background: transparent !important;
}


/* hide avatar in top bar */
.wrapper__44b0c.pointer__44b0c.avatar_f75fb0 {
  display: none;
}

.visual-refresh {
  div[class^="bg_"] {
    &>div[class^="bar_"] {
      display: none;
    }
  }

  ul[data-list-id="guildsnav"]>div[class^="itemsContainer_"] {
    margin-top: 6px;
  }
}




/* hide ctrl k tip */
.protip_ac6cb0 {
  display: none
}

/* remove ctrl k border */
.visual-refresh .quickswitcher_ac6cb0 {
  border: none;
}


[aria-label="Add a Server"] {
  display: none;
}

[aria-label="Discover"] {
  display: none;
}

[aria-label="Download Apps"] {
  display: none;
}

[aria-label="New Group DM"] {
  display: none;
}



/* hide the buttons on the right of the input bar */
.buttons__74017 {
  display: none;
}

/* hide the ctrl k menu button */
.searchBar__35e86 {
  display: none;
}

/* transparent bottom left profile panel */
.visual-refresh .panels_c48ade {
  background: transparent !important;
}


/* remove bottom left profile button */
/* .avatarWrapper__37e49 { */
/*   visibility: hidden; */
/* } */


/* hide nitro and shop buttons on homepage */
[href="/store"],
[href='/shop'] {
  display: none;
}


/* remove border on active now elements */
.wrapper__00943 {
  border: none;
}

.visual-refresh .outer_bf1984 {
  background-color: transparent;
}

/* remove homepage search bar */
.searchBar__5ec2f {
  display: none;
}

/* make non-hovered discord logo background transparent */
.visual-refresh .childWrapperNoHoverBg__6e9f8 {
  background-color: transparent;
}

/* remove border between friends in homepage */
.peopleListItem_cc6179 {
  border-top: none;
}
/* remove dms list divider */
.sectionDivider__35e86 {
  display: none;
}

/* add padding to friends button on homepage */
.friendsButtonContainer__35e86 {
  padding-bottom: 2px;
}


.visual-refresh {
    .guilds_c48ade, .sidebarList_c48ade, .panels_c48ade, .chat_f75fb0 > .subtitleContainer_f75fb0, .chatContent_f75fb0, .container_c8ffbb, .content_f75fb0 > .membersWrap_c8ffbb, .container__133bf > .container__9293f, .container_f391e3 > .container__9293f, .homeWrapper__0920e > .container__9293f, .container__01ae2 > .container__9293f, .container_fb64c9 > .container__9293f, .peopleColumn__133bf, .nowPlayingColumn__133bf, .scroller_c880e8, .container_f391e3 > .content_f75fb0, .shop__6db1d, .content_f75fb0 > .outer_c0bea0, .searchResultsWrap_a9e706, .container_f369db, .chat_fb64c9, .container_a592e1, .callContainer_cb9592, .wrapper_cb9592.sidebarOpen_cb9592 .callContainer_cb9592, .callContainer__722ff, .chat_f75fb0 > .header_c791b2, .chat_f75fb0 > .scrollerBase_d125d2, .chat_f75fb0 > .header__0b563, .chat_f75fb0 > .container__0b563 {
        background-color: transparent;
      }
    }

@container body style(--custom-chatbar: separated) {
    .visual-refresh {
        .messagesWrapper__36d07 {
            background-color: transparent;
          }
        }
      }

.chatGradient__36d07 {
    background: transparent;
}
@container body style(--custom-chatbar: separated) {
    .visual-refresh {
        .channelTextArea_f75fb0 {
            background-color: transparent;
          }
        }
      }


'';
}
