import { hash } from "bcrypt";

import dbRequest from '../database/dbRequest.js'

export default async function signUp (req, res) {

    const { name, email, password } = req.body;
    const pwdHash = await hash(password, 8);
    
    try {
        
        await dbRequest.createUser(name, email, pwdHash);

        res.sendStatus(201);

    } catch (error) {
        res.sendStatus(500);
    }
}
