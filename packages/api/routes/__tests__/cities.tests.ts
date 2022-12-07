import app from "../../index"
import  request  from "supertest"

describe("get /cities", () => {

        it("returns status code 200 and contain json", async () => {
            const res = await request(app)
            .get("/cities")
            .expect("Content-Type", /json/)
            .expect(200);
        });

});