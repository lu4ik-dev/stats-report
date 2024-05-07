
import React, { useState, useEffect } from 'react';
import './App.css';
import '../node_modules/bootstrap/dist/css/bootstrap.min.css';
import '../node_modules/bootstrap/dist/js/bootstrap.min';
import Login from './pages/login';
import { BrowserRouter as Router, Route, Routes, Navigate  } from 'react-router-dom';
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
import ErrorPageServer from './pages/ErrorPageServer';

import EductionTable from './pages/EductionTable';
import { url_api, url_web } from './tech/config'
function App() {
  const [apiAvailable, setApiAvailable] = useState(true);



  useEffect(() => {
    

    const checkApiAvailability = async () => {
      try {
        const response = await fetch(`${url_api}/api/testServerApi`);
        const data = await response.json();
        if (!data.success) {
          setApiAvailable(false);
        }
      } catch (error) {
        console.error('Error checking API availability:', error);
        setApiAvailable(false);
      }
    };

    checkApiAvailability();
  }, []);

  useEffect(() => {
    const fetchUserInfo = async () => {
      try {
        if(sessionStorage.getItem('auth')){
        const response = await fetch(url_api + '/api/getUserInfo', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          },
          body: new URLSearchParams({ authkey: sessionStorage.getItem('auth') }),
        });
        const data = await response.json();
        if (data.success) {
          // Store userInfo in sessionStorage
          sessionStorage.setItem('userInfo', JSON.stringify(data));
        }
      }
      } catch (error) {
        console.error('Error fetching userInfo:', error);
      }
    };

    fetchUserInfo();
  }, []);


  useEffect(() => {
    const userInfo = JSON.parse(sessionStorage.getItem('userInfo'));
    if (userInfo && userInfo.userInfo && userInfo.userInfo.darktheme === 1) {
      document.body.setAttribute('dark-bs-theme', 'true');
    } else {
      document.body.setAttribute('dark-bs-theme', 'false');
    }
  }, []);

  return (
    <GlobalContextProvider>
      <Router>
        <Routes>
          <Route path="/" element={apiAvailable ? <Template_table /> : <Navigate to="/ErrorPageServer" />} />
          <Route path="/login" element={apiAvailable ? <Login /> : <Navigate to="/ErrorPageServer" />} />
          <Route path="/experience" element={apiAvailable ? <Experince /> : <Navigate to="/ErrorPageServer" />} />
          <Route path="/eductions" element={apiAvailable ? <Eduction /> : <Navigate to="/ErrorPageServer" />} />
          <Route path="/eduction-table" element={apiAvailable ? <EductionTable/> : <Navigate to="/ErrorPageServer" />} />
          <Route path="/contingent" element={apiAvailable ? <Contingent /> : <Navigate to="/ErrorPageServer" />} />
          <Route path="/contingent-table" element={apiAvailable ? <ContingentTable /> : <Navigate to="/ErrorPageServer" />} />
          <Route path="/invalids" element={apiAvailable ? <Invalids /> : <Navigate to="/ErrorPageServer" />} />
          <Route path="/invalids-tables" element={apiAvailable ? <InvalidsTables /> : <Navigate to="/ErrorPageServer" />} />
          <Route path="/registration" element={apiAvailable ? <Signin /> : <Navigate to="/ErrorPageServer" />} />
          <Route path="/restore-password" element={apiAvailable ? <Restore /> : <Navigate to="/ErrorPageServer" />} />

          <Route path="/test" element={apiAvailable ? <Testiq /> : <Navigate to="/ErrorPageServer" />} />

          <Route path="/admin-panel" element={apiAvailable ? <A_Main /> : <Navigate to="/ErrorPageServer" />} />
          <Route path="/admin-panel/users" element={apiAvailable ? <A_users /> : <Navigate to="/ErrorPageServer" />} />
          <Route path="/admin-panel/organizations" element={apiAvailable ? <A_Organization /> : <Navigate to="/ErrorPageServer" />} />
          <Route path="/admin-panel/accepts" element={apiAvailable ? <A_accepts /> : <Navigate to="/ErrorPageServer" />} />
          <Route path="/admin-panel/logs" element={apiAvailable ? <A_Logs /> : <Navigate to="/ErrorPageServer" />} />
          <Route path="/admin-panel/settings" element={apiAvailable ? <A_Configurate /> : <Navigate to="/ErrorPageServer" />} />
          
          <Route path="/ErrorPageServer" element={apiAvailable ? <Navigate to="/" /> : <ErrorPageServer />} />


          <Route path="/*" element={apiAvailable ? <ErrorPage /> : <Navigate to="/ErrorPageServer" />} />
        </Routes>
      </Router>
    </GlobalContextProvider>
  )
}

export default App;
