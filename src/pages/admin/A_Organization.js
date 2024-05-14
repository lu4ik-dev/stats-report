import React, { useEffect, useState } from 'react';
import Header from '../Header';
import { redirectToLogin } from '../../tech/checking';
import { formatDate } from '../../tech/formatterDate';
import { showAlert } from '../../tech/alert';
import { url_api } from '../../tech/config';


const A_Organization = () => {
    const [data, setData] = useState([]);
    const authkey = JSON.parse(localStorage.getItem("userInfo")).authkey;

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
                <h1>Организации</h1>
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
                            <button className='btn btn-danger mx-1 ' onClick={() => handleDelete(item.id)}>Удалить</button>
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

        </div>
    );
};

export default A_Organization;