import { Router } from "express";
import { getRanking } from "../controllers/rankingControllers.js";

const rankingRoutes = Router();

rankingRoutes.get('/ranking', getRanking);

export default rankingRoutes;