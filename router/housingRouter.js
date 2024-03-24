const express = require("express");
const router = express.Router();
const listingsController = require("../controller/listingsController");
const tourController = require("../controller/tourController");
const applicationController = require("../controller/applicationController");

// user
router.get("/areas", (req, res) => {
  listingsController.getAreas(req, res);
});

router.get("/listings", (req, res) => {
  listingsController.getAllListings(req, res);
});

router.get("/listing/:id", (req, res) => {
  listingsController.getListingByID(req, res);
});

router.get("/tour", (req, res) => {
  tourController.getAllTour(req, res);
});

router.get("/tour/:id", (req, res) => {
  tourController.getAllTour(req, res);
});

router.post("/tour", (req, res) => {
  tourController.createTour(req, res);
});

router.post("/application", (req, res) => {
  applicationController.createApplication(req, res);
});

router.get("/application", (req, res) => {
  applicationController.getAllApplication(req, res);
});

router.get("/application/:id", (req, res) => {
  applicationController.getApplicationByID(req, res);
});

// broker
router.post("/listings", (req, res) => {
  listingsController.addListing(req, res);
});

module.exports = router;
