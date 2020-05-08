docker-build:
	@-docker rmi rust-base-server:latest
	docker build -t rust-base-server:latest ./

docker-export:
	@-rm ./build/rust-base-server.tar
	docker save rust-base-server:latest > ./build/rust-base-server.tar

docker-import:
	@-docker rmi rust-base-server:latest
	docker load < ./build/rust-base-server.tar

docker-test:
	docker run --rm \
		--network host \
		--name rust-base-server-test \
		-e SERVER_HOST_IP="127.0.0.1" \
		-e SERVER_HOST_PORT="28015" \
		-e SERVER_WORLD_SIZE="2000" \
		-e ADMIN_STEAMID="12345678909876543" \
		-e ADMIN_NAME="AdminNickName" \
		-v /etc/timezone:/etc/timezone:ro \
		-it rust-base-server:latest

docker-push:
	docker login
	docker tag rust-base-server zombaksteam/rust-base-server:latest
	docker push zombaksteam/rust-base-server:latest
	docker rmi zombaksteam/rust-base-server:latest
	docker rmi rust-base-server:latest
