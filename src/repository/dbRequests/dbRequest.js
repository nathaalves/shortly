import authRequests from "./requests/authRequests.js";
import userRequests from "./requests/userRequests.js";
import urlRequests from "./requests/urlRequests.js";
import rankingRequests from "./requests/rankingRequests.js";

const dbRequest = {

    ...authRequests,
    ...userRequests,
    ...urlRequests,
    ...rankingRequests

};

export default dbRequest;
