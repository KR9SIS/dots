exists() {
  type "$1" >/dev/null 2>/dev/null
}

search_string=$(tofi-run --require-match=false)
if exists "$search_string"; then
  "$search_string"
else
  echo "$search_string" | xargs -I{} xdg-open "https:search.brave.com/search?q={}"
fi
