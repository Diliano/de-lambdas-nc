import random
import logging

def lambda_handler(event, context):
    logger = logging.getLogger()
    logger.setLevel(logging.INFO)

    dice_type = event.get("dice_type")
    dice_count = event.get("dice_count")

    num_sides = int(dice_type[1:])
    
    rolls = [random.randint(1, num_sides) for _ in range(dice_count)]
    
    logger.info(f"Generated roll(s): {rolls}")
    
    return {
        "dice_count": rolls
    }
