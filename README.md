# rust-base-server

Rust Experimental Server Base

Docker image: [https://hub.docker.com/repository/docker/zombaksteam/rust-base-server](https://hub.docker.com/repository/docker/zombaksteam/rust-base-server)

## How to test image

```bash
docker run --rm \
 --network host \
 --name rust-base-server-test \
 -e SERVER_HOST_IP="127.0.0.1" \
 -e SERVER_HOST_PORT="28015" \
 -e SERVER_WORLD_SIZE="2000" \
 -v /etc/timezone:/etc/timezone:ro \
 -it rust-base-server:latest
```

## How to run server

```bash
docker run -d \
 --network host \
 --restart=always \
 --name rust-base-server \
 -e SERVER_HOSTNAME="Rust" \
 -e SERVER_HOST_IP="127.0.0.1" \
 -e SERVER_HOST_PORT="28015" \
 -e SERVER_RCON_IP="127.0.0.1" \
 -e SERVER_RCON_PORT="29015" \
 -e SERVER_RCON_PASS="SECRET" \
 -e SERVER_WORLD_SIZE="4000" \
 -e SERVER_SEED="123456789" \
 -v /etc/timezone:/etc/timezone:ro \
 -it rust-base-server:latest
```

## ENV config variables

```bash
SERVER_HOSTNAME   # Server name
SERVER_HOST_IP    # Public server ip
SERVER_HOST_PORT  # Public server port
SERVER_RCON_IP    # Public rcon ip
SERVER_RCON_PORT  # Public rcon port
SERVER_RCON_PASS  # Rcon password
SERVER_WORLD_SIZE # Server world size
SERVER_SEED       # Server seed number
SERVER_LEVEL      # Empty or "Barren"
SERVER_LEVEL_URL  # Custom map from URL
```
