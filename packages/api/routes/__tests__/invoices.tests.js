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
const fakeInvoice = {
    id: 1,
    trip_id: 1,
    amount: 200
};
const fakeInvoiceUpdate = {
    id: 1,
    trip_id: 1,
    amount: 600
};
describe("get /invoices", () => {
    it("returns status code 200 and contains json", () => __awaiter(void 0, void 0, void 0, function* () {
        const res = yield (0, supertest_1.default)(index_1.default)
            .get("/invoices")
            .expect("Content-Type", /json/)
            .expect(200);
    }));
});
describe("get /invoices/1", () => {
    it("returns status code 200 and contains json", () => __awaiter(void 0, void 0, void 0, function* () {
        const res = yield (0, supertest_1.default)(index_1.default)
            .get("/invoices/1")
            .expect("Content-Type", /json/)
            .expect(200);
    }));
});
describe("update /invoices/1", () => {
    it("returns correct value and contains json", () => __awaiter(void 0, void 0, void 0, function* () {
        const res = yield (0, supertest_1.default)(index_1.default)
            .put("/invoices/1")
            .send(fakeInvoiceUpdate)
            .expect(200);
        expect(res.body[0].amount).toEqual(600);
    }));
});
describe('Post to /invoices', () => {
    it('should create a new invoice', () => __awaiter(void 0, void 0, void 0, function* () {
        const res = yield (0, supertest_1.default)(index_1.default)
            .post('/invoices')
            .send(fakeInvoice)
            .expect(200)
            .expect("Content-Type", /json/);
    }));
});
