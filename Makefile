
PHONY: rcon-cli
rcon-cli:
	docker exec -i $(docker ps | grep "itzg/minecraft-server" | awk '{print $1}') rcon-cli

PHONY: upload_to_gcs
upload_to_gcs:
	gcloud alpha storage cp -r data/* gs://mzk-bucket/mc/data
	gcloud alpha storage cp -r mc-backups/* gs://mzk-bucket/mc/mc-backups

PHONY: rsync
rsync:
	rsync -av -e ssh ocloud-instance-1:~/Works/src/github.com/mzk622/minecraft-server/data/ ./data/
	rsync -av -e ssh ocloud-instance-1:~/Works/src/github.com/mzk622/minecraft-server/mc-backups/ ./mc-backups/

PHONY: run
run:
	cp ./server.properties ./data/server.properties
	docker compose up -d
