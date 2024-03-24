const tourService = require("../service/tourService");
const listingsService = require("../service/listingsService");
const applicationService = require("../service/applicationService");
const propertService = require("../service/propertyService");
const prompt = require('prompt-sync')();
const displayTable = require("../utils/table");
module.exports.startOwner = async (user_id, role) => {
    try {

        console.log("owner Login successful");
        let flag = false;
        let toShowProps;
        while (!flag) {
            console.log("created properties are:-");
            // get list of properties
            let resp = await propertService.getAllProperties(user_id, role);
            if (resp.length == 0) {
                console.log("No properties created yet");
            } else {
                const keysToExtract = ["property_id", "property_type", "area", "owner_id", "broker_name", "street_no", "street_name", "city", "num_baths", "num_beds"];
                toShowProps = resp.map(obj => {
                    const newObj = {};
                    keysToExtract.forEach(key => {
                        if (obj.hasOwnProperty(key)) {
                            newObj[key] = obj[key];
                        }
                    });
                    return newObj;
                });
                displayTable.displayData(toShowProps);
            }


            console.log("Available operations");
            console.log("1. update a property");
            console.log("2. delete a property");
            console.log("3. view all listings against a property.");
            console.log("4. create a property");
            console.log("5. exit")
            let input = prompt('Press the number against the option which you choose to proceed with: ');
            if (input == 1) {
                if (resp.length == 0) {
                    console.log("No properties to update");
                } else {
                    let num = prompt("select a property number to update: ");
                    if (num >= resp.length || num < 0) {
                        console.error("invalid input number");
                        continue;
                    } else {
                        console.log("updatable fields in the property are: num_baths, num_beds and area");
                        let num_baths, num_beds, area;
                        num_baths = prompt("enter the num_baths to be updated: ");
                        if (!isValidInput(num_baths)) {
                            console.log("invalid input for num_baths");
                            continue;
                        }
                        num_beds = prompt("enter the num_beds to be updated: ");
                        if (!isValidInput(num_beds)) {
                            console.log("invalid input for num_beds");
                            continue;
                        }
                        area = prompt("enter the area to be updated: ");
                        if (!isvalidArea(area)) {
                            console.log("invalid input for area");
                            continue;
                        }
                        await propertService.updateProperty(resp[num].property_id, num_beds, num_baths, area, resp[num].property_type);
                        console.log("property updated successfully");
                    }
                }
            } else if (input == 2) {
                if (resp.length == 0) {
                    console.log("No properties to delete");

                } else {
                    let num = prompt("select a property number to delete: ");
                    if (num >= resp.length || num < 0) {
                        console.error("invalid input number");
                        continue;
                    }
                    await propertService.deleteProperty(user_id, resp[num].property_id);
                    console.log("property successfully deleted");
                }
            } else if (input == 3) {
                if (resp.length == 0) {
                    console.log("No properties created to view listings");
                }
                else {
                    let num = prompt("select a property number to delete: ");
                    if (num >= resp.length || num < 0) {
                        console.error("invalid input number");
                        continue;
                    }
                    let respds = await listingsService.getAllListingByProperty(user_id, resp[num].property_id);
                    if (respds.length == 0) {
                        console.log("No listings posted for the property");
                    }
                    else {
                        const keysToExtracts = ["listing_id", "listing_type", "price", "street_no", "street_name", "city", "zip", "area"];
                        let toShowListing = respds.map(obj => {
                            const newObj = {};
                            keysToExtracts.forEach(key => {
                                if (obj.hasOwnProperty(key)) {
                                    newObj[key] = obj[key];
                                }
                            });
                            return newObj;
                        });
                        displayTable.displayData(toShowListing);
                    }
                }
            } else if (input == 4) {
                console.log("create a property");
                let num_beds, num_baths, area, property_type, latitude, longitude, street_number, street_name, city, zip, state;
                num_baths = prompt("enter the num_baths: ");
                if (!isValidInput(num_baths)) {
                    console.log("invalid input for num_baths");
                    continue;
                }
                num_beds = prompt("enter the num_beds: ");
                if (!isValidInput(num_beds)) {
                    console.log("invalid input for num_beds");
                    continue;
                }
                area = prompt("enter the area: ");
                if (!isvalidArea(area)) {
                    console.log("invalid input for area");
                    continue;
                }
                property_type = prompt("enter the property type: ");
                if (!(property_type == "House" || property_type == "Apartment")) {
                    console.log("invalid input for property type, must be 'House' or 'Apartment'");
                    continue;
                }
                latitude = prompt("enter the latitude: ");
                if (!isValidLatitude(latitude)) {
                    console.log("invalid input for latitude");
                    continue;
                }
                longitude = prompt("enter the longitude: ");
                if (!isValidLongitude(longitude)) {
                    console.log("invalid input for longitude");
                    continue;
                }
                zip = prompt("enter the zipcode: ");
                if (!isValidUSZipCode(zip)) {
                    console.log("invalid input for zipcode");
                    continue;
                }
                street_number = prompt("enter the street Number: ");
                street_name = prompt("enter the street name: ");
                city = prompt("enter the city: ");
                state = prompt("enter the state: ");

                await propertService.createProperty(num_beds, num_baths, area, property_type, latitude,
                    longitude, street_number, street_name, city, zip, state, user_id);
            } else if (input == 5) {
                console.log("now exiting");
                flag = true;
            }
            else {
                console.error("please enter correct input either of 1,2,3 or 4");
            }
        }
    } catch (e) {
        console.error("error in startUser", e);
    }
}


function isValidInput(input) {
    const numericValue = parseFloat(input);

    // Check if the input is a valid number
    if (isNaN(numericValue)) {
        return false;
    }

    // Check if the number is greater than 0 and a multiple of 0.5
    return numericValue > 0 && numericValue % 0.5 === 0;
}

function isvalidArea(input) {
    const numericValue = parseFloat(input);

    // Check if the input is a valid number
    if (isNaN(numericValue)) {
        return false;
    }

    return numericValue > 0;
}

function isValidLatitude(latitude) {
    // Latitude must be a number between -90 and 90
    const numericValue = parseFloat(latitude);
    return !isNaN(numericValue) && numericValue >= -90 && numericValue <= 90;
}

function isValidLongitude(longitude) {
    // Longitude must be a number between -180 and 180
    const numericValue = parseFloat(longitude);
    return !isNaN(numericValue) && numericValue >= -180 && numericValue <= 180;
}

function isValidUSZipCode(zipCode) {
    // Regular expression for US zip codes (5 digits or 5 digits followed by a hyphen and 4 more digits)
    const zipCodeRegex = /^\d{5}(?:-\d{4})?$/;

    return zipCodeRegex.test(zipCode);
}