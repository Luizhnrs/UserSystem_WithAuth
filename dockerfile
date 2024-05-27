
FROM node:14

WORKDIR /usr/src/app

COPY package*.json ./

# Instale as dependências do projeto
RUN npm install

# Copie o restante dos arquivos do projeto
COPY . .

# Compile o código TypeScript
RUN npm run build

# Exponha a porta em que a aplicação vai rodar
EXPOSE 3000

# Comando para iniciar a aplicação
CMD ["node", "dist/index.js"]