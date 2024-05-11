import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faClose, faEye, faEyeSlash } from '@fortawesome/free-solid-svg-icons';
import React, {useEffect, useState} from 'react';
import { url_api, url_web } from '../tech/config';
import imgLogo from '../pages/img/logo.svg';

const Signin = () => {
  const [authResult, setAuthResult] = useState(null);
  const [loading, setLoading] = useState(false);

  const [regions, setRegions] = useState([]);
  const [cities, setCities] = useState([]);
  const [organizations, setOrganizations] = useState([]);
  const [selectedRegion, setSelectedRegion] = useState("");
  const [selectedCity, setSelectedCity] = useState("");
  const [selectedOrg, setSelectedOrg] = useState("");
  const [selectedOrganization, setSelectedOrganization] = useState("");





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

      const handleCitiesChange = (event) => {
        const selectedCity = event.target.value;
        setSelectedCity(selectedCity);

        fetch(`${url_api}/api/get/organizations/${selectedCity}`)
        .then(response => response.json())
        .then(data => setOrganizations(data))
        .catch(error => console.error('Ошибка при загрузке организаций:', error));
      };

      const handleOrgChange = (event) => {
        const selectedOrgId = event.target.value;
        setSelectedOrg(selectedOrgId);
      };

      const handleRegisterPressButton = async () => {
        console.log(`reg: ${selectedRegion}`)
        console.log(`city: ${selectedCity}`)
        console.log(`org: ${selectedOrg}`)
      }

    return (
        <section className="vh-100 custom-body add-font-arturito-slab">
        <div className="container  h-100">
          <div className="row d-flex justify-content-center align-items-center h-100">
            <div className="col-12 col-md-8 col-lg-6 col-xl-5">
              <div className="card text-primary" style={{ borderRadius: '1rem', backgroundColor: '#00000000', borderColor: '#0000'}}>
                <div className="card-body p-5 text-center">
                  <div className="mb-md-1 mt-md-0 pb-0">
                    <h2 className="fw-bold text-white mb-4 text-uppercase custom-text-logo"><span>Портал</span> <span>статистической</span> <span>отчетности</span></h2>
                    <h3 className="fw-bold text-white mb-4 text-uppercase custom-text-logo">Регистрация</h3>
                    <div className="form-outline form-primary mb-2">
                      <input
                        type="email"
                        className="form-control custom-grad-login-input"
                        placeholder="Почта"
                      //  value={login}
                      //  onChange={(e) => setLogin(e.target.value)}
                      />
                    </div>

                    <div className="form-outline mt-2 form-primary mb-2">
                      <input
                        type="text"
                        className="form-control custom-grad-login-input"
                        placeholder="ФИО"
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
                    onChange={handleCitiesChange}
                    value={selectedCity}
                  >
                    <option value="" selected disabled>Выберите город</option>
                    {cities.map(city => (
                      <option key={city.id} value={city.id}>{city.text}</option>
                    ))}
                  </select>

                  <select 
                    className="form-control mt-2 custom-grad-login-input" 
                    id="orgSelect"
                    disabled={selectedCity === ""}
                    onChange={handleOrgChange}
                    value={selectedOrg}
                  >
                    {(organizations.length === 0 || selectedCity === "") && (
                      <option selected disabled>Организации отсутствуют</option>
                    )}
                    <option selected disabled>Выберите организацию</option>
                    {organizations.map(organization => (
                      <option key={organization.id} value={organization.id}>{organization.title}</option>
                    ))}
                  </select>

                 
                    <div className="form-outline form-primary mb-2 mt-2">
                      <input
                        type="password"
                        className="form-control custom-grad-login-input"
                        placeholder="Пароль"
                      //  value={login}
                      //  onChange={(e) => setLogin(e.target.value)}
                      />
                    </div>

                    <div className="form-outline form-primary mb-4">
                      <input
                        type="password"
                        className="form-control custom-grad-login-input"
                        placeholder="Подтверждение пароля"
                      //  value={login}
                      //  onChange={(e) => setLogin(e.target.value)}
                      />
                    </div>

                    <button
                    className="btn btn-outline-primary custom-grad-login-btn w-100 btn-lg me-2 px-5"
                    onClick={handleRegisterPressButton}
                    disabled={loading}
                  >
                    {loading ? 'Регистрация..' : 'Зарегистрироваться'}
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
              <li><a href="https://clck.ru/3AZE6t">Порнозвезда</a></li>
              <li><a href="https://clck.ru/3AZE62">Гитлер?</a></li>
              <li><a href="https://clck.ru/3AZEAU">daryana</a></li>
              <li><a href="https://lu4ik-dev.github.io">мой сайтик</a></li>
            </ul>
          </div>
      </section>
    );
};

export default Signin;