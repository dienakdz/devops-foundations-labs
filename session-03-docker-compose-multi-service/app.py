import os

import redis
from fastapi import FastAPI

app = FastAPI()

redis_client = redis.Redis(
    host=os.getenv("REDIS_HOST", "redis"),
    port=int(os.getenv("REDIS_PORT", "6379")),
    decode_responses=True,
)


@app.get("/")
def read_root():
    count = redis_client.incr("visit_count")
    return {
        "message": "Hello from Docker Compose",
        "visit_count": count,
    }

