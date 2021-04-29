echo; for url in `cat urls.txt`; do echo -en "$url "; curl -Ls -o /dev/null -w %{url_effective} "$url";echo ; done | column -t -s' '
