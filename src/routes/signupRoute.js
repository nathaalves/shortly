import { Router } from 'express';
import signUp from '../controllers/signupController.js';
import validateInformations from '../middlewares/singupMiddleware.js';

const signupRoute = Router();

signupRoute.post('/signup', validateInformations, signUp);

export default signupRoute;