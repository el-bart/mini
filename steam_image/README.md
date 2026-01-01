# steam image

runs `steam` engine from inside the container.
trust no1.
only data directory (downloads, `steam`'s config, etc.) are attached as a volume.

in order to have X11 and GPU acceleration, `dri` and `shm` are mounted from host, too.

note that the same `UID` and `GID` is used.
while i'm not a huge fan of that, it's needed to make `pulseaudio` / `pipewire` work as expected + enabled seamless X11 experience.


## Wayland vs. X11

this scripts support both running under Wayland as well as X11.
however in practice most games does not seem to work under Wayland.
most noticeably - mouse pointer does not work correctly in most cases.
since Xwayland does not really improve situation by a lot, it's left as-is.

for now it's recommended to just use X11 session for running games.
