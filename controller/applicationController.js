const applicationService = require("../service/applicationService");

module.exports.createApplication = async function (req, res) {

    try {
        let resp = await applicationService.createApplication(userId, role, req.body);
        res.status(200).send({message: resp});
    } catch(e) {
        res.status(500).send({message: e.message});
    }
};

module.exports.getAllApplication = async function (req, res) {

    try {
        let resp = await applicationService.getAllApplications(userId, role, req.body);
        res.status(200).send({message: resp});
    } catch(e) {
        res.status(500).send({message: e.message});
    }
};


module.exports.getApplicationByID = async function (req, res) {

    try {
        let resp = await applicationService.getApplicationByID(userId, role, req.body);
        res.status(200).send({message: resp});
    } catch(e) {
        res.status(500).send({message: e.message});
    }
};
