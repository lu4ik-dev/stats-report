import { faClose } from '@fortawesome/free-solid-svg-icons';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import React, {useState} from 'react';

const Restore = () => {
    const [login, setLogin] = useState('');
    const [authResult, setAuthResult] = useState(null);
    const [loading, setLoading] = useState(false);
    const handleLoginPressButton = async () => {
    }
    return (
        <section className="vh-100 gradient-custom">
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
                      Авторизация неудалась <FontAwesomeIcon icon={faClose} size="xl" />
                    </div>
                  )}
  
                  <div>
                    <p className="mb-0">
                      <a href="/login" className="link-primary fw-bold link-underline link-underline-opacity-0">
                        Войти?
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
};

export default Restore;