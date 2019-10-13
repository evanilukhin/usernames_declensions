import React from 'react'
import axios from "axios";
import {Link} from "react-router-dom";

class Person extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            error: null,
            isLoaded: false,
            person: null
        };
    }

    componentDidMount() {
        const {match: {params}} = this.props;
        axios.get(`/api/v1/people/${params.id}`)
            .then((response) => {
                this.setState({
                    isLoaded: true,
                    person: response.data
                });
                console.log(response);
            })
            .catch((error) => {
                console.log(error);
                this.setState({
                    isLoaded: true,
                    error
                });
            });
    }

    render() {
        const {error, isLoaded, person} = this.state;
        if (error) {
            return <div>Error: {error.message}</div>;
        } else if (!isLoaded) {
            return <div>Loading...</div>;
        } else {
            return (
                <div>
                    <div> <b> Пользователь: </b> {person.full_name} </div>
                    <div> <b> Пол: </b> {person.sex} </div>
                    <table>
                        <thead>
                            <tr>
                                <th> Имя</th>
                                <th> Фамилия</th>
                                <th> Отчество</th>
                                <th> ФИО</th>
                                <th> Падеж </th>
                            </tr>
                        </thead>
                        <tbody>
                        {person.declensions.map(declension => (
                            <tr key={declension.name_case}>
                                <td>{declension.first_name}</td>
                                <td>{declension.last_name}</td>
                                <td>{declension.middle_name}</td>
                                <td>{declension.full_name}</td>
                                <td>{declension.name_case}</td>
                            </tr>
                        ))}
                        </tbody>
                    </table>
                    <Link to='/'> 🡐 назад </Link>
                </div>
            );
        }
    }
}

export default Person
