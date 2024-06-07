# Usa una imagen de Node.js como base
FROM node:18-buster

# Actualiza el sistema e instala dependencias necesarias para sharp
RUN apt-get update && apt-get install -y \
  python3 \
  make \
  g++ \
  libvips-dev \
  --no-install-recommends && \
  rm -rf /var/lib/apt/lists/*

# Establece el directorio de trabajo en el contenedor
WORKDIR /app

# Copia el archivo package.json y el yarn.lock
COPY package.json yarn.lock ./

# Configura yarn para no ignorar scripts
RUN yarn config set ignore-scripts false

# Instala las dependencias del proyecto con opciones para forzar la instalación y verificar archivos
RUN yarn install --force --check-files

# Copia el resto del código de la aplicación al contenedor
COPY . .

# Compila la aplicación
RUN yarn build

# Expone el puerto en el que la aplicación se ejecutará
EXPOSE 1337

# Define el comando por defecto para ejecutar la aplicación
CMD ["yarn", "start"]