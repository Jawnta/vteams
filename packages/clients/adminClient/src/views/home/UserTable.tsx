import React from 'react';
import "../css/UserTable.css";
import { useNavigate } from 'react-router-dom'
import dayjs from "dayjs";
import {UserInterface} from '../../components/interfaces/userInterface';

export const UserTable = ({...props}) => {
    if (props.hasSearched){
    }
    const checkFilter = () => {
        const filtersToApply: { (user: UserInterface): boolean; (user: UserInterface): any; (user: UserInterface): any; }[] = [];

        if (props.userId) {
            filtersToApply.push((user) => user.id === props.userId);
        }
        if (props.firstName) {
            filtersToApply.push((user) => user.first_name.toLowerCase().includes(props.firstName.toLowerCase()));
        }

        if (props.lastName) {
            filtersToApply.push((user) => user.last_name.toLowerCase().includes(props.lastName.toLowerCase()));
        }

        props.users = props.users.filter((item: any) =>
            filtersToApply.every((fn) => fn(item))
        );

        if (filtersToApply.length === 0) {
            props.setHasSearched(false);
        }
    };

    const navigate = useNavigate();
    const navigateUserDetails = (id: number) =>{
        navigate(`/users/${id}/overview`);
    };



        const updateUserTable = () => {
        checkFilter();
        return props.users.map((user: UserInterface, index: number) => {
            return(
                <tr key={index} onClick={() => {navigateUserDetails(user.id)}}>
                    <td>{user.id}</td>
                    <td>{user.first_name}</td>
                    <td>{user.last_name}</td>
                    <td>{user.phone_number}</td>
                    <td>{user.email}</td>
                    <td>{dayjs(user.register_date).format("YYYY-MM-DD").toString()}</td>
                    <td>{user.social_security}</td>
                </tr>
            )
        })
    };




    return (
            <div className="user-table-wrapper">
            <div className="user-table">
                <table>
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>First name</th>
                        <th>Last name</th>
                        <th>Phone number</th>
                        <th>Email</th>
                        <th>Register date</th>
                        <th>Social security</th>

                    </tr>
                    </thead>
                    <tbody>
                    {!props.hasSearched ? (<tr/>) : updateUserTable()}

                    </tbody>
                </table>
            </div>
            </div>
    );
}
