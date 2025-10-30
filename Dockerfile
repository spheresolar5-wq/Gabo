# Imagen base de Python
FROM python:3.12-slim

# Carpeta de la app
WORKDIR /app

# Copiamos dependencias
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiamos todo el código
COPY . .

# Puerto
ENV PORT 8050
EXPOSE 8050

# Comando de arranque
CMD ["gunicorn", "app:app.server", "--bind", "0.0.0.0:8050", "--workers", "1"]

