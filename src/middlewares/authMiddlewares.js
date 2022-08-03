import dbRequest from '../database/dbRequest.js';
import pkg from 'jsonwebtoken';
import { compare } from "bcrypt";
import joi from "joi";

export async function checkCredentials (req, res, next) {

    const signinSchema = joi.object({
        email: joi.string().email().required(),
        password: joi.string().required()
    });

    const { error } = signinSchema.validate(req.body);
    if (error) return res.status(422).send(error.details.map( err => err.message))
    
    const { email, password } = req.body;
    
    try {
        
        const registeredUser = await dbRequest.findUserByEmail(email);
        if (!registeredUser) return res.sendStatus(401);
        
        const passwordMatch = await compare(password, registeredUser.password);
        if (!passwordMatch) return res.sendStatus(401);
        
        const { id, name } = registeredUser;
        res.locals.user = { id, name };
        
        next();

    } catch (error) {
        res.sendStatus(500);
    }
}

export async function validateToken (req, res, next) {

    const { authorization } = req.headers;
    if (!authorization) return res.sendStatus(401);

    const [,token] = authorization.split(' ');
    if(!token) return res.sendStatus(401);

    const { verify } = pkg;

    try {

        const user = verify(token, process.env.JWT_SECRET);
        res.locals.user = user;
        res.locals.token = token;
    
        next();

    } catch (error) {
        res.sendStatus(401);
    }    
}
