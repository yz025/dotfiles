function update-gfm {
    $root = "$HOME\Documents\projects\git_fetch_mtime"

    git -C $root pull
    clang "$root/main.c" -o "$root/git_fetch_mtime.exe" -Wall -Wextra -Wpedantic -std=c99 -O2
    if ($?) { Write-Host "'git_fetch_mtime' was updated successfully!" -ForegroundColor Green }
}
function update-ddf {
    $root = "$HOME\Documents\projects\ddf"

    git -C $root pull
    cargo build --manifest-path "$root/Cargo.toml" --release
    if ($?) { Write-Host "'ddf' was updated successfully!" -ForegroundColor Green }
}
function update-all {
    update-gfm
    update-ddf

    Stop-Process -Name "syncthing" -Force -ErrorAction SilentlyContinue
    scoop update *
    Start-Process -FilePath "$HOME\scoop\shims\syncthing.exe" -ArgumentList "--no-browser", "--no-console" -WindowStyle Hidden
}
