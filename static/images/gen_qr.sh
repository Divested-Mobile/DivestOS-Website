echo -n "https://divestos.org/apks/official/fdroid/repo?fingerprint=E4BE8D6ABFA4D9D4FEEF03CDDA7FF62A73FD64B75566F6DD4E5E577550BE8467" | qrencode --size=5 --level=M --foreground=FF5722 --background=ffffff -o divestos-official-fdroid-repo.png;
optipng -strip all divestos-official-fdroid-repo.png;
