import { Router } from 'express';
import signUp from '../controllers/signupController.js';

const signupRoute = Router();

signupRoute.post('/signup', signUp);

export default signupRoute;