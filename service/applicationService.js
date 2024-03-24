const applicationModel = require("../model/application");
const { userRoles } = require("../utils/userRole");


module.exports.createApplication = async (user_id, listing_id, documenturl) => {
    try {
        // prepare input params for procedure
        //validations if any
        //make call for applyListings
        let resp;
        resp = await applicationModel.createApplicationForUsers(user_id, listing_id, documenturl);
    } catch (e) {
        console.error("error in applyListing", e);
    }
}


module.exports.getAllApplications = async (user_id, role) => {
    try {
        // prepare input params for procedure
        //validations if any
        //make call for getAllApplications
        let resp;
        if (role == userRoles.user) {
            resp = await applicationModel.getAllApplicationForUsers(user_id);
        }
        else if (role == userRoles.broker) {
            resp = await applicationModel.getAllApplicationForBrokers(user_id);
        }
        let data = resp[0];
        return data;
    } catch (e) {
        console.error("error in getAllApplications", e);
    }
}

module.exports.getApplicationByID = async (userName, role, body) => {
    try {
        // prepare input params for procedure
        //validations if any
        //make call for getApplicationByID
        let resp;
        resp = await applicationModel.getApplicationByIdForUser();
    } catch (e) {
        console.error("error in getApplicationByID", e);
    }
}


module.exports.cancelApplicationByID = async (application_id) => {
    try {
        let resp;
        resp = await applicationModel.deleteApplicationForUsers(application_id);
        return resp;
    } catch (e) {
        console.error("error in cancelApplicationByID", e);
    }
}


module.exports.updateApplicationByID = async (application_id, status) => {
    try {
        let resp;
        resp = await applicationModel.updateApplicationForBrokers(application_id, status);
        return resp;
    } catch (e) {
        console.error("error in updateApplicationByID", e);
    }
}
