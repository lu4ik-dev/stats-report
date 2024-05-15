import React, { useState } from 'react';
import { redirectToLogin } from '../../tech/checking';
import Header from '../Header';
const A_accepts = () => {
    const [cities, setCities] = useState([]);
    const [selectedCity, setSelectedCity] = useState(null);
    const [newCityText, setNewCityText] = useState('');
    const [showModal, setShowModal] = useState(false);
    const [regions, setRegions] = useState([]);
    const [selectedRegion, setSelectedRegion] = useState('notSelected');

    redirectToLogin();

    const handleEditCity = (city) => {
        setSelectedCity(city);
        setNewCityText(city.text);
    };

    const handleAddCity = (city) => {
        setSelectedCity(city);
        setNewCityText(city.text);
    };

    const handleCancelEdit = () => {
        setSelectedCity(null);
        setNewCityText('');
    };

    const handleCancelAdd = () => {
        setSelectedRegion(null);
        setNewCityText('');
        setShowModal(false)
    };


    const handleOpenModal = () => {
        setShowModal(true);
        setNewCityText('');
    };

    const handleRegionChange = (event) => {
        setSelectedRegion(event.target.value);
        // Сброс выбранного города
        setSelectedCity(null);
        setNewCityText('');
    };

    return (
        <div>
            <Header />
            <div className="container">
                <div className="row justify-content">
                    <div className="col-md-auto">
                        <h3><a href="/admin-panel">Админ-панель</a> / заявки</h3>
                    </div>
                </div>
                <table className="table table-striped">
                    <thead>
                        <tr>
                            <th>ID (отладка)</th>
                            <th>Email</th>
                            <th>Название организации</th>
                            <th>Дата создания заявки</th>
                            <th>Область</th>
                            <th>Город</th>
                            <th>Действия</th>
                        </tr>
                    </thead>
                    <tbody>
                        {cities.map(city => (
                            <tr key={city.id}>
                                <td>{city.id}</td>
                                <td>{city.region_text}</td>
                                <td>{city.text}</td>
                                <td>

                                {city.id !== -1 && (
                            <>
                                    <button className="btn btn-danger">Удалить</button>
                                    <button className="btn btn-primary ml-2 ms-1" onClick={() => handleEditCity(city)}>Редактировать</button>
                            </>
                        )}
                        {city.id === -1 && (
                            <>
                                <button className="btn btn-danger" disabled>Удалить</button>
                                <button className="btn btn-primary ml-2 ms-1" disabled>Редактировать</button>
                            </>
                        )}


                                </td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>

            {showModal && (
                <div id="confirmModal2" className={`modal fade show d-block`} tabIndex="-1" aria-labelledby="confirmModalLabel2" aria-modal="true" role="dialog" >
                    <div className="modal-dialog modal-dialog-centered">
                        <div className="modal-content">
                            <div className="modal-header">
                                <h5 className="modal-title" id="confirmModalLabel2">Добавление города</h5>
                                <button type="button" className="btn-close" data-bs-dismiss="modal" aria-label="Закрыть" onClick={handleCancelAdd}></button>
                            </div>
                            <div className="modal-body">
                                <p>Выберите область:</p>
                                <select
                                    className="form-control"
                                    onChange={handleRegionChange}
                                    value={selectedRegion}
                                >
                                    <option value="notSelected" disabled>Выберите область</option>
                                    {regions.map(region => (
                                        <option key={region.id} value={region.id}>{region.text}</option>
                                    ))}
                                </select>
                                <p>Введите название нового города:</p>
                                <input
                                    type="text"
                                    className="form-control"
                                    value={newCityText}
                                    onChange={(e) => setNewCityText(e.target.value)}
                                />
                            </div>
                            <div className="modal-footer">
                                <button type="button" className="btn btn-secondary" onClick={handleCancelAdd}>Отмена</button>
                                <button type="button" className="btn btn-primary" onClick={handleAddCity}>Добавить</button>
                            </div>
                        </div>
                    </div>
                </div>
            )}
        </div>
    );
};

export default A_accepts;