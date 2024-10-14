{ ... }:
{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "default-web-browser" = [ "firefox.desktop" ];
      "application/pdf" = [ "firefox.desktop" ];
    };
  };
}
