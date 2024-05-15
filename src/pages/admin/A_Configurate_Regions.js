import React, { useState, useEffect } from 'react';
import Header from '../Header';
import { url_api } from '../../tech/config';
import { showAlert } from '../../tech/alert';

const A_Configurate_Regions = () => {


    const [regions, setRegions] = useState([]);
    const [selectedRegion, setSelectedRegion] = useState(null);
    const [newRegionText, setNewRegionText] = useState('');
    const [showModal, setShowModal] = useState(false);

    useEffect(() => {
        fetch(`${url_api}/api/get/settings/regions`)
            .then(response => response.json())
            .then(data => setRegions(data))
            .catch(error => console.error('Ошибка при получении данных:', error));
    }, []);

    const handleSaveRegion = () => {
        const requestOptions = {
            method: 'POST',
            headers: {
              'Content-Type': 'application/json',
            },
            body: JSON.stringify({ id: selectedRegion.id, text: newRegionText })
        };
        fetch(`${url_api}/api/set/settings/regions`, requestOptions)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Ошибка сохранения региона');
                }
                // Закрываем модальное окно

                setRegions(regions.map(region => {
                    if (region.id === selectedRegion.id) {
                        return { ...region, text: newRegionText };
                    }
                    return region;
                }));
                showAlert('Регион успешно обновлен')
                setSelectedRegion(null);
            })
            .catch(error => console.error('Ошибка сохранения региона:', error));
    };
    
    const handleDeleteRegion = (id) => {
        const requestOptions = {
            method: 'POST',
            headers: { 
                'Content-Type': 'application/x-www-form-urlencoded', }
        };
        fetch(`${url_api}/api/del/settings/regions/${id}`, requestOptions)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Ошибка удаления региона');
                }
                // Обновляем список регионов после успешного удаления
                showAlert('Регион успешно удален')
                setRegions(regions.filter(region => region.id !== id));
            })
            .catch(error => console.error('Ошибка удаления региона:', error));
    };
    
    const handleEditRegion = (region) => {
        setSelectedRegion(region);
        setNewRegionText(region.text);
    };


    const handleCancelEdit = () => {
        setSelectedRegion(null);
        setNewRegionText('');
        // Закрыть модальное окно
    };

    const handleOpenModal = () => {
        setShowModal(true);
        setNewRegionText(''); // Очищаем значение новой области при открытии модального окна
    };

    const handleCloseModal = () => {
        setShowModal(false);
    };

    const handleAddRegion = async () => {
        try {
            const response = await fetch(`${url_api}/api/add/settings/regions`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    text: newRegionText
                })
            });
            if (response.ok) {
                fetch(`${url_api}/api/get/settings/regions`)
                .then(response => response.json())
                .then(data => setRegions(data))
                .catch(error => console.error('Ошибка при получении данных:', error));
                showAlert('Регион успешно добавлен')
                handleCloseModal(); // Закрытие модального окна при успешном обновлении
            } else {
                console.error('Failed to add region');
            }
        } catch (error) {
            console.error('Error adding region:', error);
        }
    };


    return (
        <div>
            <Header/>
            <div className="container">
            <div className="row justify-content">
            <div className="col-md-auto">
                <h3><a href="/admin-panel">Админ-панель</a> / <a href="/admin-panel/settings">настройки</a> / области</h3>
            </div>
            <div className="col-md-auto mt-2">
   
                <button className="btn btn-primary zoom-5" onClick={handleOpenModal}>
                            Добавить новую область
                        </button>
            </div>

            </div>
            <table className="table table-striped">
            <thead>
                <tr>
                    <th>Название области</th>
                    <th>Количество городов</th>
                    <th>Действия</th>
                </tr>
            </thead>
            <tbody>
                {regions.map(region => (
                    <tr key={region.id}>
                        <td>{region.text}</td>
                        <td>{region.city_count}</td>
                        <td>
                        {region.id !== -1 && (
                            <>
                                <button className="btn btn-danger" onClick={() => handleDeleteRegion(region.id)}>Удалить</button>
                                <button className="btn btn-primary ml-2 ms-1" onClick={() => handleEditRegion(region)}>Редактировать</button>
                            </>
                        )}
                        {region.id === -1 && (
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
            {selectedRegion && (
                <div id="confirmModal2" className={`modal fade show d-block`} tabIndex="-1" aria-labelledby="confirmModalLabel2" aria-modal="true" role="dialog" >
                    <div className="modal-dialog modal-dialog-centered">
                        <div className="modal-content">
                            <div className="modal-header">
                                <h5 className="modal-title" id="confirmModalLabel2">Редактирование области</h5>
                                <button type="button" className="btn-close" data-bs-dismiss="modal" aria-label="Закрыть" onClick={handleCancelEdit}></button>
                            </div>
                            <div className="modal-body">
                                <p>Введите новое название области:</p>
                                <input
                                    type="text"
                                    className="form-control"
                                    value={newRegionText}
                                    onChange={(e) => setNewRegionText(e.target.value)}
                                />
                            </div>
                            <div className="modal-footer">
                                <button type="button" className="btn btn-secondary" onClick={handleCancelEdit}>Отмена</button>
                                <button type="button" className="btn btn-primary" onClick={handleSaveRegion}>Сохранить</button>
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
                                <h5 className="modal-title" id="confirmModalLabel2">Добавление области</h5>
                                <button type="button" className="btn-close" data-bs-dismiss="modal" aria-label="Закрыть" onClick={handleCloseModal}></button>
                            </div>
                            <div className="modal-body">
                                <p>Введите название новой области:</p>
                                <input
                                    type="text"
                                    className="form-control"
                                    value={newRegionText}
                                    onChange={(e) => setNewRegionText(e.target.value)}
                                />
                            </div>
                            <div className="modal-footer">
                                <button type="button" className="btn btn-secondary" onClick={handleCloseModal}>Отмена</button>
                                <button type="button" className="btn btn-primary" onClick={handleAddRegion}>Сохранить</button>
                            </div>
                        </div>
                    </div>
                </div>
            )}
        </div>
    );
};

export default A_Configurate_Regions;