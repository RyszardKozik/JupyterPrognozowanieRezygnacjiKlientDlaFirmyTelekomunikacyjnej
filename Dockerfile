# Use a lightweight Python image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /workspace

# Copy the requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire project files into the container
COPY . .

# Command to run the Python script directly
CMD ["python", "model_prediction.py"]
