import app from "../../index"
import  request  from "supertest"
const fakeScooterId = {
    id: 1,
    available: true,
    enabled: true,
    charge: 50,
    last_serviced: new Date(),
    first_used: new Date(),
    distance_traveled: 500,
    last_position: '{ "type": "Point", "coordinates": [15.623310868629314, 56.17424951262469]}',
    is_charging: false,
    city_id: 1
}
describe("get /scooters", () => {

        it("returns status code 200 and contains json", async () => {
            const res = await request(app)
            .get("/scooters")
            .expect("Content-Type", /json/)
            .expect(200);
        });
        
});

describe("get /scooters/available", () => {

    it("returns status code 200 and contains json", async () => {
        const res = await request(app)
        .get("/scooters/available")
        .expect("Content-Type", /json/)
        .expect(200);
    });
    
});

describe("get /scooters/1", () => {

    it("returns status code 200 and contains json", async () => {
        const res = await request(app)
        .get("/scooters/1")
        .expect("Content-Type", /json/)
        .expect(200);
    });
    
});


describe("get /scooter/1/logs", () => {

    it("returns status code 200 and contains json", async () => {
        const res = await request(app)
        .get("/scooters/1")
        .expect("Content-Type", /json/)
        .expect(200);
    });
    
});

describe("get /scooters/city/karlskrona", () => {

    it("returns status code 200 and contains json", async () => {
        const res = await request(app)
        .get("/scooters/city/karlskrona")
        .expect("Content-Type", /json/)
        .expect(200);
    });
});

describe("Put /scooters/1", () => {
    it("update user with id 1", async () => {
        const res = await request(app)
        .put("/scooters/15")
        .send(fakeScooterId)
        .expect(200)
    });

});

