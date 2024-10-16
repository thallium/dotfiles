function l () {
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

cd_bookmarks() {
    # directory=$(fzf < ~/scripts/bookmarks.txt --preview="tree -L 1 {}" --bind=";:toggle-preview")
    directory=$(fzy < ~/scripts/bookmarks.txt)
    if [ -z "$directory" ]
    then
        echo $directory
        return
    fi
    cd $directory
    zle accept-line
    zle reset-prompt;
}

zle -N cd_bookmarks
bindkey -M viins '^G' cd_bookmarks

cd_fzf() {
    directory=$(fd -t d | fzf --preview="tree -L 1 {}" --bind=";:toggle-preview")
    if [ -z "$directory" ]
    then
        return
    fi
    cd $directory
    zle accept-line
    zle reset-prompt;
}

zle -N cd_fzf
# bindkey -M viins '^T' cd_fzf

file_fzf() {
  LBUFFER="${LBUFFER}$(fd -t f | fzf --height 40% -m)"
  zle reset-prompt
}

zle -N file_fzf
bindkey -M viins '^T' file_fzf

gfast() {
    g++-11 -Wall -Wextra -Wconversion -O2 -std=c++17 $1.cpp -o $1
}

gcomp() {
    g++-11 -O2 -Wall -Wextra -Wshift-overflow  -DLOCAL -D_GLIBCXX_DEBUG -std=c++17 $1.cpp -o $1
}

cfast() {
    cla -Wall -Wextra -O2 -std=c++17 $1.cpp -o $1
}

ccomp() {
    # cla -g -O2 -Wall -Wextra -Wshift-overflow  -DLOCAL -D_LIBCPP_DEBUG_LEVEL=2 -fsanitize=address,undefined -dsym-dir ~/dSYMs -std=c++17 $1.cpp -o $1
    cla -I/Users/tuogengchen/github/algo/master/src/ -include-pch /Library/Developer/CommandLineTools/SDKs/MacOSX13.sdk/usr/include/bits/stdc++.h.gch -g -Wall -Wextra -Wshift-overflow -Wshorten-64-to-32 -fno-omit-frame-pointer -DLOCAL -fsanitize=address,undefined -dsym-dir ~/dSYMs -std=c++20 $1.cpp -o $1

}

d() {
    cd "${$(dirs -p | fzf --height 10%)/#\~/$HOME}"
}

take() {
    mkdir -p $1
    cd $1
}

add_bookmark() {
    dir=$(pwd)
    if ! rg -x $dir ~/scripts/bookmarks.txt >/dev/null
        then echo $dir >> ~/scripts/bookmarks.txt
    else
        echo "This directory is already in bookmarks!"
    fi
}

add_user_phrase() {
    echo "$1\t$2\t0" >> /Users/tuogengchen/Library/Rime/user_dict.txt
}

query_dict() {
    rg "^$1\t" ~/Library/Rime/flypy.dict.yaml ~/Library/Rime/user_dict.txt
}

gen_task() {
    if (($# == 1))
    then
        mkdir -p $1/src
        sed "s/\$TASK/$1/" templates/Cargo.toml > $1/Cargo.toml
        cp templates/build.rs $1/build.rs
        cp templates/main.rs $1/src/main.rs
        gsed -i "\$i\    \"$1\"," Cargo.toml
    else
        mkdir -p $1/$2/src
        sed "s/\$TASK/$1$2/" templates/Cargo.toml > $1/$2/Cargo.toml
        cp templates/build.rs $1/$2/build.rs
        cp templates/main.rs $1/$2/src/main.rs
        gsed -i "\$i\    \"$1/$2\"," Cargo.toml
    fi
}

make() {
    /usr/bin/make $1; echo '\a'
}
