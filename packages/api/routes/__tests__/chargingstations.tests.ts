import app from "../../index"
import  request  from "supertest"
const fakeGeo = '{ "type": "Point", "coordinates": [15.623310868629314, 56.17424951262469]}'
describe("get /chargingstations", () => {

        it("returns status code 200 and contains json", async () => {
            const res = await request(app)
            .get("/chargingstations")
            .expect("Content-Type", /json/)
            .expect(200);
        });

});

describe("get /chargingstations/zone/1'", () => {

    it("returns status code 200 and contains json", async () => {
        const res = await request(app)
        .get("/chargingstations/zone/1")
        .expect("Content-Type", /json/)
        .expect(200);
    });

});

describe("get /chargingstations/1", () => {

    it("returns status code 200 and contains json", async () => {
        const res = await request(app)
        .get("/chargingstations/1")
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
