# microsoft-sql-db-docker\

Do following command after pull the repo:
- docker compose up --build

2. Find the project user-management: https://hub.docker.com/repository/docker/bongu1302/user-management/general and run the command
- docker pull bongu1302/user-management:latest
- docker run --rm -d --network dentist-db_default --name user-management-app -p 7214:80 user-management
- 
3.After that, go find dentist-booking on docker-hub and do after the instruction of this: https://hub.docker.com/repository/docker/bongu1302/dentist-booking/general
- docker pull bongu1302/dentist-booking:latest
- docker run --rm -d --network dentist-db_default --name dentist-booking-app -p 5001:80 --add-host user-management:172.18.0.3 dentist-booking

Notes that the 172.18.0.3 Ip can changes depend on you local machine, so you need to replace the IP in this line of command. Here is the tips to get IP:
- docker image ls -> get list images -> get id of image that you want to retrieve the IP
- docker inspect <image-id> (replace the upper id to <image-id>) -> and looking the Json for IP



   
