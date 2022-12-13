import app from "../../index"
import  request  from "supertest"

describe("get /parkingzones", () => {

        it("returns status code 200 and contains json", async () => {
            const res = await request(app)
            .get("/parkingzones")
            .expect("Content-Type", /json/)
            .expect(200);
        });
});

describe("get /parkingzones/city/karlskrona", () => {

    it("returns status code 200 and contains json", async () => {
        const res = await request(app)
        .get("/parkingzones/city/karlskrona")
        .expect("Content-Type", /json/)
        .expect(200);
    });
});

describe("get /parkingzones/1", () => {

    it("returns status code 200 and contains json", async () => {
        const res = await request(app)
        .get("/parkingzones/1")
        .expect("Content-Type", /json/)
        .expect(200);
    });
});
