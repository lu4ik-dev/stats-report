import React, { useEffect, useState } from 'react';
import Header from '../Header';
import { redirectToLogin } from '../../tech/checking';
import { formatDate } from '../../tech/formatterDate';
import { showAlert } from '../../tech/alert';
import { url_api } from '../../tech/config';


const A_Organization = () => {
    
    const [data, setData] = useState([]);
    const authkey = JSON.parse(localStorage.getItem("userInfo")).authkey;
    const userId = JSON.parse(localStorage.getItem("userInfo")).id;
    const [user, setUser] = useState([]);
    const [selectedUser, setSelectedUser] = useState(null);
    const [showModal, setShowModal] = useState(false);

    const handleOpenModal = (user) => {
        setSelectedUser(user);
        setShowModal(true);
    };

    // Функция для закрытия модального окна
    const handleCloseModal = () => {
        setSelectedUser(null);
        setShowModal(false);
    };
    const changeAdminRight = (id, admin_lvl) => {
        fetch(`${url_api}/api/changeadmin/settings/users/${id}/${admin_lvl === 0 ? 1 : 0}`, {
            method: 'POST',
            headers: {
              'Content-Type': 'application/json',
            },
          })
            .then(response => {
              if (response.ok) {
                fetch(url_api+'/api/users', {
                    method: 'GET',
                    headers: {
                      'Content-Type': 'application/x-www-form-urlencoded',
                    },
        
                })
                .then(response => response.json())
                .then(data => setData(data))
                .catch(error => showAlert(error.message));
                setSelectedUser(null);
                setShowModal(false);
                showAlert('Пользователь успешно обновлен');
              } else {
                console.error('Failed to delete work experience');
              }
            })
            .catch(error => {
              console.error('Error deleting work experience:', error);
            });
    };

    useEffect(() => {
        redirectToLogin();
        
        fetch(url_api+'/api/users', {
            method: 'GET',
            headers: {
              'Content-Type': 'application/x-www-form-urlencoded',
            },

        })
        .then(response => response.json())
        .then(data => setData(data))
        .catch(error => showAlert(error.message));
      }, []);

    const queryParams = new URLSearchParams(window.location.search);
    const idDocParam = queryParams.get('id_doc');
    const handleDelete = (id) => {
        fetch(`${url_api}/api/del/settings/users/${id}`, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
        })
          .then(response => {
            if (response.ok) {
              showAlert('Пользователь успешно удален');
              setData(prevData => prevData.filter(item => item.id !== id));
            } else {
              console.error('Failed to delete work experience');
            }
          })
          .catch(error => {
            console.error('Error deleting work experience:', error);
          });
      }

    return (
        <div>
        <Header />
        <div className="container">
            <div className="row justify-content">
            <div className="col-md-auto">
            <h3><a href="/admin-panel">Админ-панель</a> / организации ({data.filter(item => item.disabled !== 1).length})</h3>
            </div>
            <div className="col-md-auto mt-2">
            </div>

            </div>
            <table className="table table-striped">
            <thead>
                <tr>
                <th>Почта</th>
                <th>Наименование организации</th>
                <th>Область</th>
                <th>Город</th>
                <th>Действие</th>
                </tr>
            </thead>
            <tbody id="organizationTableBody"></tbody>
            {data.map((item) => (
                    item.disabled === 1 ? '' : (
                    <tr className='zoom-5' key={item.id}>
                        <td>{item.login}</td>
                        <td>{item.complectName}</td>
                        <td>{item.region_text}</td>
                        <td>{item.city_text}</td>
                        <td>{item.text}</td>
                        <td> 
                            <button className="btn btn-danger mx-1" disabled={userId == item.id} onClick={() => handleDelete(item.id)}>Удалить</button>
                                    <button className="btn btn-primary ml-2 me-1" onClick={() => handleOpenModal(item)}>Перейти</button>
                        </td>
                    </tr>
                )
                ))}
            </table>
        </div>

        
        <div
            id="confirmModalDeleteUser"
            className="modal fade"
            tabIndex={-1}
            aria-labelledby="confirmModalLabel"
            aria-hidden="true"
        >
            <div className="modal-dialog modal-dialog-centered">
            <div className="modal-content">
                <div className="modal-header">
                <h5 className="modal-title" id="confirmModalLabel">
                    Подтверждение
                </h5>
                <button
                    type="button"
                    className="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Закрыть"
                />
                </div>
                <div className="modal-body">
                <p>Вы действительно хотите удалить организацию?</p>
                </div>
                <div className="modal-footer">
                <button
                    type="button"
                    className="btn btn-secondary px-4"
                    data-bs-dismiss="modal"
                >
                    Нет
                </button>
                <button
                    type="button"
                    className="btn btn-primary px-4"
                    id="confirmDeleteButton"
                >
                    Да
                </button>
                </div>
            </div>
            </div>
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
                                <p><strong>Email:</strong> {selectedUser.login}  {selectedUser.admin_lvl !== 0 ? <strong className='text-danger'>   Администратор</strong> : ''}</p>
                                <p><strong>Название организации:</strong> {selectedUser.complectName}</p>
                                <p><strong>Дата создания:</strong> {formatDate(selectedUser.dateCreate)}</p>
                                <p><strong>Регион:</strong> {selectedUser.region_text}</p>
                                <p><strong>Город:</strong> {selectedUser.city_text}</p>
                                {/* Дополнительные детали пользователя */}
                            </div>
                            <div className="modal-footer">
                                <button type="button" className="btn btn-secondary" onClick={handleCloseModal}>Закрыть</button>
                                <button type="button" className="btn btn-primary" disabled={userId == selectedUser.id} onClick={() => changeAdminRight(selectedUser.id, selectedUser.admin_lvl)} >{selectedUser.admin_lvl === 0 ? 'Выдать права администратора' : 'Снять права администратора'}</button>
                            </div>
                        </div>
                    </div>
                </div>
            )}

        </div>
    );
};

export default A_Organization;