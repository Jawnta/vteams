import {UserInterface} from "../components/interfaces/userInterface";

export const updateUser = async (userDetails: UserInterface ) => {
    const requestOptions = {
        method: "PUT",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(userDetails),
    };
    await fetch(`/users/${userDetails.id}`, requestOptions);
}

export const getUserInvoices = async () => {
    const response = await fetch(`/users/`);
    return await response.json();

};