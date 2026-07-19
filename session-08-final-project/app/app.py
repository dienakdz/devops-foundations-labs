from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def read_root():
    return {
        "message": "Final project API is running",
        "stack": ["Docker", "Compose", "Kubernetes", "Terraform", "Pipeline"],
    }

