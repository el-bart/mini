# steam image

runs `steam` engine from inside the container.
trust no1.
only data directory (downloads, `steam`'s config, etc.) are attached as a volume.

in order to have X11 and GPU acceleration, `dri` and `shm` are mounted from host, too.

note that the same `UID` and `GID` is used. while i'm not a huge fan of that,
it's needed to make pulseaudio work as expected + enabled seamless X11 experience.
