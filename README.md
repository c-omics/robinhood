# Robinhood Container Usage


*This one's for the sysadmins, not the reseachers..*




(Optional) Start a mariadb container for use with robinhood.

```
docker run --name mariadb-for-robinhood -v /tmp/robinhood-mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=robinhood -d mariadb:latest
```

(use a stronger password). Alternatively, point robinhood to an existing database on startup.


Start the robinhood container, pointing the container to a prepared database service:

```
docker run --name robinhood --link mariadb-for-robinhood:mysql -it -p 8080:80 -v /mnt/data:/work:ro -e MYSQL_DB=robinhoodDB -e MYSQL_HOST=mysql -e MYSQL_USER=root -e MYSQL_PWD=robinhood comics/robinhood:3.1
```

If you are not pointing robinhood to an existing database, the create one with the same name as that chosen for the ```MYSQL_DB``` env above:

```
mysql -e "create database $MYSQL_DB"
```

The mount-pont is the target filesystem, and must be a mount-point on the host. This container is expecting the filesystem to be mounted under ```/work```
within the container. In this example we mount the target filesystem as ```ro```.

Start a scan with:

```
robinhood --scan --run=all -d
```

The robinhood webgui is available on port 8080 from the host machine (```http://localhost:8080/robinhood/```).
