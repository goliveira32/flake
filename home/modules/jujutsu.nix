{ settings, ... }:
{

  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = settings.development.username;
        email = settings.development.email;
      };
    };
  };

}
