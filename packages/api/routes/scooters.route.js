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
exports.scooterRouter = void 0;
const express_1 = __importDefault(require("express"));
const scooters_1 = require("../services/scooters");
const router = express_1.default.Router();
router.get('/', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const result = yield scooters_1.scooters.getScooters();
        res.status(result.status || 200).send(result.data);
    }
    catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
}));
router.post('/', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const data = req.body;
    try {
        const result = yield scooters_1.scooters.postScooters(data);
        res.status(result.status || 200).send(result.data);
    }
    catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
}));
router.get('/available', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const result = yield scooters_1.scooters.getAvailable();
        res.status(result.status || 200).send(result.data);
    }
    catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
}));
router.get('/city/:cityName', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const cityName = req.params.cityName;
    try {
        const result = yield scooters_1.scooters.getCityCityName(cityName);
        res.status(result.status || 200).send(result.data);
    }
    catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
}));
router.get('/:scooterId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const scooterId = +req.params.scooterId;
    try {
        const result = yield scooters_1.scooters.getScooterId(scooterId);
        res.status(result.status || 200).send(result.data);
    }
    catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
}));
router.put('/:scooterId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const scooter = req.body;
    const data = {
        scooterId: +req.params.scooterId,
        scooter: scooter,
    };
    try {
        const result = yield scooters_1.scooters.putScooterId(data);
        res.status(result.status || 200).send(result.data);
    }
    catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
}));
router.delete('/:scooterId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const scooterId = +req.params.scooterId;
    try {
        const result = yield scooters_1.scooters.deleteScooterId(scooterId);
        res.status(result.status || 200).send(result.data);
    }
    catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
}));
router.get('/:scooterId/logs', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const scooterId = +req.params.scooterId;
    try {
        const result = yield scooters_1.scooters.getScooterIdLogs(scooterId);
        res.status(result.status || 200).send(result.data);
    }
    catch (err) {
        return res.status(500).send({
            error: err || 'Something went wrong.',
        });
    }
}));
exports.scooterRouter = router;
