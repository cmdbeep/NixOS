{ ... }:
{
  programs.git = {
    enable = true;
    userName = "cmdbeep";
    userEmail = "cmdbeep@cmdbeep.com";
    settings = {
      url = {
        "git@github.com" = {
          insteadOf = "https://github.com/";
        };
      };
    };
  };
}
