const propertyModel = require("../model/property");
const { userRoles } = require("../utils/userRole");

module.exports.getAllProperties = async (user_id, role) => {
    try {
        let resp;
        if (role == userRoles.broker) {
            resp = await propertyModel.getAssignedPropertyForBroker(user_id);
        }
        else if (role == userRoles.owner) {
            resp = await propertyModel.getAllPropertyForOwner(user_id);
        }
        let data = resp[0];
        return data;
    } catch (e) {
        console.error("error in getAllProperties", e);
    }
}


module.exports.getPropertyById = async (userName, role, body) => {
    try {
        // prepare input params for procedure
        //validations if any
        //make call for getPropertyById
        let resp;
        if (userRoles.broker) {
            resp = await propertyModel.getPropertyByIdForBroker();
        }
        else if (userRoles.owner) {
            resp = await propertyModel.getPropertyByIdForOwner();
        }
    } catch (e) {
        console.error("error in getPropertyById", e);
    }
}

module.exports.createProperty = async (num_beds, num_baths, area, property_type, latitude, longitude, street_number, street_name, city, zip, state, user_id) => {
    try {
        let resp;
        resp = await propertyModel.createPropertyForOwner(num_beds, num_baths, area, property_type, latitude, longitude, street_number, street_name, city, zip, state, user_id);
    } catch (e) {
        console.error("error in getPropertyById", e);
        throw (e);
    }
}


module.exports.updateProperty = async (property_id, num_beds, num_baths, area, property_type) => {
    try {
        let resp;
        resp = await propertyModel.updatePropertyForOwner(property_id, num_beds, num_baths, area, property_type);
    } catch (e) {
        console.error("error in getPropertyById", e);
    }
}

module.exports.deleteProperty = async (user_id, property_id) => {
    try {
        let resp;
        resp = await propertyModel.deletePropertyForOwner(user_id, property_id);
        return resp;
    } catch (e) {
        console.error("error in getPropertyById", e);
    }
}
