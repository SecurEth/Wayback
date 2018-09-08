import React from 'react';
import ReactDOM from 'react-dom';
import { Router, Route } from 'react-router'
import { Drizzle } from "drizzle";
import { DrizzleContext, DrizzleProvider } from "drizzle-react";

import './ReactotronConfig'

// Layouts
import App from './App'
import { LoadingContainer } from 'drizzle-react-components'

import { history, store } from './store'
import drizzleOptions from './drizzleOptions'

// Setup the drizzle instance.
const drizzle = new Drizzle(drizzleOptions, store);

ReactDOM.render((
  <DrizzleProvider options={drizzleOptions}>
    <DrizzleContext.Provider drizzle={drizzle}>
      <LoadingContainer>
        <Router history={history} store={store}>
          <Route exact path="/" component={App} />
        </Router>
      </LoadingContainer>
    </DrizzleContext.Provider>
    </DrizzleProvider>
  ),
  document.getElementById('root')
);
