import {UserInterface} from "../components/interfaces/userInterface";

export const updateUser = async (userDetails: { userId: number, user: UserInterface }) => {
    console.log(userDetails);
    const requestOptions = {
        method: "PUT",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(userDetails),
    };
    const res = await fetch(`/users/${userDetails.user.id}`, requestOptions);
    console.log(res);
}