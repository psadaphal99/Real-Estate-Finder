
const tourService = require("../service/tourService");
const listingsService = require("../service/listingsService");
const applicationService = require("../service/applicationService");
const prompt = require('prompt-sync')();
const displayTable = require("../utils/table");

module.exports.startUser = async (user_id, role) => {
    try {
        console.log("user Login");
        let flag = false;
        while (!flag) {
            console.log("Available operations");
            console.log("1. view tour requests");
            console.log("2. view application requests");
            console.log("3. search properties for buying");
            console.log("4. search properties for renting");
            console.log("5. exit")
            let input = prompt('Press the number against the option which you choose to proceed with: ');
            if (input == 1) {
                await handleViewTour(user_id, role);
            } else if (input == 2) {
                await handleViewApplication(user_id, role);
            } else if (input == 3) {
                await handleGetListings(user_id, role, "Sale");
            } else if (input == 4) {
                await handleGetListings(user_id, role, "Rent");
            } else if (input == 5) {
                console.log("now exiting");
                break;
            } else {
                console.error("please enter correct input either of 1,2,3, 4 or 5");
            }
        }
    } catch (e) {
        console.error("error in startUser", e);
    }
}

async function handleViewTour(user_id, role) {
    try {
        let data = await tourService.getAllTours(user_id, role);
        if (data.length == 0) {
            console.log("No tour requests made until now");
            return;
        }
        displayTable.displayData(data);

        let inp = prompt("Do you wish to cancel a tour from above (Y/N): ");
        if (inp.toLocaleLowerCase() == 'y') {
            let inp = prompt("provide the index number of the tour from above to delete: ");
            if (inp >= data.length || inp < 0) {
                console.error("Invalid input");
                return;
            }
            await tourService.cancelTourByID(data[inp].tour_id)
            console.log("Tour successfully deleted");
        }
    } catch (e) {
        console.error("error in handleViewTour", e);
    }
}

async function handleViewApplication(user_id, role) {
    try {
        let data = await applicationService.getAllApplications(user_id, role);
        console.log(data);
        if (data.length == 0) {
            console.log("No application requests made until now");
            return;
        }
        displayTable.displayData(data);

        let inp = prompt("Do you wish to delete a application from above (Y/N): ");
        if (inp.toLocaleLowerCase() == 'y') {
            let inp = prompt("provide the index number of the tour from above to delete: ");
            if (inp >= data.length || inp < 0) {
                console.error("Invalid input");
                return;
            }
            await applicationService.cancelApplicationByID(data[inp].application_id)
            console.log("application successfully deleted");
        }
    } catch (e) {
        console.error("error in handleViewTour", e);
    }
}

async function handleGetListings(user_id, role, type) {
    try {
        console.log("The properties is available in below areas");
        let areas = await listingsService.getAllAreas();
        displayTable.displayData(areas);
        let input = prompt('Press the number against the area which you choose to proceed with: ');
        if (input >= areas.length || input < 0) {
            console.error("error in input provide correct number");
            return;
        }
        let selectedArea = areas[input];
        let listings = await listingsService.getAllListings(user_id, role, type, selectedArea);
        //console.log("listings are as follows = ", listings);
        const keysToExtract = ["listing_id", "listing_type", "price", "street_no", "street_name", "city", "zip"];
        let toShowListing = listings.map(obj => {
            const newObj = {};
            keysToExtract.forEach(key => {
                if (obj.hasOwnProperty(key)) {
                    newObj[key] = obj[key];
                }
            });
            return newObj;
        });
        if (toShowListing.length == 0) {
            console.log("No properties available for this area. Try some other area");
        }
        displayTable.displayData(toShowListing);

        let num = prompt("select a particular listing to proceed with against its index number: ");
        if (num >= toShowListing.length || num < 0) {
            console.error("error in input provide correct number");
            return;
        }
        console.log("The detailed listing data is ", listings[num]);
        console.log("1. Apply for tour");
        console.log("2. Apply for Listing");
        console.log("3. Back to main menu");
        let p = prompt("select a one option from above to proceed with against its index number: ");
        if (p == 1) {
            let tourDate = prompt("enter tour date (YYYY-MM-DD): ");
            while (!isValidDate(tourDate)) {
                console.error("Invalid date format");
                tourDate = prompt("enter tour date (YYYY-MM-DD): ");
            }
            let tourTime = prompt("enter tour time (HH:MM:SS): ");
            while (!isValidTime(tourTime)) {
                console.error("Invalid time format");
                tourTime = prompt("enter tour time (HH:MM:SS): ");
            }
            let tourInstructions = prompt("enter tour instructions: ");
            let tour = await tourService.createTour(user_id, listings[num].listing_id, tourDate, tourTime, tourInstructions);
            console.log("successfully created a Tour request");
        } else if (p == 2) {
            let documenturl = prompt("enter document url: ");
            while (!isValidURL(documenturl)) {
                console.error("Invalid document url");
                documenturl = prompt("enter document url: ");
            }
            let apply = await applicationService.createApplication(user_id, listings[num].listing_id, documenturl);
            console.log("successfully created an application for the request");
        } else if (p == 3) {
            return;
        }
    } catch (e) {
        console.error("error in handleViewTour", e);
    }
}

function isValidDate(dateString) {

    const dateFormatRegex = /^\d{4}-\d{2}-\d{2}$/;
    if (!dateFormatRegex.test(dateString)) {
        return false;
    }

    const inputDate = new Date(dateString);

    return !isNaN(inputDate) && inputDate > new Date();
}

function isValidTime(timeString) {
    // Regular expression to match "HH:MM:SS" format
    const timeFormatRegex = /^([01]\d|2[0-3]):([0-5]\d):([0-5]\d)$/;

    if (!timeFormatRegex.test(timeString)) {
        return false;
    }

    // Split the time string into hours, minutes, and seconds
    const [hours, minutes, seconds] = timeString.split(':').map(Number);

    // Check if hours, minutes, and seconds are within valid ranges
    const isValidHours = hours >= 0 && hours <= 23;
    const isValidMinutes = minutes >= 0 && minutes <= 59;
    const isValidSeconds = seconds >= 0 && seconds <= 59;

    return isValidHours && isValidMinutes && isValidSeconds;
}

function isValidURL(url) {
    // Regular expression for a basic URL validation
    const urlRegex = /^(ftp|http|https):\/\/[^ "]+$/;

    return urlRegex.test(url);
}