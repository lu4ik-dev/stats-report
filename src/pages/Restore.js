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
        <section className="vh-100 custom-body add-font-arturito-slab">
        <div className="container py-2 h-100">
          <div className="row d-flex justify-content-center align-items-center h-100">
            <div className="col-12 col-md-8 col-lg-6 col-xl-5">
            <div className="card  text-primary" style={{ borderRadius: '1rem', backgroundColor: '#00000000', borderColor: '#0000'}}> {/*   glass-effect */}
                <div className="card-body p-5 text-center">
                  <div className="mb-md-5 mt-md-4 pb-1">
                  <h2 className="fw-bold text-white mb-4 text-uppercase custom-text-logo"><span>Портал</span> <span>статистической</span> <span>отчетности</span></h2>
                  <h3 className="fw-bold text-white mb-4 text-uppercase custom-text-logo">Восстановление пароля</h3>
  
                    <div className="form-outline form-primary mb-4">
                      <input
                        type="email"
                        id="typeEmail"
                        className="form-control custom-grad-login-input form-control-lg"
                        placeholder="Почта"
                        value={login}
                        onChange={(e) => setLogin(e.target.value)}
                      />
                    </div>
               
                    <button
                    className="btn btn-outline-primary custom-grad-login-btn w-100 btn-lg me-2 px-5"
                    onClick={handleLoginPressButton}
                    disabled={loading}
                  >
                    {loading ? 'Восстановление...' : 'Восстановить'}
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
                    <a href="/login" className="link-primary fw-bold text-black link-underline link-underline-opacity-0">
                      Войти?
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
      </section>
    );
};

export default Restore;