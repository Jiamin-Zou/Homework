import { Route, Switch } from "react-router-dom";

import Navbar from "./components/Navbar.js";

// import FunctionTitan from "./components/functionComponents/FunctionTitan.js";
// import FunctionKuiper from "./components/functionComponents/FunctionKuiper.js";
import ClassTitan from "./components/classComponents/ClassTitan.js";
import Kuiper from "./components/classComponents/ClassKuiper.js";

const App = () => {
  return (
    <div className="main-container">
      <Navbar />
      <Switch>
        <Route exact path="/">
          <div className="welcome">
            <h1>Welcome! Choose Which Cat You Want to Play With</h1>
          </div>
        </Route>
        <Route path="/titan">
          <ClassTitan />
        </Route>
        <Route path="/kuiper">
          <Kuiper />
        </Route>
      </Switch>
    </div>
  );
};

export default App;
