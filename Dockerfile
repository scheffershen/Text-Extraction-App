# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
#COPY . .

# Install the system dependencies for Tesseract and other utilities
RUN apt-get update && \
    apt-get install -y tesseract-ocr antiword poppler-utils && \
    rm -rf /var/lib/apt/lists/*

# Install any needed Python packages specified in requirements.txt
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

# If there isn't a requirements.txt, uncomment the below lines to install dependencies directly
# RUN pip install --no-cache-dir python-docx PyPDF2 openpyxl extract-msg Pillow pytesseract xlrd

# Make port 8000 available to the world outside this container (optional, if you're exposing an API)
# EXPOSE 8000

# Define environment variable
ENV PYTHONUNBUFFERED=1

# Run the application
CMD ["python", "app.py"]
