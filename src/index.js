import express from 'express';
import dotenv from 'dotenv';
import cors from 'cors';
import signupRoute from './routes/signupRoute.js';
import authRoutes from './routes/authRoutes.js';

dotenv.config();

const app = express();

app.use(cors());
app.use(express.json());

app.use(signupRoute);
app.use(authRoutes);

const PORT = process.env.PORT;
app.listen(PORT, () => console.log(`The server is running on port ${PORT}`));