import React from 'react'
import {Link} from "react-router-dom";
import {Formik, Field} from "formik";
import axios from "axios";

class PersonCreate extends React.Component {

    submitForm = (values, _) => {
        axios.post('/api/v1/people', {
            person: {
                first_name: values.first_name,
                last_name: values.last_name,
                middle_name: values.middle_name,
                sex: values.sex || null
            }
        })
            .then((response) => {
                alert(`Пользователь ${response.data.full_name} успешно создан`);
            })
            .catch((error) => {
                alert(
                    'Здесь должна происходить корректная обработка ошибок с бэка:\n' +
                    JSON.stringify(error.response.data, null, 2)
                );
            });
    };

    render() {
        return (
            <div>
                <h1>Создание пользователя</h1>
                <Formik
                    initialValues={{ first_name: 'Ивааан' }}
                    onSubmit={(values, actions) => {this.submitForm(values, actions)}}
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
                            <button type="submit">Создать</button>
                        </form>
                    )}
                />
                <Link to='/'> 🡐 на главную </Link>
            </div>
        )
    }
}
export default PersonCreate
