import app from "../../index"
import  request  from "supertest"

describe("get /chargingstations", () => {

        it("returns status code 200", async () => {
            const res = await request(app)
            .get("/chargingstations")
            // .send({firstName: "Andreas"});
            expect(res.statusCode).toEqual(200);
        });

});