sitemap_urls() {
  local url="$1"

  if [[ -z "$url" ]]; then
    echo "Usage: sitemap_urls <sitemap_url>" >&2
    return 1
  fi

  curl -fsSL "$url" | xmllint --xpath '//*[local-name()="loc"]/text()' - | sed 's/ /\n/g' | httpx -status-code
}
