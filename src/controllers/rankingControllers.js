import dbRequest from '../repository/dbRequests/dbRequest.js';

export async function getRanking (req, res) {

    try {
        
        const ranking = await dbRequest.getRanking();

        res.status(200).send(ranking);

    } catch (error) {
        res.sendStatus(500);
    }
}
