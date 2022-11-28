const express = require('express');
const users = require('../services/users');
const router = new express.Router();
 
router.get('/', async (req, res, next) => {
  let options = { 
  };


  try {
    const result = await users.getUsers(options);
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

  options.user = req.body;

  try {
    const result = await users.postUsers(options);
    res.status(result.status || 200).send(result.data);
  }
  catch (err) {
    return res.status(500).send({
      error: err || 'Something went wrong.'
    });
  }
});
 
router.get('/:userId', async (req, res, next) => {
  let options = { 
    "userId": req.params.userId,
  };


  try {
    const result = await users.getUserId(options);
    res.status(result.status || 200).send(result.data);
  }
  catch (err) {
    return res.status(500).send({
      error: err || 'Something went wrong.'
    });
  }
});
 
router.put('/:userId', async (req, res, next) => {
  let options = { 
    "userId": req.params.userId,
  };

  options.user = req.body;

  try {
    const result = await users.putUserId(options);
    res.status(result.status || 200).send(result.data);
  }
  catch (err) {
    return res.status(500).send({
      error: err || 'Something went wrong.'
    });
  }
});
 
router.delete('/:userId', async (req, res, next) => {
  let options = { 
    "userId": req.params.userId,
  };


  try {
    const result = await users.deleteUserId(options);
    res.status(result.status || 200).send(result.data);
  }
  catch (err) {
    return res.status(500).send({
      error: err || 'Something went wrong.'
    });
  }
});
 
router.get('/:userId/invoices', async (req, res, next) => {
  let options = { 
    "userId": req.params.userId,
  };


  try {
    const result = await users.getUserIdInvoices(options);
    res.status(result.status || 200).send(result.data);
  }
  catch (err) {
    return res.status(500).send({
      error: err || 'Something went wrong.'
    });
  }
});
 
router.get('/:userId/trips', async (req, res, next) => {
  let options = { 
    "userId": req.params.userId,
  };


  try {
    const result = await users.getUserIdTrips(options);
    res.status(result.status || 200).send(result.data);
  }
  catch (err) {
    return res.status(500).send({
      error: err || 'Something went wrong.'
    });
  }
});

module.exports = router;