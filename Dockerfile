# Use official Python image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy requirements
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy app code
COPY . .

# Expose port 80 (for Azure Container Instance)
EXPOSE 80

# Run FastAPI app with uvicorn on port 80
# Replace 'main:app' with your filename:function (e.g., if your app is in app.py use 'app:app')
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
