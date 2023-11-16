import './App.css';
import '../node_modules/bootstrap/dist/css/bootstrap.min.css';
import '../node_modules/bootstrap/dist/js/bootstrap.min';
import Login from './pages/login';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import Template_table from './pages/template_table';
import { GlobalContextProvider } from './context/context';
import Experince from './pages/Experince';
import Invalids from './pages/Invalids';
import Eduction from './pages/Eduction';
import Contingent from './pages/Contingent';
import ErrorPage from './pages/error-page';
import A_Main from './pages/admin/A_Main';
import A_users from './pages/admin/A_Users';
import A_accepts from './pages/admin/A_accepts';
import A_Logs from './pages/admin/A_Logs';
import A_Configurate from './pages/admin/A_Configurate';
import Signin from './pages/Signin'
import Restore from './pages/Restore';
import A_Organization from './pages/admin/A_Organization';
import Testiq from './pages/test';
import ContingentTable from './pages/ContingentTable';
import InvalidsTables from './pages/InvalidsTables';
function App() {
  return (
    <GlobalContextProvider>
      <Router>
          <Routes>
            <Route path="/" exact element={<Template_table/>}/>
            <Route path="/login" exact element={<Login/>} />
            <Route path="/experience" exact element={<Experince/>} />
            <Route path="/eductions" exact element={<Eduction/>} />

            <Route path="/contingent" exact element={<Contingent/>} />
            <Route path="/contingent-table" exact element={<ContingentTable/>} />

            <Route path="/invalids" exact  element={<Invalids/>} />
            <Route path="/invalids-tables" exact element={<InvalidsTables/>} />

            <Route path="/registration" exact element={<Signin/>} />
            <Route path="/restore-password" exact element={<Restore/>} />


            <Route path="/test" exact element={<Testiq/>} />

            <Route path="/admin-panel" exact element={<A_Main/>} />
            <Route path="/admin-panel/users" element={<A_users />} />
            <Route path="/admin-panel/organizations" element={<A_Organization />} />
            <Route path="/admin-panel/accepts" element={<A_accepts />} />
            <Route path="/admin-panel/logs" element={<A_Logs />} />
            <Route path="/admin-panel/settings" element={<A_Configurate />} />

            <Route path="/*" element={<ErrorPage />} />
          </Routes>
      </Router>
    </GlobalContextProvider>
  )
}

export default App;
