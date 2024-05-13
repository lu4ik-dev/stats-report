
import React, { useState, useEffect } from 'react';
import Header from '../Header';
import { url_api } from '../../tech/config';
import { showAlert } from '../../tech/alert';

const A_Configurate_Cities = () => {
    const [cities, setCities] = useState([]);
    const [selectedCity, setSelectedCity] = useState(null);
    const [newCityText, setNewCityText] = useState('');
    const [showModal, setShowModal] = useState(false);
    const [regions, setRegions] = useState([]);
    const [selectedRegion, setSelectedRegion] = useState('notSelected');

    const [searchText, setSearchText] = useState('')
    const handleSearch = (text) => {
        setSearchText(text);
        if(setSearchText != ''){
        setTimeout(() => {

            console.log(text)
            const fetchData = async () => {
                try {
                    const response = await fetch(url_api+'/api/search/cities', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify({ search: searchText })
                    });
                    const data = await response.json();
                    setCities(data);
                } catch (error) {
                    console.error('Ошибка при получении данных:', error);
                }
            };
            fetchData();
        }, 1000); // Задержка в 1000 миллисекунд (1 секунда))
    }
    }
    useEffect(() => {
        fetch(`${url_api}/api/get/settings/cities`)
            .then(response => response.json())
            .then(data => setCities(data))
            .catch(error => console.error('Ошибка при получении данных:', error));

        fetch(`${url_api}/api/get/regions`)
            .then(response => response.json())
            .then(data => setRegions(data))
            .catch(error => console.error('Ошибка при загрузке регионов:', error));
    }, []);

    const handleSaveCity = () => {
        const requestOptions = {
            method: 'POST',
            headers: {
              'Content-Type': 'application/json',
            },
            body: JSON.stringify({ id: selectedCity.id, text: newCityText })
        };
        fetch(`${url_api}/api/set/settings/cities`, requestOptions)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Ошибка сохранения города');
                }
                // Закрываем модальное окно
                setCities(cities.map(city => {
                    if (city.id === selectedCity.id) {
                        return { ...city, text: newCityText };
                    }
                    return city;
                }));
                showAlert('Город успешно обновлен')
                setSelectedCity(null);
            })
            .catch(error => console.error('Ошибка сохранения города:', error));
    };

    const handleDeleteCity = (id) => {
        const requestOptions = {
            method: 'POST'
        };
        fetch(`${url_api}/api/del/settings/cities/${id}`, requestOptions)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Ошибка удаления города');
                }
                // Обновляем список городов после успешного удаления
                setCities(cities.filter(city => city.id !== id));
                showAlert('Город успешно удален')
            })
            .catch(error => console.error('Ошибка удаления города:', error));
    };

    const handleEditCity = (city) => {
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

            const handleAddCity = async () => {
                if (selectedRegion === 'notSelected' || selectedRegion === null || selectedRegion < 0) {
                    showAlert('Не выбрана область');
                    return;
                }
                try {
                    const response = await fetch(`${url_api}/api/add/settings/cities`, {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                        },
                        body: JSON.stringify({
                            text: newCityText,
                            id_region: selectedRegion
                        })
                    });
                    if (response.ok) {
                        fetch(`${url_api}/api/get/settings/cities`)
                        .then(response => response.json())
                        .then(data => setCities(data))
                        .catch(error => showAlert('Ошибка при получении данных:'));
                        showAlert('Город успешно добавлен')
                        handleCancelAdd(); // Закрытие модального окна при успешном обновлении
                    } else {
                        showAlert('Неудалось добавить регион');
                    }
                } catch (error) {
                    showAlert('Неудалось добавить регион');
                }
            };
        

    return (
        <div>
            <Header/>
            <div className="container">
                <div className="row justify-content">
                    <div className="col-md-auto">
                        <h3><a href="/admin-panel">Админ-панель</a> / <a href="/admin-panel/settings">настройки</a></h3>
                    </div>
                    <div className="col-md-auto mt-2 d-flex">
                    <input
                                    type="text"
                                    placeholder='Поиск..'
                                    className="form-control me-3"
                                    value={searchText}
                                    onChange={(e) => handleSearch(e.target.value)}
                                    onBlur={(e) => handleSearch(e.target.value)}
                                />
                        <button className="btn btn-primary zoom-5" onClick={handleOpenModal}>
                            Добавить новую область
                        </button>
                    </div>
                </div>
                <table className="table table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Название области</th>
                            <th>Название города</th>
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
                                    <button className="btn btn-danger" onClick={() => handleDeleteCity(city.id)}>Удалить</button>
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
            {selectedCity && (
                <div id="confirmModal2" className={`modal fade show d-block`} tabIndex="-1" aria-labelledby="confirmModalLabel2" aria-modal="true" role="dialog" >
                    <div className="modal-dialog modal-dialog-centered">
                        <div className="modal-content">
                            <div className="modal-header">
                                <h5 className="modal-title" id="confirmModalLabel2">Редактирование города</h5>
                                <button type="button" className="btn-close" data-bs-dismiss="modal" aria-label="Закрыть" onClick={handleCancelEdit}></button>
                            </div>
                            <div className="modal-body">
                                <p>Введите новое название города:</p>
                                <input
                                    type="text"
                                    className="form-control"
                                    value={newCityText}
                                    onChange={(e) => setNewCityText(e.target.value)}
                                />
                            </div>
                            <div className="modal-footer">
                                <button type="button" className="btn btn-secondary" onClick={handleCancelEdit}>Отмена</button>
                                <button type="button" className="btn btn-primary" onClick={handleSaveCity}>Сохранить</button>
                            </div>
                        </div>
                    </div>
                </div>
            )}

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

export default A_Configurate_Cities;
