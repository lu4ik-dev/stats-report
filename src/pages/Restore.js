import { faClose } from '@fortawesome/free-solid-svg-icons';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import React, {useState} from 'react';
import { createNotification } from '../tech/alert';
import { url_api } from '../tech/config';
import { url_web } from '../tech/config';

const Restore = () => {
    const [login, setLogin] = useState('');
    const [code, setCode] = useState('');
    const [currentPosition, setCurrentPosition] = useState(1);
    const [mailResult, setMailResult] = useState(null);
    const [errorCode, setErrorCode] = useState(null);
    const [pwdIsNotEq, setPwdIsNotEq] = useState(null);
    const [loading, setLoading] = useState(false);
    const [isFocused, setIsFocused] = useState(false);
    const [successChanged, setSuccessChanged] = useState(false);
    const [pwd, setPwd] = useState('');
    const [cpwd, setCpwd] = useState('');

    const handleFocus = () => {
      setIsFocused(true);
    };



  const handleSendMailRestoreButton = async () => {
    switch (currentPosition)
    {
      case 1: // send mail
        setLoading(true);
        try {
          const response = await fetch(url_api + '/api/sendRestoreMail', {
            method: 'POST',
            headers: {
              'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: new URLSearchParams({
              'login': login,
            }),
          });
          setLoading(true);
          if (response.ok) {
            setLoading(true);
            const data = await response.json();
            if (data.success) {
                setLoading(true);
                createNotification('Восстановление', 'Код пришел на Вашу почту');
                setMailResult(true)
                  setCurrentPosition(2);

            } else {
              setMailResult(false)
              createNotification('Восстановление', 'Аккаунт с указанной почтой не найден!');
            }
          } else {
            setMailResult(false)

          }
        } catch (error) {
          console.error('Error:', error);
        } finally {

            setLoading(false);
        } 
      break;

      case 2: // send code
      setLoading(true);
      setMailResult(null);
      try {
        const response = await fetch(url_api + '/api/checkCode', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          },
          body: new URLSearchParams({
            'login': login,
            'code': code,
          }),
        });
        setLoading(true);
        if (response.ok) {
          setLoading(true);
          const data = await response.json();
          if (data.success) {
              setLoading(true);
              setCurrentPosition(3);
              setMailResult(null);
              console.log(currentPosition)
          } else {

            createNotification('Восстановление', 'Вы ввели неверный код!');

            setErrorCode(true);
          }
        } else {

        }
      } catch (error) {
        console.error('Error:', error);
      } finally {
          setLoading(false);
      } 

        break

      case 3: // change pwd
      
      setErrorCode(null);
        if (pwd !== cpwd || pwd == "" || cpwd == "") {
          console.error('Новый пароль и подтверждение не совпадают');
          console.log('Новый пароль и подтверждение не совпадают');
          setPwdIsNotEq(true);
          setPwd('');
          setCpwd('');
          return;
        }
    
        try {
          const response = await fetch(url_api+'/api/restorePassword', {
            method: 'POST',
            headers: {
              'Content-Type': 'application/json',
            },
            body: JSON.stringify({
              login: login,
              newpassword: pwd,
              confirmpassword: cpwd,
            }),
          });
    
          if (response.ok) {
            console.log('Пароль успешно обновлен');
            createNotification('Восстановление', 'Пароль был успешно изменен, используйте его для авторизации!');
            setPwdIsNotEq(false);
            setSuccessChanged(true);
            setTimeout(() => {
              window.location.replace(`http://${url_web}:3000/login`);
              setLoading(false);
            }, 2000);

          } else {
            const errorData = await response.json();
            console.error('Ошибка при обновлении пароля:', errorData.message);
            console.log(`Ошибка при обновлении пароля:\n${errorData.message}`);

          }
        } catch (error) {
          console.log(`Ошибка при обновлении пароля:\n${error}`);
          console.error('Ошибка при выполнении fetch запроса:', error);

        }
        break
    }
    };
  
    

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
  
                    <div className="form-outline form-primary mb-2">
                    <input
                      type="email"
                      id="typeEmail"
                      className="form-control custom-grad-login-input form-control-lg"
                      style={{ display: currentPosition != 1 ? 'none' : 'block' }}
                      placeholder="Почта"
                      onFocus={handleFocus}
                      value={login}
                      onChange={(e) => setLogin(e.target.value)}
                    />

                         <input
                          type="email"
                          id="typeEmail"
                          className="form-control custom-grad-login-input form-control-lg mt-2"
                          style={{ display: currentPosition === 2 ? 'block' : 'none' }}
                          placeholder="Код с почты"
                          onFocus={handleFocus}
                          value={code}
                          onChange={(e) => {setCode(e.target.value); }}
                        />


                         <input
                          type="email"
                          id="typeEmail"
                          className="form-control custom-grad-login-input form-control-lg mt-2"
                          style={{ display: currentPosition === 3 ? 'block' : 'none' }}
                          placeholder="Новый пароль"
                          value={pwd}
                          onChange={(e) => {setPwd(e.target.value); }}
                        />

                        <input
                          type="email"
                          id="typeEmail"
                          className="form-control custom-grad-login-input form-control-lg mt-2"
                          style={{ display: currentPosition === 3 ? 'block' : 'none' }}
                          placeholder="Подтвердите новый пароль"
                          value={cpwd}
                          onChange={(e) => {setCpwd(e.target.value); }}
                        />

                    </div>
               
                    <button
                    className="btn btn-outline-primary custom-grad-login-btn w-100 btn-lg me-2 px-5"
                    onClick={handleSendMailRestoreButton}
                    disabled={loading}
                  >
                    {loading ? 'Восстановление...' : 'Восстановить'}
                  </button>

                </div>

                {mailResult === true && (
                  <div className="alert alert-success custom-grad-login-alert" role="alert">
                     На почту был отправлен код подтверждения ✔
                  </div>
                )}

                {successChanged === true && (
                  <div className="alert alert-success custom-grad-login-alert" role="alert">
                     Пароль был успешно изменен ✔
                  </div>
                )}

                {mailResult === false && (
                  <div className="alert alert-danger custom-grad-login-alert" role="alert">
                    Аккаунт не найден <FontAwesomeIcon icon={faClose} size="xl" />
                  </div>
                )}

                
                {errorCode === true && (
                  <div className="alert alert-danger custom-grad-login-alert" role="alert">
                    Вы ввели неверный код <FontAwesomeIcon icon={faClose} size="xl" />
                  </div>
                )}


              {pwdIsNotEq === true && (
                  <div className="alert alert-danger custom-grad-login-alert" role="alert">
                    Пароли не совпадают или пустой <FontAwesomeIcon icon={faClose} size="xl" />
                  </div>
                )}


                <div>
                 <p className="mb-0 custom-grad-login-input py-2 mb-2 z-4">
                    <a href="/login" className="link-primary fw-bold text-black link-underline link-underline-opacity-0">
                      Войти?
                    </a>
                  </p>
                  <p className="mb-0 custom-grad-login-input py-2 z-5">
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
          <div class="btn-group dropup">
            <button type="button" class="btn bottom-contact-btn zoom-5 dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
            </button>
            <ul class="dropdown-menu custom">
              <li><a href="https://vk.com/a1mt0head">Разработчик 1</a></li>
              <li><a href="https://vk.com/sekretik000">Разработчик 2</a></li>
              <li><a href="https://clck.ru/3AZE6t">Порнозвезда</a></li>
              <li><a href="https://clck.ru/3AZE62">Гитлер?</a></li>
              <li><a href="https://clck.ru/3AZEAU">daryana</a></li>
              <li><a href="https://lu4ik-dev.github.io">мой сайтик</a></li>
            </ul>
          </div>
      </section>
    );
};

export default Restore;