const db = require("../model/db");
const prompt = require('prompt-sync')();
const loginService = require("../service/userService");
const userRoles = require("../utils/userRole").userRoles;
const user = require("../cli/user");
const broker = require("../cli/broker");
const owner = require("../cli/owner");


module.exports.start = async () => {

    try {
        let inputFlag = false;
        while (!inputFlag) {
            console.log("WELCOME TO REAL ESTATE APPLICATION");
            console.log("Available options");
            console.log("1. Login\n2. Signup\n3. Exit");
            let input = prompt('\nPress the number against the option which you choose to proceed with: ');

            //login
            if (input == 1) {
                await handleLogin();
                //inputFlag = true;
            } else if (input == 2) {
                // signup
                await handleSignUp();
            } else if (input == 3) {
                inputFlag = true;
            }
            else {
                console.log("Please provide proper input");
            }
        }


    } catch (e) {
        console.error("error in start", e);
    } finally {
        // disconnect with DB
        db.terminateConnection();
    }
}

async function handleLogin() {
    try {
        console.log("proceeding to Login");
        let username = prompt('Enter Username: ');
        let password = prompt('Enter Password: ');
        let user_id = await loginService.login(username, password);
        //console.log("user_id", user_id);
        if (!user_id) {
            console.log("incorrect username or password");
            return;
        }
        let role = await loginService.getRole(user_id);
        console.log(role);
        if (role == userRoles.user) {
            await user.startUser(user_id, role);
        } else if (role == userRoles.broker) {
            await broker.startBroker(user_id, role);
        } else {
            await owner.startOwner(user_id, role);
        }
    } catch (e) {
        console.error("error in handleLogin", e);
    }
}


// signup

async function handleSignUp() {
    try {
        console.log("proceeding to signup");
        let username = prompt('Enter Username: ');
        let password = prompt('Enter Password: ');
        let firstName = prompt('Enter first Name: ');
        let lastName = prompt('Enter Last Name: ');
        let email = prompt('Enter Email: ');
        let requestObj = {};
        requestObj.username = username;
        requestObj.password = password;
        requestObj.firstName = firstName;
        requestObj.lastName = lastName;
        requestObj.email = email;     // validation   
        let role_id = prompt('User Roles supported:\n 1. Owner \n2. Broker \n3. Enter the serial number against the user role displayed: ');
        let roleFlag = false;
        while (!roleFlag) {
            if (role_id > 3 || role_id < 1) {
                console.log("Invalid user role provided. vaule must be either one of 1,2 or 3")
            }
            else {
                roleFlag = true;
                requestObj.role_id = role_id;
                //owner
                if (role_id == 1) {
                    let state_id = prompt('Enter State ID: ');
                    requestObj.state_id = state_id;
                }
                // broker
                else if (role_id == 2) {
                    requestObj.license_reg_no = prompt('Enter License registration number : ');
                    requestObj.phone_number = prompt('Enter phone number : ');
                    requestObj.agency_name = prompt('Enter Agency name : ');
                }
                // user 
                else {
                    requestObj.phone_number = prompt('Enter phone number : ');
                    requestObj.dateOfBirth = prompt('Enter date of birth : ');
                    requestObj.gender = prompt('Enter gender : ');
                }
            }
        }
        let user_id = await loginService.signup(requestObj, role_id);

    } catch (e) {
        console.error("error in signup", e);

    }
}