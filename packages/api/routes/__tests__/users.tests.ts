import app from "../../index"
import  request  from "supertest"

describe("get /users", () => {
        it("returns status code 200 and contains json", async () => {
            const res = await request(app)
            .get("/users")
            .expect("Content-Type", /json/)
            .expect(200);
        });

});