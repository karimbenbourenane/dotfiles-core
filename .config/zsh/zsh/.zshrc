# Zsh running configuration.

# Load common shell running configuration.
# Unable to statically follow since path is dynamic.
# shellcheck source=SCRIPTDIR/../sh/.shrc
. "${HOME}"/.config/sh/.shrc

# Set install path for oh-my-zsh.
export ZSH="${XDG_DATA_HOME:-${HOME}/.local/share}"/ohmyzsh

# Automatically update oh-my-zsh quietly.
zstyle ':omz:update' mode auto
zstyle ':omz:update' verbose silent

# Set plugins for oh-my-zsh.
# Appears unused by lack of references, but gets used when oh-my-zsh loads.
# shellcheck disable=SC2034
# Arrays in zsh are not POSIX-compliant.
# shellcheck disable=SC3030
plugins=(
	1password
	aliases
	colored-man-pages
	colorize
	command-not-found
	common-aliases
	copyfile
	docker
	docker-compose
	fzf
	git
	git-extras
	git-flow
	git-hubflow
	git-lfs
	history
	history-substring-search
	macos
	python
	rust
	themes
	vscode
	zsh-interactive-cd
	zsh-navigation-tools
)

# Load oh-my-zsh.
# Unable to statically follow since path is dynamic.
# shellcheck source=.local/share/ohmyzsh/oh-my-zsh.sh
# Unable to parse non-POSIX shell commands:
# shellcheck disable=SC1094
. "${ZSH}"/oh-my-zsh.sh

# Load individual configuration files.
ZDOTDIR="${ZDOTDIR:-"${XDG_CONFIG_HOME}"/zsh}"
find "${ZDOTDIR}"/.zshrc.d/enabled -type l | while read -r file; do
    # Do not statically follow source due to dynamic path.
    # shellcheck source=/dev/null
    [ -f "${file}" ] && [ -r "${file}" ] && . "${file}"
done
unset file

# Enable Oh My Posh as the final command in this initialization file.
eval "$(oh-my-posh init zsh || true)"
