# Use uma imagem base oficial do Node.js
FROM node:20

# Defina o diretório de trabalho dentro do contêiner
WORKDIR /usr/src/app

# Copie os arquivos de configuração do Yarn
COPY package.json yarn.lock ./

# Instale as dependências do projeto
RUN yarn install

# Copie o restante dos arquivos do projeto
COPY . .

# Compile o código TypeScript
RUN yarn run build

# Exponha a porta em que a aplicação vai rodar
EXPOSE 3000

# Comando para iniciar a aplicação
CMD ["node", "dist/index.js"]