running=$(docker inspect -f {{.State.Running}} jupyter-notebook)

case $running in
"true")
  echo "container is already running..."
  ;;
"false")
  echo "starting container..."
  docker start jupyter-notebook
  ;;
*)
  echo "running new container..."
  docker run -d -p 8888:8888 --name jupyter-notebook -v $(pwd):/home/jovyan/work jupyter/all-spark-notebook start-notebook.sh
  ;;
esac
