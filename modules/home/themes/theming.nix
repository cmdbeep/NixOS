{ pkgs, ... }:
{

  home.pointerCursor = {
    name = "phinger-cursors-dark";
    package = pkgs.phinger-cursors;
    size = 20;
    gtk.enable = true;
    x11.enable = true;
  };

  home.packages = with pkgs; [
    candy-icons
    phinger-cursors
    rose-pine-gtk-theme
  ];

  gtk = {
    enable = true;

    theme = {
      name = "rose-pine";
      package = pkgs.rose-pine-gtk-theme;
    };

    iconTheme = {
      name = "candy-icons";
      package = pkgs.candy-icons;
    };

    font = {
      name = "Inter";
      size = 10;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk2";
    style.name = "gtk2";
  };
}
