import { Router } from "express";
import { getUrl, handleUrl } from "../controllers/urlControllers.js";
import { validateToken } from "../middlewares/authMiddlewares.js";
import { validateUrl, verifyIfUrlExists } from "../middlewares/urlMiddlewares.js";

const urlRoutes = Router();

urlRoutes.post('/urls/shorten', validateToken, validateUrl, handleUrl);
urlRoutes.get('/urls/:id', verifyIfUrlExists, getUrl);

export default urlRoutes;