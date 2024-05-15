import React, { useState, useEffect } from 'react';
import { redirectToLogin } from '../../tech/checking';
import Header from '../Header';
import { url_api } from '../../tech/config';
const A_accepts = () => {
    const [users, setUsers] = useState([]);
    const [selectedUser, setSelectedUser] = useState(null);
    const [showModal, setShowModal] = useState(false);

    redirectToLogin();

    // Загрузка пользователей при загрузке компонента
    useEffect(() => {
        fetchUsers();
    }, []);

    // Функция для получения списка пользователей
    const fetchUsers = () => {
        fetch(`${url_api}/api/users/getVerify`)
            .then(response => response.json())
            .then(data => setUsers(data))
            .catch(error => console.error('Ошибка загрузки пользователей:', error));
    };

    // Функция для активации пользователя
    const activateUser = (userId) => {
        fetch(`${url_api}/api/users/activate/${userId}`, { method: 'POST' })
            .then(() => {
                fetchUsers(); // После активации обновляем список пользователей
                handleCloseModal();
            })
            .catch(error => console.error('Ошибка активации пользователя:', error));
    };

    // Функция для деактивации пользователя
    const deactivateUser = (userId) => {
        fetch(`${url_api}/api/users/deactivate/${userId}`, { method: 'POST' })
            .then(() => {
                fetchUsers(); // После деактивации обновляем список пользователей
            })
            .catch(error => console.error('Ошибка деактивации пользователя:', error));
    };

    // Функция для открытия модального окна и выбора пользователя
    const handleOpenModal = (user) => {
        setSelectedUser(user);
        setShowModal(true);
    };

    // Функция для закрытия модального окна
    const handleCloseModal = () => {
        setSelectedUser(null);
        setShowModal(false);
    };

    return (
        <div>
            <Header />
            <div className="container">
                <div className="row justify-content">
                    <div className="col-md-auto">
                        <h3><a href="/admin-panel">Админ-панель</a> / пользователи</h3>
                    </div>
                </div>
                <table className="table table-striped">
                    <thead>
                        <tr>
                            <th>ID (отладка)</th>
                            <th>Email</th>
                            <th>Название организации</th>
                            <th>Дата создания</th>
                            <th>Область</th>
                            <th>Город</th>
                            <th>Действия</th>
                        </tr>
                    </thead>
                    <tbody>

                        {users.map(user => (
                            user.disabled === 1 ? '' : 
                            <tr key={user.id}>
                                <td>{user.id}</td>
                                <td>{user.login}</td>
                                <td>{user.complectName}</td>
                                <td>{user.dateCreate}</td>
                                <td>{user.region_text}</td>
                                <td>{user.city_text}</td>
                                <td>
                                    <button className="btn btn-danger" onClick={() => deactivateUser(user.id)}>Деактивировать</button>
                                    <button className="btn btn-primary ml-2 ms-1" onClick={() => handleOpenModal(user)}>Перейти</button>
                                </td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>

            {showModal && (
                <div id="userDetailsModal" className={`modal fade show d-block`} tabIndex="-1" aria-labelledby="userDetailsModalLabel" aria-modal="true" role="dialog" >
                    <div className="modal-dialog modal-dialog-centered">
                        <div className="modal-content">
                            <div className="modal-header">
                                <h5 className="modal-title" id="userDetailsModalLabel">Детали пользователя</h5>
                                <button type="button" className="btn-close" data-bs-dismiss="modal" aria-label="Закрыть" onClick={handleCloseModal}></button>
                            </div>
                            <div className="modal-body">
                                <p><strong>Email:</strong> {selectedUser.login}</p>
                                <p><strong>Название организации:</strong> {selectedUser.complectName}</p>
                                <p><strong>Дата создания:</strong> {selectedUser.dateCreate}</p>
                                <p><strong>Регион:</strong> {selectedUser.region_text}</p>
                                <p><strong>Город:</strong> {selectedUser.city_text}</p>
                                {/* Дополнительные детали пользователя */}
                            </div>
                            <div className="modal-footer">
                                <button type="button" className="btn btn-secondary" onClick={handleCloseModal}>Закрыть</button>
                                {selectedUser.verify === 0 && <button type="button" className="btn btn-primary" onClick={() => activateUser(selectedUser.id)}>Активировать</button>}
                            </div>
                        </div>
                    </div>
                </div>
            )}
        </div>
    );
};

export default A_accepts;