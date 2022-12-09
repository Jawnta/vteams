import {UserInterface} from "../components/interfaces/userInterface";


export const getUsers = async ():Promise<UserInterface[]> => {
        const response = await fetch(`/users/`);
        return await response.json();
};

export const getUser = async (id: number):Promise<UserInterface[]> => {
        const response = await fetch(`/users/${id}`);
        return await response.json();

};