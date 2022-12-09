import React from 'react';
import "../css/UserTable.css";


export const UserTable = ({...props}) => {
    console.log(props.userId);
    // const checkFilter = () => {
    //     const filtersToApply = [];
    //     if (this.filterData.query) {
    //         filtersToApply.push((task) =>
    //             task.description
    //                 .toLowerCase()
    //                 .includes(this.filterData.query.toLowerCase())
    //         );
    //     }
    //     if (this.filterData.date) {
    //         filtersToApply.push(
    //             (task) => task.starting_time === this.filterData.date
    //         );
    //     }
    //     if (this.filterData.deadline) {
    //         filtersToApply.push(
    //             (task) => task.deadline === this.filterData.deadline
    //         );
    //     }
    //     if (this.filterData.category) {
    //         filtersToApply.push(
    //             (task) => task.category === this.filterData.category
    //         );
    //     }
    //     if (this.filterData.status) {
    //         filtersToApply.push((task) => task.status === this.filterData.status);
    //     }
    //
    //     this.filteredTasks = this.tasks.filter((item) =>
    //         filtersToApply.every((fn) => fn(item))
    //     );
    // }

    const updateUserTable = () => {
        return props.users.map((user, index) => {
            return(<tr key={index}>
                <td>{user.id}</td>
                <td>{user.first_name}</td>
                <td>{user.last_name}</td>
                <td>{user.phone_number}</td>
                <td>{user.email}</td>
                <td>{user.register_date}</td>
                <td>{user.social_security}</td>
            </tr>)
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
