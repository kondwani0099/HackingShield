# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 8501 to the outside world (Streamlit's default port)
EXPOSE 8501

# Command to run your Streamlit app
CMD ["streamlit", "run", "app.py"]
