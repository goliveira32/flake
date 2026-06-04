{ settings, ... }:
{

  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      user = {
        name = settings.development.username;
        email = settings.development.email;
      };
      gpg.ssh.allowedSignersFile = "~/.config/git/allowed_signers";
    };
    signing = {
      format = "ssh";
      signByDefault = true;
      key = "~/.ssh/github_sign.pub";
    };
  };

}
