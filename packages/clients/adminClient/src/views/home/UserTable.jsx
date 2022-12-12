import React from 'react';
import "../css/UserTable.css";
import { useNavigate } from 'react-router-dom'


export const UserTable = ({...props}) => {
    if (props.hasSearched){
    }
    const checkFilter = () => {
        const filtersToApply = [];

        if (props.userId) {
            filtersToApply.push((user) => user.id === props.userId);
        }
        if (props.firstName) {
            filtersToApply.push((user) => user.first_name.toLowerCase().includes(props.firstName.toLowerCase()));
        }

        if (props.lastName) {
            filtersToApply.push((user) => user.last_name.toLowerCase().includes(props.lastName.toLowerCase()));
        }

        props.users = props.users.filter((item) =>
            filtersToApply.every((fn) => fn(item))
        );

        if (filtersToApply.length === 0) {
            props.setHasSearched(false);
        }
    };

    const navigate = useNavigate();
    const navigateUserDetails = (id) =>{
        navigate(`/users/${id}`);
    };



        const updateUserTable = () => {
        checkFilter();
        return props.users.map((user, index) => {
            return(
                <tr key={index} onClick={() => {navigateUserDetails(user.id)}}>
                    <td>{user.id}</td>
                    <td>{user.first_name}</td>
                    <td>{user.last_name}</td>
                    <td>{user.phone_number}</td>
                    <td>{user.email}</td>
                    <td>{user.register_date}</td>
                    <td>{user.social_security}</td>
                </tr>
            )
        })
    };




    return (
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
    );
}
