from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def read_root():
    return {
        "message": "Hello from Docker, My name is Minh Dien and I am learning DevOps",
        "session": "02-containerization-basics",
    }

