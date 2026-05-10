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
    };
  };

}
