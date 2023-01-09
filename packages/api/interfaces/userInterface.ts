export interface UserInterface {
    id?: number;
    first_name: string;
    last_name: string;
    phone_number?: number;
    email: string;
    register_dat?: Date;
    social_security?: string;
    enabled?: boolean;
    credit?: number;
    token: string;
}
