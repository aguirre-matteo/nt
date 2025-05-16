{ lib, pkgs, config, ... }:
let
  inherit (lib)
  mkIf mkEnableOption mkPackageOption mkOption;

  cfg = config.programs.nt;
  formatter = pkgs.formats.keyValue { };
in 
{
  options.programs.nt = {
    enable = mkEnableOption "nt";
    package = mkPackageOption pkgs "nt" { nullable = true; };
    fzf = mkPackageOption pkgs "fzf" { nullable = true; };
    eza = mkPackageOption pkgs "eza" { nullable = true; };
    settings = mkOption {
      type = formatter.type;
      default = { };
      example = {
        vault = "/home/myuser/Documents/vault";
        file-manager = "yazi";
        editor = "nvim";
      };
      description = ''
        Configuration settings for 'nt'. All the available options can be found here:
        <https://github.com/aguirre-matteo/nt?tab=readme-ov-file#configuration>.
      '';
    };
  };

  config = mkIf cfg.enable {
    home.packages = let
      ntPackage = if (cfg.package != null) then [ cfg.package ] else [ ];
      fzfPackage = if (cfg.fzf != null) then [ cfg.fzf ] else [ ];
      ezaPackage = if (cfg.eza != null) then [ cfg.eza ] else [ ];
    in ntPackage ++ fzfPackage ++ ezaPackage;

    xdg.configFile.nt = mkIf (cfg.settings != { }) { source = formatter.generate "nt-config" cfg.settings; };
  };
}
