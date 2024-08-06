{ pkgs, inputs, ... }:
{
  programs.firefox = {
    enable = true;
    profiles.default = {
      id = 0;
      name = "Alec";
      extensions = with inputs.firefox-addons.packages.${pkgs.system}; [ ublock-origin ];
      bookmarks = {};
      settings = {
        "browser.startup.homepage" = "about:home";
        "browser.download.panel.shown" = true;
        "browser.feeds.showFirstRunUI" = false;
        "browser.messaging-system.whatsNewPanel.enabled" = false;
        "browser.rights.3.shown" = true;
        "browser.shell.checkDefaultBrowser" = false;
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.topsites.contile.enabled" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts" = false;
        "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
        "browser.urlbar.suggest.quicksuggest.sponsored" = false;
        "extensions.autoDisableScopes" = 0;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.urlbar.suggest.trending" = false;
        "browser.urlbar.suggest.engines" = false;
        "browser.urlbar.suggest.addons" = false;
        "browser.urlbar.suggest.topsites" = false;
        "browser.urlbar.suggest.yelp" = false;
      };
    };
  };
}
