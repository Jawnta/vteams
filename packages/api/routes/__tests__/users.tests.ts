import app from "../../index"
import  request  from "supertest"

const fakeUser = {
    first_name: 'andreas',
    last_name: 'string',
    phone_number: 1234567,
    email: 'email-string',
    social_security: 'ss_string',
    enabled: true,
    credit: 0,
    token: 'token-string'
}
const fakeUserUpdate = {
    id: 15,
    first_name: 'iAmChanged',
    last_name: 'user',
    phone_number: 1234567,
    email: 'email-string',
    social_security: 'ss_string',
    enabled: true,
    credit: 100,
    token: 'token-string'
}

describe('Post to /users', () => {
    it('should create a new user', async () => {
      const res = await request(app)
        .post('/users')
        .send(fakeUser)
        .expect(200)
        .expect("Content-Type", /json/)
      
    })
  })

describe("get /users", () => {
        it("returns status code 200 and contains json", async () => {
            const res = await request(app)
            .get("/users")
            .expect("Content-Type", /json/)
            .expect(200);
        });

});

describe("get /users/1", () => {
    it("Get user with id 1", async () => {
        const res = await request(app)
        .get("/users/1")
        .expect("Content-Type", /json/)
        .expect(200)
        expect(res.body[0].id).toBe(1)
    });
    
});

describe("Put /users/15", () => {
    it("update user with id 15", async () => {
        const res = await request(app)
        .put("/users/15")
        .send(fakeUserUpdate)
        .expect(200)
        .expect("Content-Type", /json/)
    });

});

describe("Get /users/162/invoices", () => {
    it("Get invoices for user with id 162", async () => {
        const res = await request(app)
        .get("/users/162/invoices")
        .expect("Content-Type", /json/)
        .expect(200);
    });
});

describe("Get users/162/trips", () => {
    it("Get trips for user with id 162", async () => {
        const res = await request(app)
        .get("/users/162/trips")
        .expect("Content-Type", /json/)
        .expect(200);
    });
});
