# Basic chess endgames

Generate a chess endgame and play it against your computer.

## Development mode

### Setup

1. `yarn global add @neutralinojs/neu`
2. Setup the "backend" part: `neu update`
3. Move into the `frontend` folder: `cd frontend`
4. Setup the frontend part: `yarn && yarn run build`

### Run

1. Create a file **auth_info.json** in a folder **.tmp** at the root of the project with content ̀`{}`. Or "clear it" if it already exists. This file must be empty json before trying to run.
2. Open a terminal in **frontend** folder :  execute `yarn serve`.
3. Open another terminal in the root folder of the project: execute `yarn serve:neu`.

## Credits

### Vectors

Some vectors have been downloaded from [SvgRepo](https://www.svgrepo.com)

* start.svg from [Start](https://www.svgrepo.com/svg/304738/start-line)
* reverse.svg from [Reverse](https://www.svgrepo.com/svg/215783/up-arrow-ui)