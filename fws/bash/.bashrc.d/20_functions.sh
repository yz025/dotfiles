# cd
function cdconf() {
	if [ -z "$1" ]; then
		cd "$HOME/.config"
	else
		cd "$HOME/.config/$1"
	fi
}
function cddot() {
	if [ -z "$1" ]; then
		cd "$HOME/Documents/dotfiles"
	else
		cd "$HOME/Documents/dotfiles/$1"
	fi
}
function cdbash() {
	if [ -z "$1" ]; then
		cd "$HOME/.bashrc.d"
	else
		cd "$HOME/.bashrc.d/$1"
	fi
}
function cdproj() {
	if [ -z "$1" ]; then
		cd "$HOME/Documents/projects"
	else
		cd "$HOME/Documents/projects/$1"
	fi
}
function cdnotes() {
	if [ -z "$1" ]; then
		cd "$HOME/Documents/notes"
	else
		cd "$HOME/Documents/notes/$1"
	fi
}

# yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
