{ ... }:
{
  programs.radicle = {
    enable = true;
    uri = {
      rad.browser = {
        enable = true;
      };
      web-rad = {
        enable = true;
        browser = "firefox.desktop";
      };
    };
    settings = {
      metrics = {
        enabled = false;
      };
    };
  };
}
