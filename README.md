docker-virtuoso
===============

A Dockerized Virtuoso.

```
$ docker build -t virtuoso:7.1.0 .
```

## Start a container

To persiste the data on the host's filesystem, create the folder (eg: `/virtuoso-data`), copy the `virtuoso.ini` in it and run the contaner:

```
 $ docker run -d -p 8890:8890 -p 1111:1111 --name virtuoso -v /virtuoso-data:/home/virtuoso/virtuoso/var/lib/virtuoso/db virtuoso:7.1.0
```

## Set a password:

```
$ isql -H <virtuoso-container-ip> exec='set password dba abetterpassword;'
```

# Enable SPARQL_UPDATE

```
$ isql -P abetterpassword -H <virtuoso-container-ip> exec='grant SPARQL_UPDATE to "SPARQL";'
```

