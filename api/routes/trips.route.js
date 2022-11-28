const express = require('express');
const trips = require('../services/trips');
const router = new express.Router();
 
router.get('/', async (req, res, next) => {
  let options = { 
  };


  try {
    const result = await trips.getTrips(options);
    res.status(result.status || 200).send(result.data);
  }
  catch (err) {
    return res.status(500).send({
      error: err || 'Something went wrong.'
    });
  }
});
 
router.post('/', async (req, res, next) => {
  let options = { 
  };

  options.trip = req.body;

  try {
    const result = await trips.postTrips(options);
    res.status(result.status || 200).send(result.data);
  }
  catch (err) {
    return res.status(500).send({
      error: err || 'Something went wrong.'
    });
  }
});
 
router.get('/:tripId', async (req, res, next) => {
  let options = { 
    "tripId": req.params.tripId,
  };


  try {
    const result = await trips.getTripId(options);
    res.status(result.status || 200).send(result.data);
  }
  catch (err) {
    return res.status(500).send({
      error: err || 'Something went wrong.'
    });
  }
});
 
router.put('/:tripId', async (req, res, next) => {
  let options = { 
    "tripId": req.params.tripId,
  };

  options.trip = req.body;

  try {
    const result = await trips.putTripId(options);
    res.status(result.status || 200).send(result.data);
  }
  catch (err) {
    return res.status(500).send({
      error: err || 'Something went wrong.'
    });
  }
});
 
router.delete('/:tripId', async (req, res, next) => {
  let options = { 
    "tripId": req.params.tripId,
  };


  try {
    const result = await trips.deleteTripId(options);
    res.status(result.status || 200).send(result.data);
  }
  catch (err) {
    return res.status(500).send({
      error: err || 'Something went wrong.'
    });
  }
});

module.exports = router;