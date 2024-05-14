import React, { useEffect, useState } from 'react';
import ContingentTable from './ContingentTable';
import { redirectToLogin } from '../tech/checking';
import Header from './Header';
import { url_api } from '../tech/config';
import { showAlert } from '../tech/alert';
import { formatDate } from '../tech/formatterDate';

const Contingent = () => {
  const [data, setData] = useState([]);
  const userInfo = JSON.parse(localStorage.getItem("userInfo"));
  const authkey = userInfo.authkey;

  useEffect(() => {
      redirectToLogin();
      fetch(`${url_api}/api/contingent`, {
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
    }, [authkey]);
  const queryParams = new URLSearchParams(window.location.search);
  const idDocParam = queryParams.get('id_doc');

  const handleDelete = (id) => {
    fetch(`${url_api}/api/delContingent/${id}`, {
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

  const handlerTest = () => {
      showAlert('Кнопка для напоминания!!! Фильтры по городу / области / организации\nИ возможно сортировка');
  }
  return (
    <div>
      <Header />
      {idDocParam ? (
        <ContingentTable />
      ) : (
        <div className="container">
  <div className="row justify-content">
            <div className="col-md-auto">
                <h1>Документы</h1>
            </div>
            <div className="col-md-auto mt-2">
                <button className="btn btn-danger zoom-5 mx-3" onClick={handlerTest}>
                    для администратора добавить фильтры по организации / области / городу*
                </button>
                <a href="contingent-table?id_doc=newDoc" className="btn btn-primary zoom-5">
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
            <tbody id="contingentTable">
            {data.map((item) => (
                    item.disabled === 1 ? '' : (
                <tr className='zoom-5' key={item.id}>
                    <td>{item.id}</td>
                    <td>{item.userName}</td>
                    <td>{formatDate(item.dateCreate)}</td>
                    <td><a href={`/contingent?id_doc=${item.id}`} className='btn btn-primary zoom-5'>Перейти</a><button className='btn btn-danger mx-1 zoom-5' onClick={() => handleDelete(item.id)}>Удалить</button></td>
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

export default Contingent;