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
        <section className="vh-100 gradient-custom">
        <div className="container py-5 h-100">
          <div className="row d-flex justify-content-center align-items-center h-100">
            <div className="col-12 col-md-8 col-lg-6 col-xl-5">
              <div className="card glass-effect text-primary" style={{ borderRadius: '1rem' }}>
                <div className="card-body p-5 text-center">
                  <div className="mb-md-1 mt-md-0 pb-0">
                    <h3 className="fw-bold text-primary mb-2 text-uppercase">Портал статистической отчетности</h3>
  
                    <div className="form-outline form-primary mb-4">
                      <input
                        type="email"
                        id="typeEmail"
                        className="form-control"
                        placeholder="Почта"
                      //  value={login}
                      //  onChange={(e) => setLogin(e.target.value)}
                      />
                    </div>

                    <div className="form-outline form-primary mb-4">
                      <input
                        type="text"
                        id="typeEmail"
                        className="form-control"
                        placeholder="Логин"
                      //  value={login}
                      //  onChange={(e) => setLogin(e.target.value)}
                      />
                    </div>

                    <div className="form-outline mt-3 form-primary mb-4">
                      <input
                        type="text"
                        id="typeEmail"
                        className="form-control"
                        placeholder="Фамилия"
                      //  value={login}
                      //  onChange={(e) => setLogin(e.target.value)}
                      />
                    </div>

                    
                    <div className="form-outline form-primary mb-4">
                      <input
                        type="text"
                        id="typeEmail"
                        className="form-control"
                        placeholder="Имя"
                      //  value={login}
                      //  onChange={(e) => setLogin(e.target.value)}
                      />
                    </div>
                   
                    <select
                    className="form-control"
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
                    className={`form-control mt-4 ${selectedRegion === "" ? "disabled" : ""}`}
                    id="citySelect"
                    disabled={selectedRegion === ""}
                  >
                    <option value="" selected disabled>Выберите город</option>
                    {cities.map(city => (
                      <option key={city.id} value={city.id}>{city.text}</option>
                    ))}
                  </select>

                    <select className="form-control mt-4" id="exampleFormControlSelect1">
                        <option selected disabled>Выберите организацию</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                    </select>
                 
                    <div className="form-outline form-primary mb-4 mt-3">
                      <input
                        type="password"
                        id="typeEmail"
                        className="form-control"
                        placeholder="Пароль"
                      //  value={login}
                      //  onChange={(e) => setLogin(e.target.value)}
                      />
                    </div>

                    <div className="form-outline form-primary mb-4">
                      <input
                        type="password"
                        id="typeEmail"
                        className="form-control"
                        placeholder="Подтверждение пароля"
                      //  value={login}
                      //  onChange={(e) => setLogin(e.target.value)}
                      />
                    </div>

                    <button
                    className="btn btn-outline-primary btn-lg me-2 px-5"
                    onClick={handleLoginPressButton}
                    disabled={loading}
                  >
                    {loading ? 'Вход...' : 'Войти'}
                  </button>

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