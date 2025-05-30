# Monte Carlo Pi Estimator
- A CLI pi estimator in Mojo

## Prequisites
  - `pixi` for package management
  - `Docker` for portability


## Running
- all commands run inside the directory `pi-estimator`

### Starting
#### Docker
  This project uses Docker for portability between operating systems.

 First, check that Docker (specifically Docker Desktop) is running. When building the image for the first time or fresh start, run `docker compose build`.
#### Alpine
Once the container is running, get into the shell with `docker compose run --rm app`
Now your terminal is running in the alpine environment.
### Stopping
#### Alpine
run `exit`
#### Docker
- run `docker compose down`

### Starting and Stopping the Virtual Environment
- start docker using `docker compose up` the `--detach` flag will allow it to run in the background
- run `docker compose exec app /bin/sh` to start the alpine environment, then run
- `pixi shell` to start
- `conda deactivate` to stop pixi
- `exit` to close the terminal session
- `docker compose down` to kill the docker enviornment
### Building and Executing the Project
  - `mojo build estimate-.pi.mojo` to build
  - `./estimate-pi` to execute
  - `mojo estimate-pi.mojo` to do both at the same time 
