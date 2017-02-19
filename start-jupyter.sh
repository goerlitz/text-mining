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
  # build docker image (piping Dockerfile to avoid creation of docker context)
  docker build -t jupyter/py-extras - < docker/jupyter_py-extras/Dockerfile
  docker run -d -p 8888:8888 --name jupyter-notebook --link mongo:mongo -v $(pwd):/home/jovyan/work jupyter/py-extras start-notebook.sh
  ;;
esac

