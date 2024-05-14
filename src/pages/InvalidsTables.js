import React, { useState, useEffect, useRef } from 'react';
import { showAlert } from '../tech/alert';
import { url_api, url_web } from '../tech/config';
import * as XLSX from 'xlsx';
import { formatDate } from '../tech/formatterDate';
import Header from './Header';
import { redirectToLogin } from '../tech/checking';
import { json } from 'react-router-dom';

const InvalidsTables = () => {
  const userInfo = JSON.parse(sessionStorage.getItem("userInfo")).userInfo;
  const [tableData, setTableData] = useState([]);
  const [author, setAuthor] = useState('');
  const [lastEditor, setLastEditor] = useState('');
  const [lastTimeEdit, setLastTimeEdit] = useState('');
  const [city, setCity] = useState('');
  const [region, setRegion] = useState('');
  const [dateCreateDoc, setDateCreateDoc] = useState('');

  const fetchData = async () => {
    try {
      const id_doc = new URLSearchParams(window.location.search).get("id_doc");

      if (!id_doc || id_doc === "newDoc") {
        setTableData([
          {
            col1: '',
            col2: '',
            col3: 1,
            col4: 0,
            col5: 0,
            col6: 0,
            col7: 0,
            col8: 0,
            col9: 0,
            col10: 0,
            col11: 0,
            col12: 0,
            col13: 0,
            col14: 0,
            col15: 0,
            col16: 0,
            col17: 0,
            col18: 0,
            col19: 0,
            col20: 0,
            col21: 0,
            col22: 0,
            col23: 0,
            col24: 0,
            col25: 0,
            col26: 0,
            col27: 0,
            col28: 0,
          },
        ]);
      } else {
        const response = await fetch(url_api + '/api/invalids-table/' + id_doc);
        const result = await response.json();
        if (response.ok) {
          console.log(result);
          setTableData((prevData) => [
            ...prevData.slice(1),
            ...result.map((rowData, index) => {

              setAuthor(rowData.complectName);
              setDateCreateDoc(rowData.dateCreate);
              setLastTimeEdit(rowData.timeLastEdit);

          const counts = JSON.parse(rowData.counts);
          const diagnoses = JSON.parse(rowData.diagnoses);
          console.log(`counts: ${counts}`)
          return {
          col1: rowData.name_poo || '',
          col2: rowData.specialnost || '',
          col3: rowData.code_of_specialnost || '',
          col4: ((counts.col5 || 0) + (counts.col6 || 0) + (counts.col7 || 0) + (counts.col8 || 0) + (counts.col9 || 0) + (counts.col10 || 0)),
          col5: counts.col5 || 0,
          col6: counts.col6 || 0,
          col7: counts.col7 || 0,
          col8: counts.col8 || 0,
          col9: counts.col9 || 0,
          col10: counts.col10 || 0,
          col11: diagnoses.col11 || 0,
          col12: diagnoses.col12 || 0,
          col13: diagnoses.col13 || 0,
          col14: diagnoses.col14 || 0,
          col15: diagnoses.col15 || 0,
          col16: diagnoses.col16 || 0,
          col17: diagnoses.col17 || 0,
          col18: diagnoses.col18 || 0,
          col19: diagnoses.col19 || 0,
          col20: diagnoses.col20 || 0,
          col21: diagnoses.col21 || 0,
          col22: diagnoses.col22 || 0,
          col23: diagnoses.col23 || 0,
          col24: diagnoses.col24 || 0,
          col25: diagnoses.col25 || 0,
          col26: diagnoses.col26 || 0,
          col27: diagnoses.col27 || 0,
          col28: diagnoses.col28 || 0,
          };
          })
        ]);
          } else {
          console.error('Error fetching data:', result.error);
          }
      }
    } catch (error) {
      console.error('Error fetching data:', error);
    }
  };

  const effectRan = useRef(false);
  useEffect(() => {
    if (!effectRan.current) {
      fetchData();
    }
    return () => (effectRan.current = true);
  }, []);

  const handleDelete = (rowIndex) => {
    setTableData((prevData) => {
      const newData = [...prevData];
      newData.splice(rowIndex, 1);
      return newData;
    });
  };

  const handleSave = () => {
    let id_doc = new URLSearchParams(window.location.search).get("id_doc");
    const tableRows = [];

    tableData.forEach((row) => {
      const rowObject = {
        name_poo: row.col1,
        specialnost: row.col2,
        code_of_specialnost: row.col3,
        counts: {
          col5: row.col5,
          col6: row.col6,
          col7: row.col7,
          col8: row.col8,
          col9: row.col9,
        },
        diagnoses: {
          col11: row.col11,
          col12: row.col12,
          col13: row.col13,
          col14: row.col14,
          col15: row.col15,
          col16: row.col16,
          col17: row.col17,
          col18: row.col18,
          col19: row.col19,
          col20: row.col20,
          col21: row.col21,
          col22: row.col22,
          col23: row.col23,
          col24: row.col24,
          col25: row.col25,
          col26: row.col26,
          col27: row.col27,
          col28: row.col28,
        },
      };

      tableRows.push(rowObject);
    });

    const jsonSchema = {
      table: tableRows,
    };
    var now = new Date();

    const requestBody = {
      timeLastEdit: formatDate(now),
      user_id: userInfo.id,
      table: tableRows,
    };

    const apiUrl = id_doc !== 'newDoc' ? '/api/updateInvalids' : '/api/addInvalids';
    fetch(url_api + apiUrl, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        user_id: userInfo.id,
        id_doc: id_doc,
        table: tableRows.map(row => ({
          id_doc: id_doc,
          name_poo: row.name_poo,
          specialnost: row.specialnost,
          code_of_specialnost: row.code_of_specialnost,
          counts: JSON.stringify(row.counts), 
          diagnoses: JSON.stringify(row.diagnoses), 
        })),
        timeLastEdit: formatDate(now),
      }),
    })
      .then((response) => response.json())
      .then((data) => {
        showAlert('Таблица успешно сохранена!');
        const currentUrl = window.location.href;
        const targetUrl = `http://localhost:3000/invalids-tables?id_doc=${data.id}`;
        if (currentUrl !== targetUrl) {
          window.location.href = targetUrl;
        } else {
          window.location.reload();
        }
      })
      .catch((error) => {
        console.error('Ошибка при отправке запроса:', error);
      });
      };

  const handleInputChange = (rowIndex, colName, value) => {
    const intValue = parseInt(value, 10);
    const newValue = colName === 'col1' || colName === 'col2' || colName === 'col3' ? value : isNaN(intValue) ? 0 : Math.min(Math.max(0, intValue), 999);

    setTableData((prevData) => {
      const newData = [...prevData];
      newData[rowIndex][colName] = newValue;

      if (colName === 'col5' || colName === 'col6' || colName === 'col7' || colName === 'col8') {
        newData[rowIndex].col4 = parseInt(newData[rowIndex].col5) + parseInt(newData[rowIndex].col6) + parseInt(newData[rowIndex].col7) + parseInt(newData[rowIndex].col8) + parseInt(newData[rowIndex].col9) + parseInt(newData[rowIndex].col10);
      }
      return newData;
    });
  };

  const exportToExcel = () => {
    const ws = XLSX.utils.table_to_sheet(document.getElementById('invalidsTables'));
    const wb = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(wb, ws, 'Sheet1');
    XLSX.writeFile(wb, 'Персонал2.xls');
  };

  const handlerInsert = () => {
    setTableData((prevData) => [
      ...prevData,
      {
        col1: '',
        col2: '',
        col3: 1,
        col4: 0,
        col5: 0,
        col6: 0,
        col7: 0,
        col8: 0,
        col9: 0,
        col10: 0,
        col11: 0,
        col12: 0,
        col13: 0,
        col14: 0,
        col15: 0,
        col16: 0,
        col17: 0,
        col18: 0,
        col19: 0,
        col20: 0,
        col21: 0,
        col22: 0,
        col23: 0,
        col24: 0,
        col25: 0,
        col26: 0,
        col27: 0,
        col28: 0,
      },
    ]);
  };

  const id_doc = new URLSearchParams(window.location.search).get("id_doc");
  return (
      <div>
      <Header />
	  <div>
		<div className="d-flex flex-wrap justify-content-center py-1 mb-2">
                <span className="d-flex align-items-center mb-1 mb-md-0 me-md-auto text-dark fs-5 ms-3"><a href="/invalids">Инвалиды и люди с ОВЗ</a></span>
            <ul className="nav nav-pills me-3">
                <button className="btn btn-primary zoom-5" aria-current="page" onClick={exportToExcel}>
                    Экспорт в CSV
                </button>
            </ul>
        </div>
            <table className="iksweb" id="invalidsTables">
            <thead>
		<tr>
			<th className='bg-primary' rowSpan="3">Наименование ПОО</th>
			<th className='bg-primary' rowSpan="3">Наименование специальности, профессии</th>
			<th className='bg-primary' rowSpan="3">код специальности, профессии</th>
			<th className='bg-primary' rowSpan="3">Всего инвалидов с ОВЗ</th>
			<th className='bg-primary' colSpan="4">(из 3 графы)Из них количество студентов и источник</th>
			<th className='bg-primary' colSpan="20">Из них (из графы 4):</th>
			<th className='bg-primary' rowSpan="4">Действие</th>
		</tr>
		<tr>
			<th className='bg-primary'>Количество студентов, обучающихся за счет средств федерального бюджета</th>
			<th className='bg-primary'>Количество студентов, обучающихся за счет средств бюджета субъекта РФ</th>
			<th className='bg-primary'>Количество студентов, обучающихся по целевому обучению         (в т.ч. из гр.13 или 14)</th>
			<th className='bg-primary'> Количество студентов, обучающихся на основании договоров об оказании платных образовательных услуг</th>
			<th className='bg-primary' rowSpan="2">Лица с ОВЗ(имеют заключения ПМПК), чел.</th>
			<th className='bg-primary' rowSpan="2">Инвалиды, чел.</th>
			<th className='bg-primary' colSpan="3">С нарушениями зрения</th>
			<th className='bg-primary' colSpan="3">С нарушениями слуха</th>
			<th className='bg-primary' colSpan="3">С нарушениями опорно-двигательного аппарата</th>
			<th className='bg-primary' colSpan="3">С другими видами здоровья</th>
			<th className='bg-primary' colSpan="3">Со сложными дефектами (два и более нарушений)</th>
			<th className='bg-primary' colSpan="3">С нарушениями интеллекта (с умственной отсталостью)</th>
		</tr>
		<tr>
			<th className='bg-primary'></th>
			<th className='bg-primary'></th>
			<th className='bg-primary'></th>
			<th className='bg-primary'></th>
			<th className='bg-primary'>П</th>
			<th className='bg-primary'>К</th>
			<th className='bg-primary'>В</th>
			<th className='bg-primary'>П</th>
			<th className='bg-primary'>К</th>
			<th className='bg-primary'>В</th>
			<th className='bg-primary'>П</th>
			<th className='bg-primary'>К</th>
			<th className='bg-primary'>В</th>
			<th className='bg-primary'>П</th>
			<th className='bg-primary'>К</th>
			<th className='bg-primary'>В</th>
			<th className='bg-primary'>П</th>
			<th className='bg-primary'>К</th>
			<th className='bg-primary'>В</th>
			<th className='bg-primary'>П</th>
			<th className='bg-primary'>К</th>
			<th className='bg-primary'>В</th>
		</tr>
		<tr>
			<th className='bg-primary'>   1   </th>
			<th className='bg-primary'>   2   </th>
			<th className='bg-primary'>   3   </th>
			<th className='bg-primary'>   4   </th>
			<th className='bg-primary'>   5   </th>
			<th className='bg-primary'>   6   </th>
			<th className='bg-primary'>   7   </th>
			<th className='bg-primary'>   8   </th>
			<th className='bg-primary'>   9   </th>
			<th className='bg-primary'>   10   </th>
			<th className='bg-primary'>   11   </th>
			<th className='bg-primary'>   12   </th>
			<th className='bg-primary'>   13   </th>
			<th className='bg-primary'>   14   </th>
			<th className='bg-primary'>   15   </th>
			<th className='bg-primary'>   16   </th>
			<th className='bg-primary'>   17   </th>
			<th className='bg-primary'>   18   </th>
			<th className='bg-primary'>   19   </th>
			<th className='bg-primary'>   20   </th>
			<th className='bg-primary'>   21   </th>
			<th className='bg-primary'>   22   </th>
			<th className='bg-primary'>   23   </th>
			<th className='bg-primary'>   24   </th>
			<th className='bg-primary'>   25   </th>
			<th className='bg-primary'>   26   </th>
			<th className='bg-primary'>   27   </th>
			<th className='bg-primary'>   28   </th>
		</tr>
    </thead>
    <tbody>
            {tableData.map((row, rowIndex) => (
              <tr key={rowIndex}>
                {Object.keys(row).map((colName, index) => (
                  <td key={colName}>
                    <span className='d-none'>{row[colName]}</span>
                    <input
                      className="form-control"
                      id={row[colName]}
                      type="text"
                      value={row[colName]}
                      onChange={(e) => handleInputChange(rowIndex, colName, e.target.value)}
                      disabled={index === 0 || index === 3 }
                    />
                  </td>
                ))}
                <td className='position-relative'>
                  <button className='btn btn-danger position-absolute start-50 translate-middle' onClick={() => handleDelete(rowIndex)}><i className="fas fa-window-close"></i> </button>
                </td>
              </tr>
            ))}
             <tr>
            <td colSpan={21}>
            </td>
            <td colSpan={8}>
              <button className='btn btn-sm btn-primary zoom-5 rounded-pill ms-3 my-1'  onClick={handlerInsert}><i className="fas fa-add"></i> добавить запись</button>
              <button className='btn btn-sm btn-success zoom-5 rounded-pill ms-1'  onClick={() => handleSave(0)}><i className="fas fa-save"></i> сохранить документ</button>
            </td>
          </tr>
          </tbody>
        </table>
        <button className='position-relative start-100 btn btn-sm btn-primary zoom-5 rounded-pill' style={{'margin': '0px -6rem'}} onClick={handlerInsert}><i className="fas fa-add"></i> </button>
      	<button className='position-relative start-100 btn btn-sm btn-success zoom-5 rounded-pill' style={{'margin': '0px -3rem'}} onClick={() => handleSave(0)}><i className="fas fa-save"></i> </button>
  </div>
  {id_doc !== "newDoc" && (
        <div className="container">
          <h4 className='text-center mt-5'>Общие сведения</h4>
          <table className="table table-striped text-center">
            <thead>
              <tr>
                <th>Автор</th>
                <th>Дата создания</th>
                <th>Время последнего редактирования:</th>
              </tr>
            </thead>
            <tbody id="infoAboutDoc">
              <tr>
                <td>{author}</td>
                <td>{formatDate(dateCreateDoc)}</td>
                <td>{lastTimeEdit}</td>
              </tr>
            </tbody>
          </table>
        </div>
      )}
    </div>
    );
};

export default InvalidsTables;