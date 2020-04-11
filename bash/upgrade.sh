# Author
#   Jake Zimmerman <jake@zimmerman.io>
# with some changes by myself.

# Number of seconds to wait before printing a reminder
# 7 days
UPDATE_THRESHOLD="604800"

check_for_updates() {
  # Initialize for when we have no GNU date available
  last_check=0
  time_now=0

  # Ensure this is GNU date
  if [ -n "$(date --version 2> /dev/null | grep GNU)" ]; then
    last_update=$(date -r ~/.fresh/build +%s)
    time_now=$(date +%s)
  fi

  time_since_check=$((time_now - last_update))

  if [ "$time_since_check" -ge "$UPDATE_THRESHOLD" ]; then
    echo "$red==>$yellow Your system may be out of date!$reset"
    echo 'Run `fresh` to bring it up to date.'
  fi
}

check_for_updates
