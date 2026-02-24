import json
import os
from dotenv import load_dotenv
from google.cloud import storage

load_dotenv()

bucket_name = os.getenv("GCP_BUCKET_NAME")
GCP_CLIENT = os.getenv("GCP_CLIENT")

class GCSUploader:
    def __init__(self):
        self.client = storage.Client.from_service_account_json(GCP_CLIENT)
        self.bucket = self.client.bucket(bucket_name)

    def upload_json(self, data, table_name):
        key = f"{table_name}.json"

        # Convert list of dicts to NDJSON (BigQuery compatible)
        ndjson_str = "\n".join(json.dumps(record) for record in data)

        blob = self.bucket.blob(key)

        blob.upload_from_string(
            ndjson_str,
            content_type="application/json"
        )

        print(f"Uploaded {table_name} to GCS: {key}")
