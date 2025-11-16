{
  pkgs,
  ...
}: {
  boot = {
    loader = {
      timeout = 2;
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 50;
      efi.canTouchEfiVariables = true;
    };

    kernelModules = [];
    blacklistedKernelModules = [



    /* joystick devices */
    # "joydev"



/* sound */
# "snd_seq_dummy"
# "snd_hrtimer"
# "snd_seq"
# "snd_ctl_led"
# "snd_hda_codec_alc662"
# "snd_hda_codec_realtek_lib"
# "snd_hda_codec_atihdmi"
# "snd_hda_codec_generic"
# "snd_hda_codec_hdmi"
# "snd_usb_audio"
# "snd_hda_intel"
# "snd_hda_codec"
# "snd_ump"
# "snd_usbmidi_lib"
# "snd_hda_core"
# "snd_rawmidi"
# "snd_intel_dspcfg"
# "snd_seq_device"
# "snd_intel_sdw_acpi"
# "snd_hwdep"
# "snd_pcm"
# "snd_timer"
# "snd"
# "soundcore"
      ];
  };
}
