import connection from "../database/postgres.js";
import { hash } from "bcrypt";
import dayjs from "dayjs";

export default async function signUp (req, res) {

    const { name, email, password } = req.body;
    const pwdHash = await hash(password, 8);
    const createdAt = dayjs().format('YYYY-MM-DD');
    
    try {
        
        await connection.query(`
            INSERT INTO users (id, name, email, password, "createdAt") 
            VALUES (default, $1, $2, $3, $4)`,
            [name, email, pwdHash, createdAt]
        );

        res.sendStatus(201);

    } catch (error) {
        res.sendStatus(500);
    }
}