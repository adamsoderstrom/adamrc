# chcku
# ----
# Get the Centra Checkout API URL of the current directory's environment files.
function chcku() {
  echo $(lenv 'CHECKOUT_API' || lenv 'CENTRA_CHECKOUT_API') 
}

# chckt
# ----
# Get the Centra Checkout API URL of the current directory's environment files.
function chckt() {
  echo $(lenv 'CHECKOUT_API_KEY' || lenv 'CENTRA_CHECKOUT_API_KEY') 
}
