# Varnish docker container image

[![Docker Pulls](https://img.shields.io/docker/pulls/skilldlabs/varnish.svg)](https://hub.docker.com/r/skilldlabs/varnish)
[![Docker Stars](https://img.shields.io/docker/stars/skilldlabs/varnish.svg)](https://hub.docker.com/r/skilldlabs/varnish)

## Supported tags and respective `Dockerfile` links

- [`4.1` (*4.1/Dockerfile*)](https://github.com/skilld-labs/skilld-varnish/tree/master/4.1/Dockerfile)
- [`5.1` (*5.1/Dockerfile*)](https://github.com/skilld-labs/skilld-varnish/tree/master/5.1/Dockerfile)

## Environment variables available for customization

| Environment Variable | Default Value | Description |
| -------------------- | ------------- | ----------- |
| VARNISH_BACKEND_HOST                  | nginx | Mandatory |
| VARNISH_BACKEND_PORT                  | 80 | |
| VARNISH_MEMORY_SIZE                   | 100m | |
| VARNISH_BACKEND_FIRST_BYTE_TIMEOUT    | 300s | |
| VARNISH_BACKEND_CONNECT_TIMEOUT       | 5s | |
| VARNISH_BACKEND_BETWEEN_BYTES_TIMEOUT | 2s | |
| VARNISH_ERRORS_TTL                    | 10m | |
| VARNISH_GRACE                         | 6h | |
| VARNISH_SUBNET                        | 172.16.0.0/12 | |
| VARNISH_SECRET_FILE                   | none | |

## Defaults

- Default vcl is `/etc/varnish/default.vcl`
- Secret is `none`, mount you secret to container and point `VARNISH_SECRET_FILE` to it

## Examples

`docker run -v $(pwd)/varnish.secret:/secret -e VARNISH_SECRET_FILE=/secret skilldlabs/varnish:5.1`
