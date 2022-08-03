import { hash } from "bcrypt";
import dayjs from "dayjs";

import dbRequest from '../database/dbRequest.js'

export default async function signUp (req, res) {

    const { name, email, password } = req.body;
    const pwdHash = await hash(password, 8);
    const createdAt = dayjs().format('YYYY-MM-DD');
    
    try {
        
        await dbRequest.insertUser(name, email, pwdHash, createdAt);

        res.sendStatus(201);

    } catch (error) {
        res.sendStatus(500);
    }
}
