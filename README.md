# Robinhood Container Usage


*This one's for the sysadmins, not the reseachers..*




(Optional) Start a mariadb container for use with robinhood.

```
docker run --name mariadb-for-robinhood -v /tmp/robinhood-mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=robinhood -d mariadb:latest
```

(use a stronger password). Alternatively, point robinhood to an existing database on startup.


Start the robinhood container, pointing the container to a prepared database service:

```
docker run --name robinhood --link mariadb-for-robinhood:mysql -it -p 8080:80 -v /mnt/data:/work -e MYSQL_DB=robinhoodDB -e MYSQL_HOST=mysql -e MYSQL_USER=root -e MYSQL_PWD=robinhood comics/robinhood:3.1
```

If you are not pointing robinhood to an existing database, the create one named