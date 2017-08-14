# rails_on_docker

## Usage

### Build Container

```console
$ git clone git@github.com:ressy-private/rails_on_docker.git
$ cd rails_on_docker
$ docker build -t sample/rails .
```

### Start rails server

```console
$ sh bin/start_container.sh /path/to/rails_project
```


### How to connect the rails server from the local machine

```console
$ http://localhost:3000
```

