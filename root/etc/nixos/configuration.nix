# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # GRUB
  boot.loader = {
    grub = {
      enable = true;
      device = "/dev/sda";
      efiSupport = false;
    };
    
    efi.canTouchEfiVariables = false;
  };

  networking.hostName = "nixos"; 
  networking.networkmanager.enable = true; 

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Configure X11
  services= {
    # Enable some services
    printing.enable = true;
    libinput.enable = true;
    openssh.enable = true;
    
    # Install SDDM
    displayManager.sddm.enable = true;
    
    xserver = {
      # Enable x11
      enable = true;
      
      # Install Qtile and needed python packages for my config
      windowManager.qtile = {
        enable = true;
        extraPackages = python3Packages: with python3Packages; [
          qtile-extras
          psutil
        ];
      };

      
      xkb.layout = "us";
      xkb.options = "eurosign:e,caps:escape";
    };

    pipewire = {
      enable = true;
      pulse.enable = true;
    };
  };

  # Enable zsh before Nix tries to set zsh as my default shell
  programs.zsh.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nathan = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
    packages = with pkgs; [
      rofi
      brave
      nitrogen
      zsh
      fira-code
      starship
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim 
    wget
    fastfetch
    alacritty
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    xfce.thunar-media-tags-plugin
    git
    gnumake
    gcc
    xclip
    ripgrep
    unzip
    btop
    xorg.xrandr
  ];
  
  fonts.packages = [pkgs.fira-code];
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?

}

