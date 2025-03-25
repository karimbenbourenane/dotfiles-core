# Bash running configuration.

# Load common shell running configuration.
# Unable to statically follow since path is dynamic.
# shellcheck source=SCRIPTDIR/../sh/.shrc
. "${HOME}"/.config/sh/.shrc

# Enable Oh My Posh as the final command in this initialization file.
eval "$(oh-my-posh init bash)"
