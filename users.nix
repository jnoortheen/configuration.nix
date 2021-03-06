{ ... }:
{
  users.extraUsers = {
    synthetica = {
      isNormalUser = true;
      uid = 1000;
      extraGroups = [
        "wheel" "networkmanager"
        "nm-openvpn"
        "tty" "dialout" # For arduino
        "davfs2"
        "docker"
        "wireshark"
        "fuse" # for sshfs
        "audio"
        "sway"
        "video"
      ];
    };
  };

  nix = {
    trustedUsers = [ "root" "synthetica" ];
  };

  security.pam.loginLimits = [
    {
      domain = "*";
      type   = "hard";
      item   = "nofile";
      value  = "16384";
    }
  ];


  hardware.opengl = {
    driSupport = true;
  };

  virtualisation.virtualbox.host.enable = false;
  virtualisation.docker.enable = false;
}
