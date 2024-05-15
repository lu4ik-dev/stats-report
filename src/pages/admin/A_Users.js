import React, { useEffect, useState } from 'react';
import Header from '../Header';
import { url_api } from '../../tech/config';
import { formatDate } from '../../tech/formatterDate';
import { showAlert } from '../../tech/alert';
import { redirectToLogin } from '../../tech/checking';

const A_users = () => {
    const [data, setData] = useState([]);
    const authkey = JSON.parse(localStorage.getItem("userInfo")).authkey;
    useEffect(() => {
        redirectToLogin();
        
        fetch(url_api+'/api/dataExpEmployee', {
            method: 'POST',
            headers: {
              'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: new URLSearchParams({
                'authkey': authkey,
              }),
        })
        .then(response => response.json())
        .then(data => setData(data))
        .catch(error => showAlert(error.message));
      }, []);
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
                <th>ФИО</th>
                <th>Логин</th>
                <th>Email</th>
                <th>Дата регистрации</th>
                <th>Город</th>
                <th>Область</th>
                <th>Действие</th>
                </tr>
            </thead>
            <tbody id="usersTableBody"></tbody>
                {data.map((item) => (
                    item.disabled === 1 ? '' : (
                    <tr className='zoom-5' key={item.id}>
                        <td>{item.userName}</td>
                        <td>{item.orgName}</td>
                        <td>{formatDate(item.dateCreate)}</td>
                        <td>{item.cityName}</td>
                        <td>{item.regionName}</td>
                        <td><a href={`/experience?id_doc=${item.id}`} className='btn btn-primary zoom-5'>Перейти</a><button className='btn btn-danger mx-1 zoom-5'>Удалить</button></td>
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

export default A_users;