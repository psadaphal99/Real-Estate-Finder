const tourService = require("../service/tourService");

module.exports.getAllTour = async function (req, res) {

    try {
        let resp = await tourService.getAllTours(userId, role, req.body);
        res.status(200).send({message: resp});
    } catch(e) {
        res.status(500).send({message: e.message});
    }
};


module.exports.createTour = async function (req, res) {

    try {
        let resp = await tourService.createTour(userId, role, req.body);
        res.status(200).send({message: resp});
    } catch(e) {
        res.status(500).send({message: e.message});
    }
};


