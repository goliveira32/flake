{ meta, ... }:

{
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = meta.devel.name;
        email = meta.devel.email;
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
