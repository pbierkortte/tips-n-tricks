xargs -a urls.txt curl -so /dev/null -w '%{url} %{http_code} %{redirect_url}\n' | column -t -s' ' | sort
