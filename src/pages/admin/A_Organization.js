import React, { useEffect, useState } from 'react';
import Header from '../Header';
import { redirectToLogin } from '../../tech/checking';
import { formatDate } from '../../tech/formatterDate';
import { showAlert } from '../../tech/alert';
import { url_api } from '../../tech/config';


const A_Organization = () => {
    const [data, setData] = useState([]);
    const authkey = JSON.parse(sessionStorage.getItem("userInfo")).authkey;

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

    const queryParams = new URLSearchParams(window.location.search);
    const idDocParam = queryParams.get('id_doc');
    
    return (
        <div>
        <Header />
        <div className="container">
            <div className="row justify-content">
            <div className="col-md-auto">
                <h1>Организации</h1>
            </div>
            <div className="col-md-auto mt-2">
                <a href="#!" className="btn btn-primary zoom-5">
                Добавить организацию
                </a>
            </div>

            </div>
            <table className="table table-striped">
            <thead>
                <tr>
                <th>ID (отладка)</th>
                <th>Наименование организации</th>
                <th>Дата создания</th>
                <th>Город</th>
                <th>Область</th>
                </tr>
            </thead>
            <tbody id="organizationTableBody"></tbody>
            {data.map((item) => (
                    item.disabled === 1 ? '' : (
                    <tr className='zoom-5' key={item.id}>
                        <td>{item.id}</td>
                        <td>{item.userName}</td>
                        <td>{item.orgName}</td>
                        <td>{formatDate(item.dateCreate)}</td>
                        <td>{item.cityName}</td>
                        <td>{item.regionName}</td>
                        <td><a className='btn btn-primary zoom-5'>Редактировать</a><button className='btn btn-danger mx-1 zoom-5'>Удалить</button></td>
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

        </div>
    );
};

export default A_Organization;