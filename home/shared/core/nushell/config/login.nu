# https://github.com/nushell/nushell/issues/10316
# https://www.nushell.sh/book/configuration.html#configuring-nu-as-a-login-shell
# https://www.nushell.sh/book/configuration.html#macos-keeping-usr-bin-open-as-open

$env.LANG = "en_US.UTF-8"
$env.LC_ALL = "en_US.UTF-8"

$env.XDG_DATA_DIRS = $"/var/lib/flatpak/exports/share:/usr/local/share/:/usr/share/:($env.HOME)/.local/share:($env.HOME)/.local/share/flatpak/exports/share"
