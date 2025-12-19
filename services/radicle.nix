{ ... }:
{
  services.radicle = {
    enable = true;
    node = {
      openFirewall = true;
    };
    privateKeyFile = "";
    settings = {
      web.pinned.repositories = [ ];
    };
  };
}
