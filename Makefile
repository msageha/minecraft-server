
PHONY: upload_to_gcs
upload_to_gcs:
	gcloud alpha storage cp -r data/* gs://mzk-bucket/mc/data
	gcloud alpha storage cp -r mc-backups/* gs://mzk-bucket/mc/mc-backups
