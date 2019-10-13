import React from 'react'
import {Link} from 'react-router-dom';
import axios from 'axios'

// Table for people with links
class Table extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            error: null,
            isLoaded: false,
            items: []
        };
    }

    handleClick = userId => {
        axios.delete('/api/v1/people/' + userId)
            .then((response) => {
                alert('Пользователь успешно удалён');
                this.componentDidMount();
            })
            .catch((error) => {
                alert(error);
            });
    };


    componentDidMount() {
        axios.get('/api/v1/people')
            .then((response) => {
                this.setState({
                    isLoaded: true,
                    items: response.data
                });
            })
            .catch((error) => {
                this.setState({
                    isLoaded: true,
                    error
                });
            });
    }

    render() {
        const {error, isLoaded, items} = this.state;
        if (error) {
            return <div>Error: {error.message}</div>;
        } else if (!isLoaded) {
            return <div>Loading...</div>;
        } else {
            return (
                <table>
                    <thead>
                    <tr>
                        <th> Имя</th>
                        <th> Фамилия</th>
                        <th> Отчество</th>
                        <th> ФИО</th>
                        <th> Пол</th>
                        <th> Действия</th>
                    </tr>
                    </thead>
                    <tbody>
                    {items.map(item => (
                        <tr key={item.id}>
                            <td>{item.first_name}</td>
                            <td>{item.last_name}</td>
                            <td>{item.middle_name}</td>
                            <td>{item.full_name}</td>
                            <td>{item.sex_name}</td>
                            <td>
                                <Link to={'/people/' + item.id}>Показать</Link>
                                <Link to={'/people/' + item.id + '/edit'}>Редактировать</Link>
                                <button onClick={() => { this.handleClick(item.id) }}>Удалить</button>
                            </td>
                        </tr>
                    ))}
                    </tbody>
                </table>
            );
        }
    }
}

export default Table
