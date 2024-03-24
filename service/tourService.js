const tourModel = require("../model/tour");
const userRoles = require("../utils/userRole").userRoles;

module.exports.createTour = async (user_id, listing_id, tourDate, tourTime, tourInstructions) => {
    try {
        let resp;
        resp = await tourModel.createTourForUsers(user_id, listing_id, tourDate, tourTime, tourInstructions);
        let data = resp[0];
        return data;
    } catch (e) {
        console.error("error in applyForTour", e);
    }
}


module.exports.getAllTours = async (user_id, role) => {
    try {
        let resp;
        if (role == userRoles.user) {
            resp = await tourModel.getAllTourForUsers(user_id, role);
        }
        else if (role == userRoles.broker) {
            resp = await tourModel.getAllTourForBrokers(user_id);
        }
        let tourData = resp[0];
        return tourData;
    } catch (e) {
        console.error("error in getAllTours", e);
    }
}


module.exports.getTourByID = async (userName, role, body) => {
    try {
        // prepare input params for procedure
        //validations if any
        //make call for getTourByID
        let resp;
        resp = await tourModel.getTourByIdForUsers();
        return resp;
    } catch (e) {
        console.error("error in getTourByID", e);
    }
}



module.exports.cancelTourByID = async (tourId) => {
    try {
        // prepare input params for procedure
        //validations if any
        //make call for cancelTourByID
        let resp;
        resp = await tourModel.deleteTourForUser(tourId);
        return resp;
    } catch (e) {
        console.error("error in cancelTourByID", e);
    }
}

module.exports.updateTourByID = async (tour_id, status) => {
    try {
        let resp;
        resp = await tourModel.updateTourForBroker(tour_id, status);
        return resp;
    } catch (e) {
        console.error("error in updateTourByID", e);
    }
}




