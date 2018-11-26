# docker-bolt

> Run Bolt CMS as a docker container

## Usage

```bash
# build docker images
docker-compose build

# start containers
docker-compose up -d

# stop containers
docker-compose stop

# destroy containers
docker-compose rm -fs
```

## Development

The Bolt configuration files and themes are mounted as shared volumes and can be modified to fit your needs. You can find the default settings in the `bolt` folder.
