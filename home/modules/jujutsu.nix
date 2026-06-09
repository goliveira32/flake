{ meta, ... }:

{
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = meta.general.name;
        email = meta.general.email;
      };
      signing = {
        behavior = "own";
        backend = "ssh";
        key = meta.devel.github.sign;
        backends.ssh.allowed-signers = "~/.config/git/allowed_signers";
      };
    };
  };
}
