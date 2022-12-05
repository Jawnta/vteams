import  request  from "supertest"
let app = require("../../index")
describe("get /cities", () => {
        
        it("test satus 200 and contain json", async () => {
            const res = await request(app)
            .get("/cities")
            expect(res.statusCode).toBe(200);
            expect(res.headers['content-type']).toEqual(expect.stringContaining("json"));
        },);

});
