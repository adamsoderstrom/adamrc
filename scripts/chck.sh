# chck
# ----
# The Centra Checkout API URL of the current directory's environment files.
alias chcku="echo $(cat $(envf) | rg '^CHECKOUT_API=(.*)' -or '$1' || cat $(envf) | rg '^CENTRA_CHECKOUT_API=(.*)' -or '$1')"
alias chckt="echo $(cat $(envf) | rg '^CHECKOUT_API_KEY=(.*)' -or '$1' || cat $(envf) | rg '^CENTRA_CHECKOUT_API_KEY=(.*)' -or '$1')"
