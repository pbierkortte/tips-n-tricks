# Recursive SHA256SUM
## Code Snippet

```bash
tmpFile="$(mktemp)";
rm -f sha256sum.txt;
find . -type f -print0 \
| xargs -0 sha256sum \
| tee "$tmpFile"; 
mv "$tmpFile" sha256sum.txt
```
