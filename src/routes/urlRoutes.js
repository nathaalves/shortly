import { Router } from "express";
import { handleUrl } from "../controllers/urlControllers.js";
import { validateToken } from "../middlewares/authMiddlewares.js";
import { validateUrl } from "../middlewares/urlMiddlewares.js";

const urlRoutes = Router();

urlRoutes.post('/urls/shorten', validateToken, validateUrl, handleUrl)

export default urlRoutes;