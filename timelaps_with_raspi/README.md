# timelaps with RasPi

a bunch of scripts hacked up in one evening to do timelaps of slow processes like plants growing, ice-melting, etc...
RasPi with a USB camera attached is used as a hardware platform here. pictures are taken every minute.
this whole thing is a done "on a knee", thus no installer or other automation.

`backup` dir has a script that can be put on a host that can do periodic backups of RasPi stored files.
this is in case RasPi or its SD card dies unexpectedly.
you can run it say hourly on a server, to have mostly up to date content.
it can also be used as a large-scale storage, so that you can remove old pictures if low on space on SD card.

`capture_host` dir has scripts for taking photos + helper pseudo-shell for `cron`, that will not `mail`
you reports of non-failed captures.

`postprocessing` contains two scripts.
`flatten_images_structure` puts all images into a single directory, with a proper file naming (date+time).
`make_video` creates an actual timelaps out of the images.
it takes a parameter defining every Nth frame to be taken (eg. `N=30` means every 30th frame will be used).
