import { Router } from "express";
import { deleteUrl, getUrl, handleUrl, openUrl } from "../controllers/urlControllers.js";
import { validateToken } from "../middlewares/authMiddlewares.js";
import { checkUrlBelongsUser, validateUrl, verifyIfUrlExists } from "../middlewares/urlMiddlewares.js";

const urlRoutes = Router();

urlRoutes.post('/urls/shorten', validateToken, validateUrl, handleUrl);
urlRoutes.get('/urls/:id', verifyIfUrlExists, getUrl);
urlRoutes.get('/urls/open/:shortUrl', verifyIfUrlExists, openUrl);
urlRoutes.delete('/urls/:id', validateToken, verifyIfUrlExists, checkUrlBelongsUser, deleteUrl);

export default urlRoutes;
