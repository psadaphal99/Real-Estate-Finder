const listingsModel = require("../model/listings");
const userRoles = require("../utils/userRole").userRoles;

module.exports.getAllAreas = async () => {
    try {
        let resp;
        resp = await listingsModel.getAllAreas();
        let data = [...new Set(resp[0].map(obj => obj.city))];
        return data;
    } catch (e) {
        console.error("error in getAllAreas", e);
    }
}

module.exports.getAllListings = async (user_id, role, type, area) => {
    try {
        let resp;
        if (role == userRoles.user) {
            resp = await listingsModel.getAllListingsForUser(user_id, type, area);
        }
        else if (role == userRoles.broker) {
            resp = await listingsModel.getAllListingsForBroker(user_id);
        }
        let data = resp[0];
        return data;
    } catch (e) {
        console.error("error in getAllListings", e);
    }
}


module.exports.getListingById = async (userName, role, body) => {
    try {
        // prepare input params for procedure
        //validations if any
        //make call to getListing by ID
        let resp;
        if (userRoles.user) {
            resp = await listingsModel.getListingByIDForUser();
        }
        else if (userRoles.broker) {
            resp = await listingsModel.getListingByIDForUser();
        }
        else {
            resp = await listingsModel.getListingByIDForUser();
        }
        return resp;
    } catch (e) {
        console.error("error in getListingById", e);
    }
}

module.exports.createListing = async (broker_id, listing_type, price, isactive, summary, property_id, media_url, features, policy) => {
    try {
        let resp;
        resp = await listingsModel.createListingForBroker(broker_id, listing_type, price, isactive, summary, property_id, media_url, features, policy);
        return resp;
    } catch (e) {
        console.error("error in getListingById", e);
    }
}


module.exports.updateListing = async (listing_type, price, summary, isactive, listing_id) => {
    try {
        let resp;
        resp = await listingsModel.updateListingForBroker(listing_type, price, summary, isactive, listing_id);
        return resp;
    } catch (e) {
        console.error("error in getListingById", e);
    }
}

module.exports.deleteListing = async (listing_id) => {
    try {
        let resp;
        resp = await listingsModel.deleteListingForBroker(listing_id);
        return resp;
    } catch (e) {
        console.error("error in getListingById", e);
    }
}


module.exports.getAllListingByProperty = async (user_id, property_id) => {
    try {
        let resp;
        resp = await listingsModel.getAllListingsByPropertyForOwner(user_id, property_id);
        return resp[0];
    } catch (e) {
        console.error("error in getListingById", e);
    }
}
