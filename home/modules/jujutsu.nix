{ meta, ... }:
{

  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = meta.devel.name;
        email = meta.devel.email;
      };
    };
  };

}
