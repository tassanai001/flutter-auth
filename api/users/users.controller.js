const express = require('express');
const router = express.Router();
const userService = require('./user.service');

// routes
router.post('/authenticate', authenticate);
router.get('/', getAll);

router.get('/page1', page1);
router.get('/page2', page2);

module.exports = router;

function authenticate(req, res, next) {
    userService.authenticate(req.body)
        .then(user => res.json(user))
        .catch(next);
}

function getAll(req, res, next) {
    userService.getAll()
        .then(users => res.json(users))
        .catch(next);
}

function page1(req, res, next) {
    res.json({ message: "Hi! Content page 1" });
}


function page2(req, res, next) {
    res.json({ message: "Hi! Content page 2" });
}
