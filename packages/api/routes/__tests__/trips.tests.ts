import app from "../../index"
import  request  from "supertest"

describe("get /trips", () => {

        it("returns status code 200 and contains json", async () => {
            const res = await request(app)
            .get("/trips")
            .expect("Content-Type", /json/)
            .expect(200);
        });

});

describe("get /trips/1", () => {

    it("returns status code 200 and contains json", async () => {
        const res = await request(app)
        .get("/trips/1")
        .expect("Content-Type", /json/)
        .expect(200);
    });

});