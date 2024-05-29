import express from 'express';
import http from 'http';
import bodyParser from 'body-parser';
import cookieParser from 'cookie-parser';
import compression from 'compression';
import cors from 'cors';
import mongoose from 'mongoose';
import router from 'router';

const app = express();

app.use (cors({
  credentials:true
}));

app.use(compression());
app.use(cookieParser());
app.use(bodyParser.json());

const server = http.createServer();

server.listen(3030, () => {
  console.log("Server now is running on http://localhost:3030/")
});

const MONGO_URL = 'mongodb+srv://Luiz:11072001@users.ulbesqb.mongodb.net/?retryWrites=true&w=majority&appName=users';

mongoose.Promise = Promise;
mongoose.connect(MONGO_URL);
mongoose.connection.on('error', (error:Error) => console.log(error));

app.use('/', router());