# chck
# ----
# The Centra Checkout API URL of the current directory's environment files.
function chcku() {
  file=$(envf)
  echo $(cat $file | rg '^CHECKOUT_API=(.*)' -or '$1' || cat $file | rg '^CENTRA_CHECKOUT_API=(.*)' -or '$1') 
}

function chckt() {
  file=$(envf)
  echo $(cat $file | rg '^CHECKOUT_API_KEY=(.*)' -or '$1' || cat $file | rg '^CENTRA_CHECKOUT_API_KEY=(.*)' -or '$1')
}
