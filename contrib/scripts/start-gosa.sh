#!/bin/sh
# Start script for GOsa to be started via gecko based browsers

url=""
if [ $# -ne 1 ]; then
	echo "Usage: $(basename $0) <URL>"
	exit 1
fi

# What browser are we using?
result=""
for browser in iceweasel firefox mozilla; do
	if which $browser &> /dev/null; then
		result=$browser
		break
	fi
done
if [ -z "$result" ]; then
	echo "No suitable browser found to launch GOsa. You'll need iceweasel, firefox or mozilla in your PATH!"
	exit 1
fi
browser=$result

# Check for presence of gosa profile
if [ ! -d $HOME/.mozilla/$browser/*.gosa ]; then
	echo "No browser profile found for GOsa - creating one..."
	$browser -CreateProfile gosa
	config=`echo $HOME/.mozilla/$browser/*.gosa/`

	cat << EOF > $config/prefs.js
# Mozilla User Preferences

/* Do not edit this file.
 *
 * If you make changes to this file while the browser is running,
 * the changes will be overwritten when the browser exits.
 *
 * To make a manual change to preferences, you can visit the URL about:config
 * For more information, see http://www.mozilla.org/unix/customizing.html#prefs
 */

user_pref("app.update.autoUpdateEnabled", false);
user_pref("app.update.enabled", false);
user_pref("browser.download.folderList", 2);
user_pref("browser.download.manager.showWhenStarting", false);
user_pref("browser.formfill.enable", false);
user_pref("browser.preferences.lastpanel", 1);
user_pref("browser.search.selectedEngine", "Damnfresh");
user_pref("browser.startup.homepage", "$url");
user_pref("browser.startup.homepage_override.mstone", "rv:1.8.1.1");
user_pref("extensions.disabledObsolete", true);
user_pref("extensions.lastAppVersion", "2.0.0.1");
user_pref("extensions.update.autoUpdateEnabled", false);
user_pref("intl.charsetmenu.browser.cache", "ISO-8859-1");
user_pref("network.cookie.prefsMigrated", true);
user_pref("security.OCSP.URL", "");
user_pref("security.OCSP.signingCA", "Builtin Object Token:IPS CLASE1 root");
user_pref("security.warn_entering_secure", false);
user_pref("security.warn_leaving_secure", false);
user_pref("security.warn_submit_insecure", false);
user_pref("security.warn_viewing_mixed", false);
user_pref("signon.rememberSignons", false);
user_pref("security.warn_submit_insecure", false);
EOF

	cat << EOF > $config/84795799.s
#2c
http://vserver-02
.
EOF

	[ ! -d $config/chrome ] && mkdir -p $config/chrome
	cat << EOF > $config/chrome/userChrome.css
#main-menubar {
        display: none;
}
#navigator-throbber {
        display: none;
}
EOF

cat << EOF > $config/localstore.rdf
<?xml version="1.0"?>
<RDF:RDF xmlns:NC="http://home.netscape.com/NC-rdf#"
         xmlns:RDF="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <RDF:Description RDF:about="chrome://mozapps/content/downloads/unknownContentType.xul#unknownContentType"
                   screenX="267"
                   screenY="304" />
  <RDF:Description RDF:about="chrome://browser/content/browser.xul#PersonalToolbar"
                   currentset="__empty"
                   collapsed="true" />
  <RDF:Description RDF:about="chrome://browser/content/browser.xul#toolbar-menubar"
                   currentset="__empty"
                   collapsed="true" />
  <RDF:Description RDF:about="chrome://browser/content/browser.xul#sidebar-box"
                   collapsed="true"
                   sidebarcommand=""
                   width=""
                   src="" />
  <RDF:Description RDF:about="chrome://browser/content/browser.xul#status-bar"
                   hidden="true" />
  <RDF:Description RDF:about="chrome://browser/content/browser.xul">
    <NC:persist RDF:resource="chrome://browser/content/browser.xul#main-window"/>
    <NC:persist RDF:resource="chrome://browser/content/browser.xul#sidebar-box"/>
    <NC:persist RDF:resource="chrome://browser/content/browser.xul#sidebar-title"/>
    <NC:persist RDF:resource="chrome://browser/content/browser.xul#nav-bar"/>
    <NC:persist RDF:resource="chrome://browser/content/browser.xul#PersonalToolbar"/>
    <NC:persist RDF:resource="chrome://browser/content/browser.xul#toolbar-menubar"/>
  </RDF:Description>
  <RDF:Description RDF:about="chrome://mozapps/content/downloads/unknownContentType.xul">
    <NC:persist RDF:resource="chrome://mozapps/content/downloads/unknownContentType.xul#unknownContentType"/>
  </RDF:Description>
  <RDF:Description RDF:about="chrome://global/content/customizeToolbar.xul">
    <NC:persist RDF:resource="chrome://global/content/customizeToolbar.xul#CustomizeToolbarWindow"/>
  </RDF:Description>
  <RDF:Description RDF:about="chrome://help/content/help.xul#help"
                   screenX="350"
                   screenY="225"
                   width="700"
                   height="550" />
  <RDF:Description RDF:about="chrome://browser/content/browser.xul#main-window"
                   screenX="50"
                   screenY="25"
                   sizemode="normal"
                   width="994"
                   height="962" />
  <RDF:Description RDF:about="chrome://help/content/help.xul">
    <NC:persist RDF:resource="chrome://help/content/help.xul#help"/>
  </RDF:Description>
  <RDF:Description RDF:about="chrome://browser/content/browser.xul#nav-bar"
                   currentset="__empty"
                   collapsed="true" />
</RDF:RDF>



EOF
fi


# Start mozilla with GOsa profile
$browser -P gosa

