export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XDG_CONFIG_DIRS=/etc

export PATH=$PATH:$HOME/scripts

export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=1

export EDITOR="vi -e"
export VISUAL=/usr/bin/nvim
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export PYLINTHOME="$XDG_CACHE_HOME"/pylint
# fix "xdg-open fork-bomb" export your preferred browser from here
# export BROWSER=/usr/bin/chromium
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default
export LEIN_HOME="$XDG_DATA_HOME"/lein

export INPUT_METHOD  DEFAULT=fcitx
export GTK_IM_MODULE DEFAULT=fcitx
export QT_IM_MODULE  DEFAULT=fcitx
export XMODIFIERS    DEFAULT=\@im=fcitx
export GLFW_IM_MODULE=ibus
