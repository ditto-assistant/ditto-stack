# Ditto Stack
Spin up the full Ditto stack locally (Mac / Windows / Linux ) via Docker with GUI, Ditto Unit, NLP & Vision Server.

## Setup
1. Copy/Rename `.env.example` to `.env` and fill out the required API keys.
2. (optional) Edit Dockerfile to your liking (if you care to run [nlp_server](https://github.com/ditto-assistant/nlp_server) or [vision_server](https://github.com/ditto-assistant/vision_server) elewhere)
    - Simply uncomment / comment the services you want to run in your stack.
3. Install [OpenSCAD](https://openscad.org/) compiler for Prompt -> Instant 3D design feature!
4. Install [Python](https://www.python.org/) or [Anaconda Python](https://www.anaconda.com/) to your host machine for Prompt -> Instant Python Code Compilation + GUI

## Build (First time)
1. Run `./build.sh` or `./build.bat` or `just build` (if you use just)

## Run
1. Run `./run.sh` or `./run.bat` or `just run` (if you use just)

Enjoy! 
