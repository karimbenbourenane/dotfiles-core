# Zsh environment configuration.

# Load common shell environment variables.
# Unable to statically follow since path is dynamic.
# shellcheck source=SCRIPTDIR/../sh/.env
. "${HOME}"/.config/sh/.env

# Set Zsh configuration directory if it was not already set by /etc/zshenv.
ZDOTDIR="${ZDOTDIR:-"${HOME}"/.config/zsh}"
