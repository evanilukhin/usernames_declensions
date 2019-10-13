import React from 'react'
import Table from "./People/Table";
import {Link} from "react-router-dom";

class People extends React.Component {
    render() {
        return (
            <div>
                <Table/>
                <Link to={'/people/create'}> Создать пользователя </Link>
            </div>
        )
    }
}
export default People
