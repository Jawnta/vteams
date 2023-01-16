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
const fakeGeo = '{ "type": "Point", "coordinates": [15.623310868629314, 56.17424951262469]}';
describe("get /chargingstations", () => {
    it("returns status code 200 and contains json", () => __awaiter(void 0, void 0, void 0, function* () {
        const res = yield (0, supertest_1.default)(index_1.default)
            .get("/chargingstations")
            .expect("Content-Type", /json/)
            .expect(200);
    }));
});
describe("get /chargingstations/zone/1'", () => {
    it("returns status code 200 and contains json", () => __awaiter(void 0, void 0, void 0, function* () {
        const res = yield (0, supertest_1.default)(index_1.default)
            .get("/chargingstations/zone/1")
            .expect("Content-Type", /json/)
            .expect(200);
    }));
});
describe("get /chargingstations/1", () => {
    it("returns status code 200 and contains json", () => __awaiter(void 0, void 0, void 0, function* () {
        const res = yield (0, supertest_1.default)(index_1.default)
            .get("/chargingstations/1")
            .expect("Content-Type", /json/)
            .expect(200);
    }));
});
describe('Post to endpoints in Chargingstations', () => {
    it('should create a new chargingstation', () => __awaiter(void 0, void 0, void 0, function* () {
        const res = yield (0, supertest_1.default)(index_1.default)
            .post('/chargingstations')
            .send({
            position: fakeGeo,
            charging_zone_id: 1,
            occupied: false,
        })
            .expect(200)
            .expect("Content-Type", /json/);
    }));
});
