{ meta, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      user = {
        name = meta.general.name;
        email = meta.general.email;
      };
      gpg.ssh.allowedSignersFile = "~/.config/git/allowed_signers";
    };
    signing = {
      format = "ssh";
      signByDefault = true;
      key = meta.devel.github.sign;
    };
  };
}
