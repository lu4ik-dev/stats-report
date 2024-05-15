import {url_api, url_web} from './config'
export const isAuthenticated = () => {
  return localStorage.getItem('authIs') && localStorage.getItem('authIs') === 'true';
};


export const isVerify = () => {
  return localStorage.getItem('authIs') && localStorage.getItem('verify') === '1';
};



  export const redirectToLogin = () => {
    if (!isAuthenticated()) {
      window.location.replace('http://'+url_web+':3000/login');
    }
  };
  
  export const redirectToVerify = () => {
    if (!isVerify()) {
      window.location.replace('http://'+url_web+':3000/inverify');
    }
  };
  

  export const redirectToDashboard = () => {
    if (isAuthenticated()) {
      window.location.replace('http://'+url_web+':3000/');
    }
  };
  
  export const logout = () => {
    localStorage.removeItem('authIs');
    localStorage.removeItem('verify');
    localStorage.removeItem('auth');
    localStorage.removeItem('userInfo');
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
  