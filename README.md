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

