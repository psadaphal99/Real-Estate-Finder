const userModel = require("../model/user");
const userRoles = require("../utils/userRole").userRoles;

module.exports.login = async (userName, password) => {
    try {
        let resp;
        resp = await userModel.login(userName, password);
        let user_id = resp[0][0].o_user_id;
        return user_id;
    } catch (e) {
        console.error("error in login", e);
    }
}


module.exports.getRole = async (user_id) => {
    try {
        // prepare input params for procedure
        //validations if any
        //make call for applyForTour
        let resp;
        resp = await userModel.getRole(user_id);
        let role = resp[0][0].role_name;
        return role;
    } catch (e) {
        console.error("error in login", e);
    }
}


module.exports.signup = async (input, role_id) => {
    try {
        let resp;
        if (role_id == 1) {
            resp = await userModel.signupOwner(input);
        } else if (role_id == 2) {
            resp = await userModel.signupBroker(input);
        } else {
            resp = await userModel.signupUser(input);
        }
        return resp;
    } catch (e) {
        console.error("error in login", e);
    }
}


module.exports.deleteAccount = async (userName, role, body) => {
    try {
        // prepare input params for procedure
        //validations if any
        //make call for applyForTour
        let resp;
        resp = await userModel.deleteAccount();
        return resp;
    } catch (e) {
        console.error("error in login", e);
    }
}
