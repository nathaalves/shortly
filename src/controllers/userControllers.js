import dbRequest from "../repository/dbRequests/dbRequest.js";

export async function getUserInformations (req, res) {

    const { id } = res.locals.user;

    try {
        
        const userInformations = await dbRequest.userInformations(id);

        res.status(200).send(userInformations);

    } catch (error) {
        res.sendStatus(500);
    }
}
