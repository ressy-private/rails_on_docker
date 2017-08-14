# rails_on_docker

## Usage

### Build Container

```console
$ git clone git@github.com:ressy-private/rails_on_docker.git
$ cd rails_on_docker
$ docker build -t sample/rails:0.0 .
$ docker run -d --privileged --name sample-rails -p 3000:3000 -v /path/to/src/:/home/rails/app/ sample/rails:0.0
```

### Start rails server

```console
$ docker exec -it sample-rails /bin/bash
$ su - rails
$ cd /home/rails/app
$ bundle install --path=vendor/bundle
$ bundle exec rails s
```


### How to connect the rails server from the local machine

``console
$ http://localhost:3000
``
`
