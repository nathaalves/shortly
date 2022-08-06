import { Router } from "express";
import { getUserInformations } from "../controllers/userControllers.js";
import { validateToken } from "../middlewares/authMiddlewares.js";
import { checkUserExists } from "../middlewares/userMiddlewares.js";

const userRoutes = Router();

userRoutes.get('/users/me', 
    validateToken, 
    checkUserExists, 
    getUserInformations
);

export default userRoutes;
