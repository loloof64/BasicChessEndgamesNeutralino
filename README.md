# Basic chess endgames

Generate a chess endgame and play it against your computer.

## Development mode

### Setup

1. `yarn global add @neutralinojs/neu`
2. Setup the "backend" part: `neu update`
3. Move into the `frontend` folder: `cd frontend`
4. Setup the frontend part: `yarn && yarn run build`

### Run

1. Open a terminal in **frontend** folder :  execute `yarn serve`.
2. Open another terminal in the root folder of the project: execute `yarn serve:neu`.

### Build

1. Build in **frontend** folder : `yarn build`
2. Build in project root folder : `yarn build:neu`

The built binary will be in the **dist** folder.

### Build AppImage (For linux only)

1. Build application as in described in previous step
2. Run `yarn bundle:appimage`from the project root folder.

The built binary will be in the project root folder.

### Build AppImage with Docker (For linux only)

1. Install docker (you can use Personal version)
2. Run command `docker build -t appimage_building docker/linux/x86_64` (Or replace **appimage_building** with the tag of your choice) from the root of the project.
3. Create a folder built_appimage in the root of the project
4. Run command `docker run -v $PWD/built_appimage:/appimages --rm -ti appimage_building` (from the root of the project) but **don't close the resulting terminal until you've done all the steps**, as it the associated container will be removed on exit
5. From the new shell, run `cp BasicChessEndgames*.AppImage /appimages`
6. You can close the new shell now, exiting the new Docker container.
7. Finally, have fun with your AppImage !

## Credits

### Vectors

Some vectors have been downloaded from [SvgRepo](https://www.svgrepo.com)

* start.svg from [Start](https://www.svgrepo.com/svg/304738/start-line)
* reverse.svg from [Reverse](https://www.svgrepo.com/svg/215783/up-arrow-ui)