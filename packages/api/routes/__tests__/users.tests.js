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
const fakeUser = {
    first_name: 'andreas',
    last_name: 'string',
    phone_number: 1234567,
    email: 'email-string',
    social_security: 'ss_string',
    enabled: true,
    credit: 0,
    token: 'token-string'
};
const fakeUserUpdate = {
    id: 15,
    first_name: 'iAmChanged',
    last_name: 'user',
    phone_number: 1234567,
    email: 'email-string',
    social_security: 'ss_string',
    enabled: true,
    credit: 100,
    token: 'token-string'
};
describe('Post to /users', () => {
    it('should create a new user', () => __awaiter(void 0, void 0, void 0, function* () {
        const res = yield (0, supertest_1.default)(index_1.default)
            .post('/users')
            .send(fakeUser)
            .expect(200)
            .expect("Content-Type", /json/);
    }));
});
describe("get /users", () => {
    it("returns status code 200 and contains json", () => __awaiter(void 0, void 0, void 0, function* () {
        const res = yield (0, supertest_1.default)(index_1.default)
            .get("/users")
            .expect("Content-Type", /json/)
            .expect(200);
    }));
});
describe("get /users/1", () => {
    it("Get user with id 1", () => __awaiter(void 0, void 0, void 0, function* () {
        const res = yield (0, supertest_1.default)(index_1.default)
            .get("/users/1")
            .expect("Content-Type", /json/)
            .expect(200);
        expect(res.body[0].id).toBe(1);
    }));
});
describe("Put /users/15", () => {
    it("update user with id 15", () => __awaiter(void 0, void 0, void 0, function* () {
        const res = yield (0, supertest_1.default)(index_1.default)
            .put("/users/15")
            .send(fakeUserUpdate)
            .expect(200)
            .expect("Content-Type", /json/);
    }));
});
describe("Get /users/162/invoices", () => {
    it("Get invoices for user with id 162", () => __awaiter(void 0, void 0, void 0, function* () {
        const res = yield (0, supertest_1.default)(index_1.default)
            .get("/users/162/invoices")
            .expect("Content-Type", /json/)
            .expect(200);
    }));
});
describe("Get users/162/trips", () => {
    it("Get trips for user with id 162", () => __awaiter(void 0, void 0, void 0, function* () {
        const res = yield (0, supertest_1.default)(index_1.default)
            .get("/users/162/trips")
            .expect("Content-Type", /json/)
            .expect(200);
    }));
});
