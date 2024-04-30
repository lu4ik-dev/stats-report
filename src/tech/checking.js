import {url_api, url_web} from './config'
export const isAuthenticated = () => {
    return sessionStorage.getItem('authIs') && sessionStorage.getItem('authIs') === 'true';
  };
  
  export const redirectToLogin = () => {
    if (!isAuthenticated()) {
      window.location.replace('http://'+url_web+':3000/login');
    }
  };
  
  export const redirectToDashboard = () => {
    if (isAuthenticated()) {
      window.location.replace('http://'+url_web+':3000/');
    }
  };
  
  export const logout = () => {
    sessionStorage.removeItem('authIs');
    sessionStorage.removeItem('auth');
    sessionStorage.removeItem('userInfo');
    window.location.replace('http://'+url_web+':3000/login');
  };


  export const checkAdmin = async (authKey) => {

      const response = await fetch(url_api+'/api/checkAdmin', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: new URLSearchParams({ authkey: authKey }),
      });
  
      if (!response.ok) {
        throw new Error('Ошибка при запросе');
      }
  
      const result = await response.json(); 
      return result.isAdmin;
  };
  