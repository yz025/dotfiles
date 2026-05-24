function print_green() {
	echo -e "\e[32m$1\e[0m"
}
function update-gfm() {
	local root="$HOME/Documents/projects/git_fetch_mtime"

	git -C "$root" pull
	clang "$root/main.c" -o "$root/git_fetch_mtime" -Wall -Wextra -Wpedantic -std=c99 -O2
}
function update-ddf() {
	local root="$HOME/Documents/projects/ddf"

	git -C "$root" pull
	cargo build --manifest-path "$root/Cargo.toml" --release
}
function update-all() {
	sudo dnf upgrade --refresh
	if [ $? -eq 0 ]; then
		print_green "'dnf' was updated successfully!"
	fi

    mise upgrade
	if [ $? -eq 0 ]; then
		print_green "'mise' was updated successfully!"
	fi

    update-gfm
	if [ $? -eq 0 ]; then
		print_green "'git_fetch_mtime' was updated successfully!"
	fi

    update-ddf
	if [ $? -eq 0 ]; then
		print_green "'ddf' was updated successfully!"
	fi
}
