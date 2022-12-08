import app from "../../index"
import  request  from "supertest"

describe("get /invoices", () => {

        it("returns status code 200 and contains json", async () => {
            const res = await request(app)
            .get("/invoices")
            .expect("Content-Type", /json/)
            .expect(200);
        });

});

//Get invoice with id 0
describe("get /invoices/:id", () => {

    it("returns status code 200 and contains json", async () => {
        const res = await request(app)
        .get("/invoices/0")
        .expect("Content-Type", /json/)
        .expect(200);
    });

});