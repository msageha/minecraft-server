
rcon-cli:
	docker exec -i $(docker ps | grep "itzg/minecraft-server" | awk '{print $1}') rcon-cli

