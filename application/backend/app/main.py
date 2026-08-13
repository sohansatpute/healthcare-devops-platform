from fastapi import FastAPI


app = FastAPI(
    title="MediCare Healthcare API",
    description="Backend API for the MediCare Healthcare Platform",
    version="1.0.0",
)


@app.get("/health")
def health_check():
    return {
        "status": "healthy",
        "service": "medicare-backend",
    }