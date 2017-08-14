#!/bin/bash

set -eu

CONTAINER_NAME=sample-rails
SRC_PATH=$1
DEST_PATH=/home/rails/app

# remove old container if exists.
CID=$(docker ps -f name="${CONTAINER_NAME}" -q)
if [ -n "${CID}" ]; then
  docker kill "${CONTAINER_NAME}" > /dev/null
  echo "The existing container ${CONTAINER_NAME}(cid:${CID}) is killed."
fi
CID=$(docker ps -f name="${CONTAINER_NAME}" -f status=exited -q)
if [ -n "${CID}" ]; then
  docker rm "${CONTAINER_NAME}" > /dev/null
  echo "The existing container ${CONTAINER_NAME}(cid:${CID}) is removed."
fi


# create a container.
docker run --rm -d --privileged --name ${CONTAINER_NAME} -p 3000:3000 sample/rails
docker cp "${SRC_PATH}" "${CONTAINER_NAME}":"${DEST_PATH}"
docker exec -it sample-rails /bin/bash -c "chown -R rails:rails ${DEST_PATH}"

# exec rails server on the container.
docker exec -u rails -it sample-rails /bin/bash -c "source ~/.bash_profile; cd ~/app/*/; bundle install; bundle exec rails s"
docker kill "${CONTAINER_NAME}"
