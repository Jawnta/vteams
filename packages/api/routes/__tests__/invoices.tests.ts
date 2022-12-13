import app from "../../index"
import  request  from "supertest"

const fakeInvoice = {
    id: 1,
    trip_id: 1,
    amount: 200
}

const fakeInvoiceUpdate = {
    id: 1,
    trip_id: 1,
    amount: 600
}

describe("get /invoices", () => {

        it("returns status code 200 and contains json", async () => {
            const res = await request(app)
            .get("/invoices")
            .expect("Content-Type", /json/)
            .expect(200);
        });

});

describe("get /invoices/1", () => {

    it("returns status code 200 and contains json", async () => {
        const res = await request(app)
        .get("/invoices/1")
        .expect("Content-Type", /json/)
        .expect(200);
    });

});

describe("update /invoices/1", () => {

    it("returns correct value and contains json", async () => {
        const res = await request(app)
        .put("/invoices/1")
        .send(fakeInvoiceUpdate)
        .expect(200);
        expect(res.body[0].amount).toEqual(600)
    });

});

describe('Post to /invoices', () => {
    it('should create a new invoice', async () => {
      const res = await request(app)
        .post('/invoices')
        .send(fakeInvoice)
        .expect(200)
        .expect("Content-Type", /json/)
      
    })
  })