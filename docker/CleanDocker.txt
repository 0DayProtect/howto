Clean Out Docker
----------------

docker system prune
docker system prune -a

docker images -a
docker images -f dangling=true

docker rmi $(docker images -a -q)

docker volume ls -f dangling=true
docker volume prune
