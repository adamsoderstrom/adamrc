#
# Gropen
# ––––
#
#
gropen () {
    open -e $(git remote get-url --push origin)
}