import React, { useState, useEffect } from 'react';
import Header from './Header';
import { url_api } from '../tech/config';
import { formatDate } from '../tech/formatterDate';
import { showAlert } from '../tech/alert';
import { redirectToLogin } from '../tech/checking';

const Admin_panel = () => {
    redirectToLogin();
    const [data, setData] = useState([]);
    useEffect(() => {
        redirectToLogin();
        
        fetch(url_api+'/api/users', {
            method: 'GET',
        })
        .then(response => response.json())
        .then(data => setData(data))
        .catch(error => showAlert(error.message));
      }, []);
      console.log(data);
    const userInfo = localStorage.getItem('userInfo').userInfo;
    
    const handleAdminLevelUpdate = (admin_target) => {
        const userId = admin_target; 
        const authKey = localStorage.getItem('auth'); 
        
        fetch(url_api+'/api/updateAdminLevel', {
        method: 'POST',
        headers: {
        'Content-Type': 'application/json',
        },
        body: JSON.stringify({
        userId,
        authKey,
        }),
        })
        .then((response) => response.json())
        .then((data) => {
            if (data.success) {
            showAlert(`Вы успешно обновили права пользователя, теперь он: ${data.newAdminLevel === 0 ? 'Организация' : 'Администратор'}`);
            } else {
                showAlert('Произошла ошибка.');
                }
            })
            .catch((error) => {
            console.error('Error updating admin level:', error);
            showAlert('Произошла ошибка.');
    });
    };

    return (
        <div>
        <Header />
        <div className="container">
            <div className="row justify-content">
            <div className="col-md-auto">
                <h1>Пользователи</h1>
            </div>
            <div className="col-md-auto mt-2">
                <a href="#!" className="btn btn-primary zoom-5">
                Заявки на регистрацию (0)
                </a>
            </div>

            </div>
            <table className="table table-striped">
            <thead>
                <tr>
                <th>Наименование</th>
                <th>Дата регистрации</th>
                <th>Статус</th>
                <th>Действие</th>
                </tr>
            </thead>
            <tbody id="usersTableBody"></tbody>
                {data.map((item) => (
                    <tr className='zoom-5' key={item.id}>
                    <td>{item.complectName}</td>
                        <td>{item.admin_lvl > 0 ? 'Администратор' : 'Организация' }</td>
                        <td>{formatDate(item.dateCreate)}</td>
                        <td><button className='btn btn-primary zoom-5' onClick={handleAdminLevelUpdate(item.id)}>{item.admin_lvl >0 ? 'Понизить' : 'Повысить'}</button></td>
                    </tr>
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
                <p>Вы действительно хотите удалить сотрудника?</p>
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

        </div>
    );
};

export default Admin_panel;