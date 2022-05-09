
PHONY: upload_to_gcs
upload_to_gcs:
	gcloud alpha storage cp -r data/* gs://mzk-bucket/mc/data
	gcloud alpha storage cp -r mc-backups/* gs://mzk-bucket/mc/mc-backups

PHONY: rsync
rsync:
	rsync -av -e ssh ocloud-instance-1:~/Works/src/github.com/mzk622/minecraft-server/data/ ./data/
	rsync -av -e ssh ocloud-instance-1:~/Works/src/github.com/mzk622/minecraft-server/mc-backups/ ./mc-backups/
