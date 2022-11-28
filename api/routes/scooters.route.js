const express = require('express');
const scooters = require('../services/scooters');
const router = new express.Router();
 
router.get('/', async (req, res, next) => {
  let options = { 
  };


  try {
    const result = await scooters.getScooters(options);
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

  options.scooter = req.body;

  try {
    const result = await scooters.postScooters(options);
    res.status(result.status || 200).send(result.data);
  }
  catch (err) {
    return res.status(500).send({
      error: err || 'Something went wrong.'
    });
  }
});
 
router.get('/available', async (req, res, next) => {
  let options = { 
  };


  try {
    const result = await scooters.getAvailable(options);
    res.status(result.status || 200).send(result.data);
  }
  catch (err) {
    return res.status(500).send({
      error: err || 'Something went wrong.'
    });
  }
});
 
router.get('/city/:cityName', async (req, res, next) => {
  let options = { 
    "cityName": req.params.cityName,
  };


  try {
    const result = await scooters.getCityCityName(options);
    res.status(result.status || 200).send(result.data);
  }
  catch (err) {
    return res.status(500).send({
      error: err || 'Something went wrong.'
    });
  }
});
 
router.get('/:scooterId', async (req, res, next) => {
  let options = { 
    "scooterId": req.params.scooterId,
  };


  try {
    const result = await scooters.getScooterId(options);
    res.status(result.status || 200).send(result.data);
  }
  catch (err) {
    return res.status(500).send({
      error: err || 'Something went wrong.'
    });
  }
});
 
router.put('/:scooterId', async (req, res, next) => {
  let options = { 
    "scooterId": req.params.scooterId,
  };

  options.scooter = req.body;

  try {
    const result = await scooters.putScooterId(options);
    res.status(result.status || 200).send(result.data);
  }
  catch (err) {
    return res.status(500).send({
      error: err || 'Something went wrong.'
    });
  }
});
 
router.delete('/:scooterId', async (req, res, next) => {
  let options = { 
    "scooterId": req.params.scooterId,
  };


  try {
    const result = await scooters.deleteScooterId(options);
    res.status(result.status || 200).send(result.data);
  }
  catch (err) {
    return res.status(500).send({
      error: err || 'Something went wrong.'
    });
  }
});
 
router.get('/:scooterId/logs', async (req, res, next) => {
  let options = { 
    "scooterId": req.params.scooterId,
  };


  try {
    const result = await scooters.getScooterIdLogs(options);
    res.status(result.status || 200).send(result.data);
  }
  catch (err) {
    return res.status(500).send({
      error: err || 'Something went wrong.'
    });
  }
});

module.exports = router;