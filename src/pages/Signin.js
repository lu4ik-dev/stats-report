import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faClose, faEye, faEyeSlash } from '@fortawesome/free-solid-svg-icons';
import React, {useEffect, useState} from 'react';
import { url_api, url_web } from '../tech/config';


const Signin = () => {
  const [authResult, setAuthResult] = useState(null);
  const [loading, setLoading] = useState(false);

  const [regions, setRegions] = useState([]);
  const [cities, setCities] = useState([]);
  const [selectedRegion, setSelectedRegion] = useState("");

    useEffect(() => {
        if (sessionStorage.getItem('authIs') === 'true') {
          window.location.replace('http://'+url_web+':3000/');
        } 

        fetch(url_api + '/api/get/regions')
        .then(response => response.json())
        .then(data => setRegions(data))
        .catch(error => console.error('Ошибка при загрузке регионов:', error));

      }, []);
      


      const handleRegionChange = (event) => {
        const selectedRegionId = event.target.value;
        setSelectedRegion(selectedRegionId);

        fetch(`${url_api}/api/get/cities/${selectedRegionId}`)
        .then(response => response.json())
        .then(data => setCities(data))
        .catch(error => console.error('Ошибка при загрузке городов:', error));
      };


      console.log(regions)

  const handleLoginPressButton = async () => {}

    return (
        <section className="vh-100 custom-body add-font-arturito-slab">
        <div className="container  h-100">
          <div className="row d-flex justify-content-center align-items-center h-100">
            <div className="col-12 col-md-8 col-lg-6 col-xl-5">
              <div className="card text-primary" style={{ borderRadius: '1rem', backgroundColor: '#00000000', borderColor: '#0000'}}>
                <div className="card-body p-5 text-center">
                  <div className="mb-md-1 mt-md-0 pb-0">
                  <h2 className="fw-bold text-white mb-4 text-uppercase"><span style={{fontSize: '4.8rem'}}>Портал</span> статистической <span style={{fontSize: '2.8rem'}}>отчетности</span></h2>

                    <div className="form-outline form-primary mb-2">
                      <input
                        type="email"
                        id="typeEmail"
                        className="form-control custom-grad-login-input"
                        placeholder="Почта"
                      //  value={login}
                      //  onChange={(e) => setLogin(e.target.value)}
                      />
                    </div>

                    <div className="form-outline form-primary mb-2">
                      <input
                        type="text"
                        id="typeEmail"
                        className="form-control custom-grad-login-input"
                        placeholder="Логин"
                      //  value={login}
                      //  onChange={(e) => setLogin(e.target.value)}
                      />
                    </div>

                    <div className="form-outline mt-2 form-primary mb-2">
                      <input
                        type="text"
                        id="typeEmail"
                        className="form-control custom-grad-login-input"
                        placeholder="Фамилия"
                      //  value={login}
                      //  onChange={(e) => setLogin(e.target.value)}
                      />
                    </div>

                    
                    <div className="form-outline form-primary mb-2">
                      <input
                        type="text"
                        id="typeEmail"
                        className="form-control custom-grad-login-input"
                        placeholder="Имя"
                      //  value={login}
                      //  onChange={(e) => setLogin(e.target.value)}
                      />
                    </div>
                   
                    <select
                    className="form-control custom-grad-login-input"
                    id="regionSelect"
                    onChange={handleRegionChange}
                    value={selectedRegion}
                  >
                    <option value="" selected disabled>Выберите область</option>
                    {regions.map(region => (
                      <option key={region.id} value={region.id}>{region.text}</option>
                    ))}
                  </select>

                  <select
                    className={`form-control custom-grad-login-input mt-2 ${selectedRegion === "" ? "disabled" : ""}`}
                    id="citySelect"
                    disabled={selectedRegion === ""}
                  >
                    <option value="" selected disabled>Выберите город</option>
                    {cities.map(city => (
                      <option key={city.id} value={city.id}>{city.text}</option>
                    ))}
                  </select>

                    <select className="form-control mt-2 custom-grad-login-input" id="exampleFormControlSelect1">
                        <option selected disabled>Выберите организацию</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                    </select>
                 
                    <div className="form-outline form-primary mb-2 mt-2">
                      <input
                        type="password"
                        id="typeEmail"
                        className="form-control custom-grad-login-input"
                        placeholder="Пароль"
                      //  value={login}
                      //  onChange={(e) => setLogin(e.target.value)}
                      />
                    </div>

                    <div className="form-outline form-primary mb-4">
                      <input
                        type="password"
                        id="typeEmail"
                        className="form-control custom-grad-login-input"
                        placeholder="Подтверждение пароля"
                      //  value={login}
                      //  onChange={(e) => setLogin(e.target.value)}
                      />
                    </div>

                    <button
                    className="btn btn-outline-primary custom-grad-login-btn w-100 btn-lg me-2 px-5"
                    onClick={handleLoginPressButton}
                    disabled={loading}
                  >
                    {loading ? 'Вход...' : 'Войти'}
                  </button>

                  {authResult === true && (
                    <div className="alert alert-success custom-grad-login-alert" role="alert">
                      Успешно
                    </div>
                  )}
  
                  {authResult === false && (
                    <div className="alert alert-danger custom-grad-login-alert" role="alert">
                      Авторизация неудалась <FontAwesomeIcon icon={faClose} size="xl" />
                    </div>
                  )}
  
                  <div>
                   
                    <p className="mb-0 mt-2 custom-grad-login-input py-2">
                      <a href="/login" className="link-primary text-black fw-bold link-underline link-underline-opacity-0">
                        Уже есть аккаунт?
                      </a>
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          </div>
        </div>
      </section>
    );
};

export default Signin;