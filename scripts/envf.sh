# envf
# ----
# Find the current directory's environment file.
# Will prioritize in the following order:
# - `.env.local`
# - `.env`
alias envf="find . -maxdepth 1 -name '.env.local' -o -name '.env' | head -n 1"
