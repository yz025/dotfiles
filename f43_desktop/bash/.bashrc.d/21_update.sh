function print_green() {
	echo -e "\e[32m$1\e[0m"
}
function update-zls() {
	local root="$HOME/Tools/zls"

	git -C "$root" pull
	zig build --build-file "$root/build.zig" -Doptimize=ReleaseSafe

	if [ $? -eq 0 ]; then
		print_green "'zls' was updated successfully!"
	fi
}
function update-gfm() {
	local root="$HOME/Documents/projects/git_fetch_mtime"

	git -C "$root" pull
	clang "$root/main.c" -o "$root/git_fetch_mtime" -Wall -Wextra -Wpedantic -std=c99 -O2

	if [ $? -eq 0 ]; then
		print_green "'git_fetch_mtime' was updated successfully!"
	fi
}
function update-ddf() {
	local root="$HOME/Documents/projects/ddf"

	git -C "$root" pull
	cargo build --manifest-path "$root/Cargo.toml" --release

	if [ $? -eq 0 ]; then
		print_green "'ddf' was updated successfully!"
	fi
}
function update-all() {
	# update-zls # commented because it should be synced with zig.
	update-gfm
	update-ddf

	pkill -f "syncthing" 2>/dev/null

	sudo dnf upgrade --refresh

	syncthing --no-browser >/dev/null 2>&1 &
}
