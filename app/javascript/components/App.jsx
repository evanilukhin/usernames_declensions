import React from 'react'
import {
    BrowserRouter as Router,
    Switch,
    Route,
    Link
} from "react-router-dom";

import People from "./People";
import Person from "./Person";
import PersonEdit from "./PersonEdit";
import PersonCreate from "./PersonCreate";

export default function App() {
    return (
        <Router>
            <Switch>
                <Route path="/people/:id/edit" component={PersonEdit}/>
                <Route path="/people/create" component={PersonCreate}/>
                <Route path="/people/:id" component={Person}/>
                <Route path="/" component={People}/>
            </Switch>
        </Router>
    )
}
