import app from "../../index"
import  request  from "supertest"

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

//get scooter with id 0
describe("get /scooters/0", () => {

    it("returns status code 200 and contains json", async () => {
        const res = await request(app)
        .get("/scooters/0")
        .expect("Content-Type", /json/)
        .expect(200);
    });
    
});

// Get logs for scooter 0
describe("get /scooter/0/logs", () => {

    it("returns status code 200 and contains json", async () => {
        const res = await request(app)
        .get("/scooters/0")
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