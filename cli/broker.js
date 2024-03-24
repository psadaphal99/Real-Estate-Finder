const tourService = require("../service/tourService");
const listingsService = require("../service/listingsService");
const applicationService = require("../service/applicationService");
const propertService = require("../service/propertyService");
const prompt = require('prompt-sync')();
const displayTable = require("../utils/table");

module.exports.startBroker = async (user_id, role) => {
    try {
        console.log("user Login");
        let toShowProps;
        let flag = false;
        while (!flag) {
            console.log("Available operations");
            console.log("1. create Listings");
            console.log("2. Update Listings");
            console.log("3. Delete Listings");
            console.log("4. View Pending Tour Requests");
            console.log("5. View Pending Applications");
            console.log("6. exit");
            let input = prompt('Press the number against the option which you choose to proceed with: ');
            if (input == 1) {
                let resp = await propertService.getAllProperties(user_id, role);
                if (resp.length == 0) {
                    console.log("No properties assigned yet");
                    continue;
                }
                const keysToExtract = ["property_id", "property_type", "area", "street_no", "street_name", "city", "num_baths", "num_beds"];
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
                let num = prompt("enter a property number to proceed creation: ");
                if (num >= resp.length || num < 0) {
                    console.error("invalid input number");
                    continue;
                }
                console.log("create a listing");
                let listing_type, price, summary, media_url, features, policy;
                listing_type = prompt("Enter the listing_type(Sale/Rent): ");
                if (!(listing_type == "Sale" || listing_type == "Rent")) {
                    console.log("Invalid listing_type");
                    continue;
                }
                price = prompt("Enter the price: ");
                if (!isvalidPrice) {
                    console.log("Invalid price");
                    continue;
                }

                media_url = prompt("Enter the media_url: ");
                if (!isValidURL(media_url)) {
                    console.log("Invalid url");
                    continue;
                }
                summary = prompt("Enter the summary: ");
                features = prompt("Enter the features: ");
                policy = prompt("Enter the policy: ");
                await listingsService.createListing(user_id, listing_type, price, true, summary, resp[num].property_id,
                    media_url, features, policy);
            } else if (input == 2) {
                let resp = await listingsService.getAllListings(user_id, role);
                if (resp.length == 0) {
                    console.log("No listings available for updation");
                    continue;
                }
                const keysToExtracts = ["listing_id", "listing_type", "price", "street_no", "street_name", "city", "zip", "area"];
                let toShowListing = resp.map(obj => {
                    const newObj = {};
                    keysToExtracts.forEach(key => {
                        if (obj.hasOwnProperty(key)) {
                            newObj[key] = obj[key];
                        }
                    });
                    return newObj;
                });
                displayTable.displayData(toShowListing);

                let num = prompt("select a listing number to update: ");
                if (num >= resp.length || num < 0) {
                    console.error("invalid input number");
                    continue;
                }

                console.log("Following fields are updatable in listing - 1. listing_type 2.price 3.summary");
                let listing_type, price, summary;
                listing_type = prompt("Enter the listing_type(Sale/Rent): ");
                if (!(listing_type == "Sale" || listing_type == "Rent")) {
                    console.log("Invalid listing_type");
                    continue;
                }
                price = prompt("Enter the price: ");
                if (!isvalidPrice) {
                    console.log("Invalid price");
                    continue;
                }
                summary = prompt("Enter the summary: ");
                await listingsService.updateListing(listing_type, price, summary, resp[num].isactive, resp[num].listing_id);
                console.log("successfully updated the listing");
            } else if (input == 3) {
                let resp = await listingsService.getAllListings(user_id, role);
                if (resp.length == 0) {
                    console.log("No listings available for deletion");
                    continue;
                }
                const keysToExtracts = ["listing_id", "listing_type", "price", "street_no", "street_name", "city", "zip", "area"];
                let toShowListing = resp.map(obj => {
                    const newObj = {};
                    keysToExtracts.forEach(key => {
                        if (obj.hasOwnProperty(key)) {
                            newObj[key] = obj[key];
                        }
                    });
                    return newObj;
                });
                displayTable.displayData(toShowListing);

                let num = prompt("select a listing number to delete: ");
                if (num >= resp.length || num < 0) {
                    console.error("invalid input number");
                    continue;
                }
                await listingsService.deleteListing(resp[num].listing_id);
                console.log("successfully deleted the listing");
            } else if (input == 4) {
                let resp = await tourService.getAllTours(user_id, role);
                if (resp.length == 0) {
                    console.log("no pending tours");
                    continue;
                } else {
                    displayTable.displayData(resp);
                    let num = prompt("select a tour number to proceed: ");
                    if (num >= resp.length || num < 0) {
                        console.error("invalid input number");
                        continue;
                    }
                    console.log("options available with the tour are");
                    console.log("1. Accept the tour");
                    console.log("2. Reject the tour");
                    console.log("3. Return to main menu");
                    let ins = prompt("enter a number to proceed with one of the options: ");
                    if (ins > 3 || ins < 1) {
                        console.error("invalid input number");
                        continue;
                    }
                    if (ins == 1) {
                        await tourService.updateTourByID(resp[num].tour_id, "Accepted");
                        console.log("successfully accepted the tour request");
                    } else if (ins == 2) {
                        await tourService.updateTourByID(resp[num].tour_id, "Rejected");
                        console.log("successfully rejected the tour request");
                    } else {
                        continue;
                    }
                }
            } else if (input == 5) {
                let resp = await applicationService.getAllApplications(user_id, role);
                if (resp.length == 0) {
                    console.log("no pending applications");
                    continue;
                } else {
                    displayTable.displayData(resp);
                    let num = prompt("select a application number to proceed: ");
                    if (num >= resp.length || num < 0) {
                        console.error("invalid input number");
                        continue;
                    }
                    console.log("options available with the application are");
                    console.log("1. Accept the application");
                    console.log("2. Reject the application");
                    console.log("3. Return to main menu");
                    let ins = prompt("enter a number to proceed with one of the options: ");
                    if (ins > 3 || ins < 1) {
                        console.error("invalid input number");
                        continue;
                    }
                    if (ins == 1) {
                        await applicationService.updateApplicationByID(resp[num].application_id, "Accepted");
                        console.log("successfully accepted the tour request");
                    } else if (ins == 2) {
                        await applicationService.updateApplicationByID(resp[num].application_id, "Rejected");
                        console.log("successfully rejected the tour request");
                    } else {
                        continue;
                    }
                }
            } else if (input == 6) {
                console.log("now exiting");
                flag = true;
            }
            else {
                console.error("please enter correct input either of 1,2,3, 4 or 5");
            }
        }
    } catch (e) {
        console.error("error in startBroker", e);
    }
}

function isvalidPrice(input) {
    const numericValue = parseFloat(input);

    // Check if the input is a valid number
    if (isNaN(numericValue)) {
        return false;
    }

    return numericValue > 0;
}

function isValidURL(url) {
    // Regular expression for a basic URL validation
    const urlRegex = /^(ftp|http|https):\/\/[^ "]+$/;

    return urlRegex.test(url);
}