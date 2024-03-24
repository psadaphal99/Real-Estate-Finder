const listingsService = require("../service/listingsService");


module.exports.getAreas = async function (req, res) {

    try {
        let resp = await listingsService.getAllAreas(userId, role, req.body);
        res.status(200).send({message: resp});
    } catch(e) {
        res.status(500).send({message: e.message});
    }
};


module.exports.getAllListings = async function (req, res) {

    try {
        let resp = await listingsService.getAllListings(userId, role, req.body);
        res.status(200).send({message: resp});
    } catch(e) {
        res.status(500).send({message: e.message});
    }
};

module.exports.getListingByID = async function (req, res) {

    try {
        let resp = await listingsService.getListingById(userId, role, req.body);
        res.status(200).send({message: resp});
    } catch(e) {
        res.status(500).send({message: e.message});
    }
};

module.exports.addListing = async function (req, res) {

    try {
        let resp = await listingsService.addListing(req.body);
        res.status(200).send({message: resp});
    } catch(e) {
        res.status(500).send({message: e.message});
    }
};