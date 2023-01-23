interface User {
    id:	number,
    first_name: string,
    last_name: string,
    phone_number?: number,
    email?:string,
    register_date?: string,
    social_security?: string,
    enabled?: boolean,
    credit: number,
    token?: string,
}
export default User;