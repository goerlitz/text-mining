container="mongo"

running=$(docker inspect -f {{.State.Running}} $container)

case $running in
"true")
  echo "container '$container' is already running..."
  ;;
"false")
  echo "starting container '$container' ..."
  docker start $container
  ;;
*)
  echo "creating new container '$container' ..."
  docker run --name mongo -d -p 27017:27017 -v $(pwd)/data/mongo:/data/db mongo --storageEngine wiredTiger
  ;;
esac
