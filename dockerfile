FROM node:18-alpine

WORKDIR /app

# Instalar pnpm
RUN npm install -g pnpm@9.4.0

# Copiar archivos del proyecto
COPY . .

# Instalar dependencias
RUN pnpm install

# Construir la aplicación
RUN pnpm build

# Exponer el puerto (ajusta según sea necesario)
EXPOSE 3000

# Comando para iniciar la aplicación
CMD ["pnpm", "start"]
