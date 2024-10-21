import random
import logging
import boto3
import json
from datetime import datetime

logger = logging.getLogger()
logger.setLevel(logging.INFO)

s3 = boto3.client("s3")
bucket = "dice-rolls-bucket-nc-2024"

def lambda_handler(event, context):
    dice_type = event.get("dice_type")
    dice_count = event.get("dice_count")

    num_sides = int(dice_type[1:])
    
    rolls = [random.randint(1, num_sides) for _ in range(dice_count)]
    
    timestamp = datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
    key = f"results/{timestamp}.json"
    s3.put_object(Bucket=bucket, Key=key, Body=json.dumps({
        "roll(s)": rolls,
        "timestamp": timestamp
    }))
    
    logger.info(f"Generated roll(s): {rolls}")
    
    return {
        "dice_count": rolls
    }
