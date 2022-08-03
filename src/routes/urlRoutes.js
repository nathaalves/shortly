import { Router } from "express";
import { getUrl, handleUrl, openUrl } from "../controllers/urlControllers.js";
import { validateToken } from "../middlewares/authMiddlewares.js";
import { validateUrl, verifyIfUrlExists } from "../middlewares/urlMiddlewares.js";

const urlRoutes = Router();

urlRoutes.post('/urls/shorten', validateToken, validateUrl, handleUrl);
urlRoutes.get('/urls/:id', verifyIfUrlExists, getUrl);
urlRoutes.get('/urls/open/:shortUrl', verifyIfUrlExists, openUrl);

export default urlRoutes;