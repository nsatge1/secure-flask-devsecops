FROM python:3.14-slim

# No .pyc files, and logs are printed straight away
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy only the application, not the whole repository
COPY app.py .

# Run as a normal user, not root
RUN useradd --create-home --uid 10001 appuser
USER appuser

EXPOSE 5000
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
