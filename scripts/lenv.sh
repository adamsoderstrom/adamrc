lenv() {
  cat $(envf) | rg "^$1=(.*)" -or '$1'
}
