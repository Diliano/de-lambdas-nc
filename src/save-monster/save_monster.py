import requests
import boto3
import json
import logging

logger = logging.getLogger()
logger.setLevel(logging.INFO)

s3 = boto3.client("s3")
bucket = "dnd-bucket-terraform-nc-2024"


def lambda_handler(event, context):
    monster_name = event.get("monster_name")
    response = requests.get(f"https://www.dnd5eapi.co/api/monsters/{monster_name}")

    if response.status_code == 200:
        monster_data = response.text
        key = f"monsters/{monster_name}.json"
        s3.put_object(Bucket=bucket, Key=key, Body=monster_data)
        logger.info(f"Saved monster data for: {monster_name}")
        return {"status": "Success", "message": "Monster found and data saved"}
    else:
        logger.error(f"No monster found with the name: {monster_name}")
        return {"status": "Failure", "message": "Monster not found - no action taken"}
