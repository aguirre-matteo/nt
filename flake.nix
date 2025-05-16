{
  description = "nt, asimple note-management tool!";

  outputs = { self, ... }: {
    package = import ./package.nix;
    overlay = import ./overlay.nix;
    homeManagerModule = import ./module.nix;
  };
}
