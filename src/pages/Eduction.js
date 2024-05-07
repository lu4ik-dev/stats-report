import React, { useEffect, useState } from 'react';
import { redirectToLogin} from '../tech/checking';
import { formatDate } from '../tech/formatterDate';
import Header from './Header';
import { url_api } from '../tech/config';
import { showAlert } from '../tech/alert';
import InvalidsTables from './InvalidsTables';

const Eduction = () => {
    redirectToLogin();
    const [data, setData] = useState([]);
    const userInfo = JSON.parse(sessionStorage.getItem("userInfo")).userInfo;
    const authkey = JSON.parse(sessionStorage.getItem("userInfo")).authkey;
    useEffect(() => {
        redirectToLogin();
        fetch(url_api+'/api/dataEduction', {
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

    const handleDelete = (id) => {
        fetch(`${url_api}/api/deleteEducation/${id}`, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
        })
          .then(response => {
            if (response.ok) {
              showAlert('Документ успешно удален');
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
        {idDocParam ? (
        <InvalidsTables />
      ) : (
        <div className="container">
            <div className="row justify-content">
            <div className="col-md-auto">
                <h1>Документы</h1>
            </div>
            <div className="col-md-auto mt-2">
                
                <a href="eduction-table?id_doc=newDoc" className="btn btn-primary zoom-5">
                    Добавить новый документ
                </a>
            </div>

            </div>
            <table className="table table-striped">
            <thead>
                <tr>
                <th>ID</th>
                <th>Наименование организации</th>
                <th>Дата создания</th>
                <th>Действие</th>
                </tr>
            </thead>
            <tbody id="invalidsTables">
                {data.map((item) => (
                    item.disabled === 1 ? '' : (
                <tr className='zoom-5' key={item.id}>
                    <td>{item.id}</td>
                    <td>{item.userName}</td>
                    <td>{formatDate(item.dateCreate)}</td>
                    <td><a href={`/eduction-table?id_doc=${item.id}`} className='btn btn-primary zoom-5'>Перейти</a><button className='btn btn-danger mx-1 zoom-5' onClick={() => handleDelete(item.id)}>Удалить</button></td>
                </tr>
                )
                ))}
            </tbody>
            </table>
        </div>
      )}
    </div>
    );
};

export default Eduction;