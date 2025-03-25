# POSIX shell login profile configuration.

# Determine the Homebrew prefix and add environment to shell if it exists.
brew_prefix=$(is_apple_silicon && echo /opt/homebrew || echo /usr/local)
if [ -x "${brew_prefix}"/bin/brew ]; then
  eval "$("${brew_prefix}"/bin/brew shellenv || true)"
else
  warn "Homebrew environment missing: '${brew_prefix}/bin/brew shellenv'."
fi
unset brew_prefix

# Add user local binary path to search paths for *login shell* use.
path_prepend "${HOME}"/.local/bin

# Use Zed for editing text in local unprivileged sessions and use vi otherwise.
if [ -z "${SSH_CONNECTION}" ] && [ "$(id -u || true)" -ne 0 ]; then
  if command -v zed >/dev/null 2>&1; then
    EDITOR=$(command -v zed)
  fi
fi
unset uid
export EDITOR="${EDITOR:-$(command -v vi)}"
export VISUAL="${VISUAL:-${EDITOR}}"
