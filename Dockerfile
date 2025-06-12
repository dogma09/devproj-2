FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .      # Copy requirements first to leverage Docker cache
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .                # Copy your app after installing dependencies

EXPOSE 5000

CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "app:app"]
