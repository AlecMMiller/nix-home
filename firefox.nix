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
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };

      userChrome = ''
        #tabbrowser-tabs {
          --user-tab-rounding: 8px;
        }

        .tab-background {
          border-radius: var(--user-tab-rounding) var(--user-tab-rounding) 0px 0px !important;
          margin-block: 1px 0 !important;
        }

        #scrollbutton-up, #scrollbutton-down {
          border-top-width: 1px !important;
          border-bottom-width: 0 !important;
        }

        #urlbar:not([open=""])>#urlbar-background {
          border-radius: 50px !important;
        }

        #customizableui-special-spring1, #customizableui-special-spring2 {
          min-width: 0 !important;
          max-width: 0 !important;
        }

        :root {
          --accent: #b4befe;
          --surface1: #45475a;
          --base: #1e1e2e;
          --mantle: #181825;
          --crust: #11111b;
          --text: #cdd6f4;

          --toolbar: var(--base);
          --url-bar: var(--mantle);

          --toolbar-bgcolor: var(--toolbar) !important;

          --tab-selected-bgcolor: var(--base) !important;

          --toolbarbutton-icon-fill: var(--accent) !important;

          --toolbar-field-focus-border-color: var(--accent) !important;

          --toolbar-field-border-color: var(--url-bar) !important;
          --toolbar-field-background-color: var(--url-bar) !important;
          --toolbar-field-focus-background-color: var(--url-bar) !important;
          --toolbar-field-color: var(--text) !important;

          --tabs-navbar-separator-color: var(--url-bar) !important;
          --panel-separator-color: var(--surface1) !important;

          --chrome-content-separator-color: var(--url-bar) !important;
        }
      '';
    };
  };
}
