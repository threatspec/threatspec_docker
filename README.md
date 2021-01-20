# threatspec_docker 

This is the official docker container for [threatspec](https://github.com/threatspec/threatspec).


## Build

There are two ways to build this docker image:

1. From Source
2. From Pypi Images

### Building from Source 

```bash
docker build --build-arg PIP="false" --build-arg BRANCH="master" -t threatspec .
```

- `PIP="false"` will flag the Dockerfile to clone a repo. This value is `true` by default
- `BRANCH="master"` will fetch a specific branch after cloning the repo

### Building from Pypi 

```bash
docker build -t threatspec .
```

## Usage

The easiest way to use this Docker container is to treat it as another function. Add the following alias to you `.bashrc` (or `.zshrc`, or whatever else environment you are running)

### Linux/Mac (Bash/ZSH)

```bash
alias threatspec="docker run --rm -v $(pwd):/workingdir -w /workingdir threatspec/threatspec"
```

You can replace `threatspec/threatspec` with your own tag for local builds


### Windows (TBD)