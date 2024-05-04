import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faClose, faEye, faEyeSlash } from '@fortawesome/free-solid-svg-icons';
import React, { useState, useEffect } from 'react';
import { url_api, url_web } from '../tech/config';
function Login() {
  const [login, setLogin] = useState('');
  const [password, setPassword] = useState('');
  const [authResult, setAuthResult] = useState(null);
  const [loading, setLoading] = useState(false);
  const [passwordVisible, setPasswordVisible] = useState(false);

  
  useEffect(() => {
    if (sessionStorage.getItem('authIs') === 'true') {
      window.location.replace(`http://${url_web}:3000/`);
    }
  }, []);

  const handleLoginPressButton = async () => {
    try {
      setLoading(true);
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
      if (response.ok) {
        const data = await response.json();
        if (data.success) {
            setAuthResult(true);
          setTimeout(() => {
            sessionStorage.setItem('authIs', 'true');
            sessionStorage.setItem('auth', data.authkey);
            sessionStorage.setItem('userInfo', JSON.stringify(data));
            window.location.replace(`http://${url_web}:3000/`);
          }, 1000);

        } else {
          setAuthResult(false);
        }
      } else {
        setAuthResult(false);
      }
    } catch (error) {
      console.error('Error:', error);
      setAuthResult(false);
    } finally {
      setLoading(false);
    }
  };

  return (
    <section className="vh-100 gradient-custom pt-5">
     <div className="container py-5 h-100">
        <div className="row d-flex justify-content-center align-items-center h-100">
          <div className="col-12 col-md-8 col-lg-6 col-xl-5">
            <div className="card glass-effect text-primary" style={{ borderRadius: '1rem' }}>
              <div className="card-body p-5 text-center">
                <div className="mb-md-5 mt-md-4 pb-1">
                  <h2 className="fw-bold text-primary mb-2 text-uppercase">Портал статистической отчетности</h2>

                  <div className="form-outline form-primary mb-4">
                    <input
                      type="email"
                      id="typeEmail"
                      className="form-control form-control-lg"
                      placeholder="Логин"
                      value={login}
                      onChange={(e) => setLogin(e.target.value)}
                    />
                  </div>
                  <div className="form-outline form-primary mb-4">
                    <div className="input-group">
                      <input
                        type={passwordVisible ? 'text' : 'password'}
                        id="typePassword"
                        className="form-control form-control-lg"
                        placeholder="Пароль"
                        value={password}
                        onChange={(e) => setPassword(e.target.value)}
                      />
                     
                    </div>
                  </div>
                  <button
                    className="btn btn-outline-primary btn-lg me-2 px-5"
                    onClick={handleLoginPressButton}
                    disabled={loading}
                  >
                    {loading ? 'Вход...' : 'Войти'}
                  </button>
                </div>

                {authResult === true && (
                  <div className="alert alert-success" role="alert">
                    Успешно
                  </div>
                )}

                {authResult === false && (
                  <div className="alert alert-danger" role="alert">
                    Авторизация не удалась <FontAwesomeIcon icon={faClose} size="xl" />
                  </div>
                )}

                <div>
                  <p className="mb-0">
                    <a href="/restore-password" className="link-primary fw-bold link-underline link-underline-opacity-0">
                      Забыли пароль?
                    </a>
                  </p>
                  <p className="mb-0">
                    <a href="/registration" className="link-primary fw-bold link-underline link-underline-opacity-0">
                      Зарегистрироваться?
                    </a>
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
  </section>
  );
}

export default Login;