"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.userRouter = void 0;
const express_1 = __importDefault(require("express"));
const users_1 = require("../services/users");
const router = express_1.default.Router();
router.get('/', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const result = yield users_1.users.getUsers();
        res.status(200).json(result);
    }
    catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
}));
router.post('/', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const userData = req.body;
    if (!userData.first_name || !userData.last_name) {
        return res.sendStatus(400);
    }
    try {
        const result = yield users_1.users.postUsers(userData);
        res.status(200).json(result);
    }
    catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
}));
router.get('/:userId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const userId = +req.params.userId;
    try {
        const result = yield users_1.users.getUserId(userId);
        res.status(200).json(result);
    }
    catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
}));
router.put('/:userId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const user = req.body;
    if (!user.first_name || !user.last_name) {
        res.sendStatus(400);
    }
    try {
        const result = yield users_1.users.putUserId(user);
        res.status(200).json(result);
    }
    catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
}));
router.delete('/:userId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const userId = +req.params.userId;
    try {
        const result = yield users_1.users.deleteUserId(userId);
        if (!result.affectedRows) {
            res.sendStatus(400);
        }
        res.sendStatus(200);
    }
    catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
}));
router.get('/:userId/invoices', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const userId = +req.params.userId;
    try {
        const result = yield users_1.users.getUserIdInvoices(userId);
        res.status(200).json(result);
    }
    catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
}));
router.get('/:userId/trips', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const userId = +req.params.userId;
    try {
        const result = yield users_1.users.getUserIdTrips(userId);
        res.status(200).send(result);
    }
    catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
}));
exports.userRouter = router;
