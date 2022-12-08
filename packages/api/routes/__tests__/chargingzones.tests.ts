import app from "../../index"
import  request  from "supertest"

describe("get /chargingzones", () => {

        it("returns status code 200 and contains json", async () => {
            const res = await request(app)
            .get("/chargingzones")
            .expect("Content-Type", /json/)
            .expect(200);
        });

});

//get chargingzones from karlskrona
describe("get /chargingzones/city/karlskrona", () => {

    it("returns status code 200 and contains json", async () => {
        const res = await request(app)
        .get("/chargingzones/city/Karlskrona")
        .expect("Content-Type", /json/)
        .expect(200);
    });

});

describe("get /chargingzones/0", () => {

    it("returns status code 200 and contains json", async () => {
        const res = await request(app)
        .get("/chargingzones/0")
        .expect("Content-Type", /json/)
        .expect(200);
    });

});