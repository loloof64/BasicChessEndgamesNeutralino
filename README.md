# Basic chess endgames

Generate a chess endgame and play it against your computer.

## Development mode

### Setup

1. Install neutralino globally: `npm i -g @neutralinojs/neu`
2. Setup the "backend" part: `neu update`
3. Move into the `frontend` folder: `cd frontend`
4. Setup the frontend part: `npm i && npm run build`

### Run

1. Open a terminal in **frontend** folder :  execute `npm run serve`.
2. Open another terminal in the root folder of the project: execute `npm run serve:neu`.

### Build

1. Build in **frontend** folder : `npm run build`
2. Build in project root folder : `npm run build:neu`

The built binary will be in the **dist** folder.


### Build AppImage with Docker (For linux x86_64 only) (Keep at least 2Go on your HDD for the Docker image)

1. Install docker (you can use Personal version)
2. Create a folder output_dir at the root of the project
3. Run command `docker run --mount type=bind,src="$(pwd)/output_dir",target=/output_dir build_appimage/linux/x86_64`.
4. Finally, have fun with your AppImage in the `output_dir` directory !

## Credits

### Vectors

Some vectors have been downloaded from [SvgRepo](https://www.svgrepo.com)

* start.svg from [Start](https://www.svgrepo.com/svg/304738/start-line)
* reverse.svg from [Reverse](https://www.svgrepo.com/svg/215783/up-arrow-ui)