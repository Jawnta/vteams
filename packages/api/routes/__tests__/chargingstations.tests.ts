import app from "../../index"
import  request  from "supertest"
const fakeGeo = {
    long: 100,
    lat: 100
}
describe("get /chargingstations", () => {

        it("returns status code 200 and contains json", async () => {
            const res = await request(app)
            .get("/chargingstations")
            .expect("Content-Type", /json/)
            .expect(200);
        });

});

//get chargingstations from zone 0
describe("get /chargingstations/zone/0'", () => {

    it("returns status code 200 and contains json", async () => {
        const res = await request(app)
        .get("/chargingstations/zone/0")
        .expect("Content-Type", /json/)
        .expect(200);
    });

});

// get chargingstation with id 0
describe("get /chargingstations/0", () => {

    it("returns status code 200 and contains json", async () => {
        const res = await request(app)
        .get("/chargingstations/0")
        .expect("Content-Type", /json/)
        .expect(200);
    });

});

describe('Post to endpoints in Chargingstations', () => {
    it('should create a new chargingstation', async () => {
      const res = await request(app)
        .post('/chargingstations')
        .send({
            position: fakeGeo,
            charging_zone_id: 1,
            occupied: false,
        })
      .expect(200)
      .expect("Content-Type", /json/)
    })
})
