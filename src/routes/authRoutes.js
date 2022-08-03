import { Router } from "express";
import { signIn } from "../controllers/authControllers.js";
import { checkCredentials } from "../middlewares/authMiddlewares.js";

const authRoutes = Router();

authRoutes.post('/signin', checkCredentials, signIn);

export default authRoutes;
