import dbRequest from "../database/dbRequest.js";

export async function checkUserExists (req, res, next) {

    const { id } = res.locals.user;
    
    try {
        
        const user = await dbRequest.findUser(id);
        if (!user) return res.sendStatus(404);

        next();

    } catch (error) {
        res.sendStatus(500);
    }
}
