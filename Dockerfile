# Use the official Python image
FROM python:3.13

# Set environment variables
ENV PYTHONUNBUFFERED=1

# Set the working directory inside the container
WORKDIR /app

# Copy the project files into the container
COPY . /app/

# Install dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Expose port 8000 for Django
EXPOSE 8000

# Start Django application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
