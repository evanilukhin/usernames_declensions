import React from 'react'
import {Link} from "react-router-dom";
import {Formik, Field} from "formik";
import axios from "axios";

class PersonEdit extends React.Component {
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
            })
            .catch((error) => {
                this.setState({
                    isLoaded: true,
                    error
                });
            });
    }

    submitForm = (values, _) => {
        axios.patch(`/api/v1/people/${this.state.person.id}`, {
            person: {
                first_name: values.first_name,
                last_name: values.last_name,
                middle_name: values.middle_name,
                sex: values.sex || null
            }
        })
            .then((response) => {
                alert(`Пользователь ${response.data.full_name} успешно обновлён`);
            })
            .catch((error) => {
                alert(
                    'Здесь должна происходить корректная обработка ошибок с бэка:\n' +
                    JSON.stringify(error.response.data, null, 2)
                );
            });
    };

    render() {
        const {error, isLoaded, person} = this.state;
        if (error) {
            return <div>Error: {error.message}</div>;
        } else if (!isLoaded) {
            return <div>Loading...</div>;
        } else {
            return (
                <div>
                    <h1>Изменение пользователя</h1>
                    <Formik
                        initialValues={
                            {
                                first_name: person.first_name,
                                middle_name: person.middle_name,
                                last_name: person.last_name,
                                sex: person.sex
                            }
                        }
                        onSubmit={(values, actions) => {
                            this.submitForm(values, actions)
                        }}
                        render={props => (
                            <form onSubmit={props.handleSubmit}>
                                <label htmlFor="first_name"> Имя </label>
                                <Field name="first_name" placeholder="Имя(обязательное поле)"/>
                                <label htmlFor="last_name"> Фамилия </label>
                                <Field name="last_name"/>
                                <label htmlFor="middle_name"> Отчество </label>
                                <Field name="middle_name"/>
                                <label htmlFor="sex"> Пол </label>
                                <Field name="sex" component="select" defaultValue=''>
                                    <option value=''>Не задан</option>
                                    <option value="male">Мужской</option>
                                    <option value="female">Женский</option>
                                </Field>
                                <button type="submit">Обновить</button>
                            </form>
                        )}
                    />
                    <Link to='/'> 🡐 на главную </Link>
                </div>
            )
        }
    }
}

export default PersonEdit
