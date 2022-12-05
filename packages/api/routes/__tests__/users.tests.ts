import  request  from "supertest"
let app = require("../../index")
describe("get /users", () => {
        it("test satus 200 and contain json", async () => {
            const res = await request(app)
            .get("/users")
            expect(res.statusCode).toEqual(200);
            expect(res.headers['content-type']).toEqual(expect.stringContaining("json"));
        },);

});
//Get user with id 1
describe("get /users/userid", () => {
    
    it("returns status code 200", async () => {
        const res = await request(app)
        .get("/users/1")
        expect(res.statusCode).toEqual(200);
    },);

});
