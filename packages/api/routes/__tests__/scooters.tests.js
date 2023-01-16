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
const index_1 = __importDefault(require("../../index"));
const supertest_1 = __importDefault(require("supertest"));
const fakeScooterId = {
    id: 1,
    available: true,
    enabled: true,
    charge: 50,
    last_serviced: new Date(),
    first_used: new Date(),
    distance_traveled: 500,
    last_position: '{ "type": "Point", "coordinates": [15.623310868629314, 56.17424951262469]}',
    is_charging: false,
    city_id: 1
};
describe("get /scooters", () => {
    it("returns status code 200 and contains json", () => __awaiter(void 0, void 0, void 0, function* () {
        const res = yield (0, supertest_1.default)(index_1.default)
            .get("/scooters")
            .expect("Content-Type", /json/)
            .expect(200);
    }));
});
describe("get /scooters/available", () => {
    it("returns status code 200 and contains json", () => __awaiter(void 0, void 0, void 0, function* () {
        const res = yield (0, supertest_1.default)(index_1.default)
            .get("/scooters/available")
            .expect("Content-Type", /json/)
            .expect(200);
    }));
});
describe("get /scooters/1", () => {
    it("returns status code 200 and contains json", () => __awaiter(void 0, void 0, void 0, function* () {
        const res = yield (0, supertest_1.default)(index_1.default)
            .get("/scooters/1")
            .expect("Content-Type", /json/)
            .expect(200);
    }));
});
describe("get /scooter/1/logs", () => {
    it("returns status code 200 and contains json", () => __awaiter(void 0, void 0, void 0, function* () {
        const res = yield (0, supertest_1.default)(index_1.default)
            .get("/scooters/1")
            .expect("Content-Type", /json/)
            .expect(200);
    }));
});
describe("get /scooters/city/karlskrona", () => {
    it("returns status code 200 and contains json", () => __awaiter(void 0, void 0, void 0, function* () {
        const res = yield (0, supertest_1.default)(index_1.default)
            .get("/scooters/city/karlskrona")
            .expect("Content-Type", /json/)
            .expect(200);
    }));
});
describe("Put /scooters/1", () => {
    it("update user with id 1", () => __awaiter(void 0, void 0, void 0, function* () {
        const res = yield (0, supertest_1.default)(index_1.default)
            .put("/scooters/15")
            .send(fakeScooterId)
            .expect(200);
    }));
});
