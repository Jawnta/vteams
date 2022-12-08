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

describe("Put /users/1", () => {
    it("update user with id 1", async () => {
        const res = await request(app)
        .put("/users/1")
        .send({
            first_name: 'Changed',
            last_name: 'InTest'})
        .expect(200)
        .expect("Content-Type", /json/)
        expect(res.body.first_name).toBe('Changed')
    });

});
