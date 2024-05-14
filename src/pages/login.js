import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faClose, faEye, faEyeSlash } from '@fortawesome/free-solid-svg-icons';
import React, { useState, useEffect } from 'react';
import { url_api, url_web } from '../tech/config';
import { createNotification } from '../tech/alert';
import { useLocation } from 'react-router-dom';

function Login() {
  const [login, setLogin] = useState('');
  const [password, setPassword] = useState('');
  const [authResult, setAuthResult] = useState(null);
  const [loading, setLoading] = useState(false);
  const [passwordVisible, setPasswordVisible] = useState(false);


  
  useEffect(() => {
    document.body.style.overflow = 'hidden';

    return () => {
      document.body.style.overflow = '';
    };
  }, []);




  
  useEffect(() => {
    if (sessionStorage.getItem('authIs') === 'true') {
      window.location.replace(`http://${url_web}:3000/`);
    }
  }, []);

  const handleLoginPressButton = async () => {
    setLoading(true);
    try {
      const response = await fetch(url_api + '/api/login', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: new URLSearchParams({
          'userName': login,
          'password': password,
        }),
      });
      setLoading(true);
      if (response.ok) {
        setLoading(true);
        const data = await response.json();
        if (data.success) {
            setLoading(true);
            setAuthResult(true);
          setTimeout(() => {
            sessionStorage.setItem('authIs', 'true');
            sessionStorage.setItem('auth', data.authkey);
            sessionStorage.setItem('userInfo', JSON.stringify(data));
            createNotification('Авторизация', 'Вы успешно авторизовались на сайте');
            window.location.replace(`http://${url_web}:3000/`);
            setLoading(false);
          }, 1000);

        } else {
          
          createNotification('Авторизация', 'Вы ввели неверные данные для авторизации');
          setAuthResult(false);
        }
      } else {
        setAuthResult(false);
      }
    } catch (error) {
      console.error('Error:', error);
      setAuthResult(false);
    } finally {
      setTimeout(() => {
      setLoading(false);
    }, 1000);
    }
  };


  return (
    <section className="vh-100 custom-body  add-font-arturito-slab">
      
     <div className="container py-5 h-100">
      
        <div className="row d-flex justify-content-center align-items-center h-100">
          <div className="col-12 col-md-8 col-lg-6 col-xl-5">
            <div className="card  text-primary" style={{ borderRadius: '1rem', backgroundColor: '#00000000', borderColor: '#0000'}}> {/*   glass-effect */}
              <div className="card-body p-5 text-center">
                <div className="mb-md-5 mt-md-4 pb-1">
                  <h2 className="fw-bold text-white mb-4 text-uppercase custom-text-logo"><span>Портал</span> <span>статистической</span> <span>отчетности</span></h2>

                  <div className="form-outline form-primary mb-2">
                    <input
                      type="email"
                      id="typeEmail"
                      className="form-control custom-grad-login-input form-control-lg"
                      placeholder="Почта"
                      value={login}
                      onChange={(e) => setLogin(e.target.value)}
                    />
                  </div>
                  <div className="form-outline  form-primary mb-2">
                    <div className="input-group">
                      <input
                        type={passwordVisible ? 'text' : 'password'}
                        id="typePassword"
                        className="form-control custom-grad-login-input form-control-lg"
                        placeholder="Пароль"
                        value={password}
                        onChange={(e) => setPassword(e.target.value)}
                      />
                     
                    </div>
                  </div>
                  <button
                    className="btn btn-outline-primary custom-grad-login-btn w-100 btn-lg me-2 px-5"
                    onClick={handleLoginPressButton}
                    disabled={loading}
                  >
                    {loading ? 'Вход...' : 'Войти'}
                  </button>

                </div>

                {authResult === true && (
                  <div className="alert alert-success custom-grad-login-alert" role="alert">
                    Авторизация прошла успешно ✔
                  </div>
                )}

                {authResult === false && (
                  <div className="alert alert-danger custom-grad-login-alert" role="alert">
                    Авторизация не удалась <FontAwesomeIcon icon={faClose} size="xl" />
                  </div>
                )}
                <div>
                 <p className="mb-0 custom-grad-login-input py-2 mb-2">
                    <a href="/restore-password" className="link-primary fw-bold text-black link-underline link-underline-opacity-0">
                      Забыли пароль?
                    </a>
                  </p>
                  <p className="mb-0 custom-grad-login-input py-2">
                    <a href="/registration" className="link-primary fw-bold text-black link-underline link-underline-opacity-0">
                      Зарегистрироваться?
                    </a>
                  </p>
                </div>
              </div>
            </div>
          </div>
          
        </div>
        
      </div>
      
      <div className="area" >
            <ul className="circles">
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
            </ul>
    </div >
    <div class="btn-group dropup">
            <button type="button" class="btn bottom-contact-btn zoom-5 dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
            </button>
            <ul class="dropdown-menu custom">
              <li><a href="https://vk.com/a1mt0head">Разработчик 1</a></li>
              <li><a href="https://vk.com/sekretik000">Разработчик 2</a></li>
            </ul>
          </div>
  </section>
  );
}

export default Login;