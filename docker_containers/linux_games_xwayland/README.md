# linux games with Xwayland

a set of helper scripts that can run a container for running games locally, under linux, from within docker with Xwayland support.

to use:
1. make a local copy (preferably - per game) to a dedicated directory
2. copy game installer files to `installer/` dir
3. run `./games-xwayland`
4. install the game to your home directory (mapped to `data/` on the host OS)
5. edit `./play` script to run your game as the command
6. run `./play` to start the game in docker, under Xwayland

note that the container does not allow network access for increased privacy.
