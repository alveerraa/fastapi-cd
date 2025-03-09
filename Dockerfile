# Use Python slim image as base
FROM python:3.10-slim

# Set the working directory
WORKDIR /app

# Install virtualenv and create a virtual environment
RUN apt-get update && apt-get install -y python3-venv && \
    python3 -m venv /opt/venv

# Set environment variable for virtualenv
ENV PATH="/opt/venv/bin:$PATH"

# Copy application files
COPY main.py requirements.txt ./

# Install dependencies inside the virtual environment
RUN pip install --no-cache-dir -r requirements.txt

# Expose FastAPI port
EXPOSE 8000

# Command to run FastAPI server
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

