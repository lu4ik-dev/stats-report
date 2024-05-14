import React, { useState, useEffect } from 'react';
import Header from './Header';
import * as XLSX from 'xlsx';
import { url_api } from '../tech/config';
import { formatDate } from '../tech/formatterDate';
import { showAlert } from '../tech/alert';


const ContingentTable = () => {
  const [tableData, setTableData] = useState([]);
  const [author, setAuthor] = useState('');
  const [lastTimeEdit, setLastTimeEdit] = useState('');
  const [dateCreateDoc, setDateCreateDoc] = useState('');
  const userInfo = JSON.parse(localStorage.getItem("userInfo")).userInfo;

  const exportToExcel = () => {
    const ws = XLSX.utils.table_to_sheet(document.getElementById('contingent'));
    const wb = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(wb, ws, 'Sheet1');
    XLSX.writeFile(wb, 'Контингент.xls');
  };

  const handleSave = () => {
    let id_doc = new URLSearchParams(window.location.search).get("id_doc");
    const tableRows = [];
    
    tableData.forEach((row) => {
    const rowObject = {
      id_doc: id_doc,
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
      id_doc: id_doc,
    timeLastEdit: formatDate(now),
    user_id: userInfo.id,
    table: tableRows,
    };
    
    const apiUrl = id_doc !== 'newDoc' ? '/api/updateContingent' : '/api/addContingent';
    fetch(url_api + apiUrl, {
    method: 'POST',
    headers: {
    'Content-Type': 'application/json',
    },
    body: JSON.stringify(requestBody),
    })
    .then((response) => response.text())
    .then((data) => {
      console.log(JSON.stringify(data))
    showAlert('Таблица успешно сохранена!');
    const currentUrl = window.location.href;
    const targetUrl = `http://localhost:3000/contingent-tables?id_doc=${data.id}`;
    if (currentUrl !== targetUrl) {
    //window.location.href = targetUrl;
    } else {
    //window.location.reload();
    }
    })
    .catch((error) => {
    console.error('Ошибка при отправке запроса:', error);
    });
    };
  
  const handlerInsert = () => {
    setTableData((prevData) => [
      ...prevData,
      {
		col1: prevData.length + 1,
		col2: userInfo.complectName,
        col3: '',
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
      },
    ]);
  };

  const fetchData = async () => {
    try {
      const id_doc = new URLSearchParams(window.location.search).get('id_doc');

      if (!id_doc || id_doc === 'newDoc') {
        setTableData((prevData) => [
			...prevData,
			{
            col1: prevData.length + 1,
            col2: userInfo.complectName,
			col3: '',
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
          },
        ]);
      } else {
        const response = await fetch(url_api + '/api/contingent-table/' + id_doc);
        const result = await response.json();

        if (response.ok) {
			setAuthor(result[0].complectName); // Update to use the correct property
			setDateCreateDoc(result[0].dateCreate);

          setTableData(
            result.map((rowData, index) => {
              return {
				col1: '     '+rowData.id || '     '+index + 1,
				col2: rowData.complectName || '',
				col3: rowData.Training_Program || '', // Training_Program property from your API response
				col4: rowData.Standard_Category || '',
				col5: rowData.Occupation_Code || '',
				col6: rowData.Specialty_Name || '',
				col7: rowData.Duration_of_Study || '',
				col8: rowData.Form_of_Education || '',
				col9: rowData.Course || '',
				col10: rowData.Average_Grade_of_Certificate || '',
				col11: rowData.Number_of_KCP_According_to_Founder_Order || '',
				col12: rowData.Total_Students_Count || '',
				col13: rowData.Federal_Budget_Students_Count || '',
				col14: rowData.Regional_Budget_Students_Count || '',
				col15: rowData.Targeted_Training_Students_Count || '',
				col16: rowData.Tuition_Paying_Students_Count || '',
				col17: rowData.Foreign_Students_Count || '',
				col18: rowData.Orphan_Children_Count || '',
				col19: rowData.Children_without_Parental_Care_Count || '',
				col20: rowData.Students_in_Need_of_Housing_Count || '',
				col21: rowData.Provided_Dormitory_Space_Count || '',
				col22: rowData.Denied_Dormitory_Space_Count || '',
				col23: rowData.Graduation_Year_2024_Count || '',
				col24: rowData.Number_of_Taking_Demonstration_Exam_GIA || '',
				col25: rowData.Number_of_Taking_Demonstration_Exam_Intermediate_Assessment || '',
				col26: rowData.Demonstration_Exam_Basic_Level_Count || '',
				col27: rowData.Demonstration_Exam_Professional_Level_Count || '',
              };
            })
          );
        } else {
          console.error('Error fetching data:', result.error);
        }
      }
    } catch (error) {
      console.error('Error fetching data:', error);
    }
  };

  useEffect(() => {
    fetchData();
  }, []);

  const handleDelete = (rowIndex) => {
    setTableData((prevData) => {
      const newData = [...prevData];
      newData.splice(rowIndex, 1);
      return newData;
    });
  };

  const handleInputChange = (rowIndex, colName, value) => {
    const intValue = parseInt(value, 10);
    const newValue = colName === 'col2' ? value : isNaN(intValue) ? 0 : Math.min(Math.max(0, intValue), 999);

    setTableData((prevData) => {
      const newData = [...prevData];
      newData[rowIndex][colName] = newValue;

      if (colName === 'col5' || colName === 'col6' || colName === 'col7' || colName === 'col8' || colName === 'col9' || colName === 'col10') {
        newData[rowIndex].col4 =
          parseInt(newData[rowIndex].col5) +
          parseInt(newData[rowIndex].col6) +
          parseInt(newData[rowIndex].col7) +
          parseInt(newData[rowIndex].col8) +
          parseInt(newData[rowIndex].col9) +
          parseInt(newData[rowIndex].col10);
      } else if (colName === 'col12' || colName === 'col13' || colName === 'col14' || colName === 'col15' || colName === 'col16' || colName === 'col17') {
        newData[rowIndex].col11 =
          parseInt(newData[rowIndex].col13) +
          parseInt(newData[rowIndex].col14) +
          parseInt(newData[rowIndex].col15) +
          parseInt(newData[rowIndex].col16) +
          parseInt(newData[rowIndex].col17) +
          parseInt(newData[rowIndex].col12);
      }
      return newData;
    });
  };
  const id_doc = new URLSearchParams(window.location.search).get('id_doc');
  return (
    
    <div>
           { (!id_doc || id_doc === 'newDoc') ? <Header /> : '' }
	  <div>
      
		<div className="d-flex flex-wrap justify-content-center py-1 mb-2">
                <span className="d-flex align-items-center mb-1 mb-md-0 me-md-auto text-dark fs-5 ms-3"><a href="/contingent">Распределение </a></span>
            <ul className="nav nav-pills me-3">
                <button className="btn btn-primary zoom-5" aria-current="page" onClick={exportToExcel}>
                    Экспорт в CSV
                </button>
            </ul>
        </div>
            <table className="iksweb" id="contingent">
			<tbody>
		<tr>
			<th className="bg-primary" style={{width: '10rem'}} rowSpan="2">        №        </th>
			<th className="bg-primary" rowSpan="2">Наименование образовательной организации (филиала) (повторять в каждой строке)</th>
			<th className="bg-primary" rowSpan="2">Программы подготовки (ППССЗ/ППКРС) (выбрать из раскрывающегося списка)</th>
			<th className="bg-primary" rowSpan="2">Категория стандарта</th>
			<th className="bg-primary" rowSpan="2">Код профессии, специальности в формате хх.хх.хх 
в соответствии с приказом Минобрнауки России от 29 октября 2013 г. № 1199 (выбрать из раскрывающегося списка,)</th>
			<th className="bg-primary" rowSpan="2"> Наименование специальности (добавляется автоматически при корректном вводе кода)</th>
			<th className="bg-primary" rowSpan="2">Срок  обучения</th>
			<th className="bg-primary" rowSpan="2">Форма обучения (очная, очно-заочная, заочная) (выбрать из раскрывающегося списка)</th>
			<th className="bg-primary" rowSpan="2">Курс</th>
			<th className="bg-primary" rowSpan="2">Средний балл аттестат                 (для I курса)</th>
			<th className="bg-primary" rowSpan="2">Количество КЦП согласно приказу учредителя</th>
			<th className="bg-primary" rowSpan="2">Количество студентов всего                    (гр 12=  гр13 + гр14 + гр16)</th>
			<th className="bg-primary" colSpan="4">Из них количество студентов и источник финансового обеспечения, руб.</th>
			<th className="bg-primary" rowSpan="2">Количество иностранных студентов, чел.</th>
			<th className="bg-primary" rowSpan="2">Количество детей-сирот, чел.</th>
			<th className="bg-primary" rowSpan="2">Количество детей, оставшихся без попечения родителей, чел.</th>
			<th className="bg-primary" rowSpan="2">Количество студентов нуждающихся в общежитии, чел.</th>
			<th className="bg-primary" rowSpan="2">из них (гр. 20)   предоставлено место в общежитии, чел.</th>
			<th className="bg-primary" rowSpan="2">из них (гр. 20)  отказано по причине отсутствия мест в общежитии, чел.</th>
			<th className="bg-primary" rowSpan="2"> Выпуск  в 2024г. (кол-во человек)</th>
			<th className="bg-primary" colSpan="2">из них (гр. 23) количество выпускников  сдающих демонстрационный экзамен  (указать количество человек)</th>
			<th className="bg-primary" colSpan="2">из них (гр. 23) (Приказ Минпросвещения № 800 от 08.10.2021) демонстрационный экзамен проводился на (указать количество человек)</th>
			<th className="bg-primary" rowSpan="3">Действие</th>
		</tr>
		<tr>
			<th className="bg-primary">Количество студентов, обучающихся за счёт средств федерального бюджета</th>
			<th className="bg-primary">Количество студентов, обучающихся за счёт средств бюджета субъекта РФ</th>
			<th className="bg-primary">Количество студентов, обучающихся по целевому обучению         (в т.ч. из гр.13 или 14)</th>
			<th className="bg-primary"> Количество студентов, обучающихся на основании договоров об оказании платных образовательных услуг</th>
			<th className="bg-primary">в рамках ГИА</th>
			<th className="bg-primary">в рамках промежуточной аттестации</th>
			<th className="bg-primary">базовом уровне</th>
			<th className="bg-primary">профессиональном уровне</th>
		</tr>
		<tr>
			<th className="bg-primary">1</th>
			<th className="bg-primary">2</th>
			<th className="bg-primary">3</th>
			<th className="bg-primary">4</th>
			<th className="bg-primary">5</th>
			<th className="bg-primary">6</th>
			<th className="bg-primary">7</th>
			<th className="bg-primary">8</th>
			<th className="bg-primary">9</th>
			<th className="bg-primary">10</th>
			<th className="bg-primary">11</th>
			<th className="bg-primary">12</th>
			<th className="bg-primary">13</th>
			<th className="bg-primary">14</th>
			<th className="bg-primary">15</th>
			<th className="bg-primary">16</th>
			<th className="bg-primary">17</th>
			<th className="bg-primary">18</th>
			<th className="bg-primary">19</th>
			<th className="bg-primary">20</th>
			<th className="bg-primary">21</th>
			<th className="bg-primary">22</th>
			<th className="bg-primary">23</th>
			<th className="bg-primary">24</th>
			<th className="bg-primary">25</th>
			<th className="bg-primary">26</th>
			<th className="bg-primary">27</th>
		</tr>
            {tableData.map((row, rowIndex) => (
              <tr key={rowIndex}>
                {Object.keys(row).map((colName, index) => (
                  <td key={colName}>
                    <span className="d-none">{row[colName]}</span>
                    <input
                      className="form-control"
                      id={row[colName]}
                      type="text"
                      value={row[colName]}
                      onChange={(e) => handleInputChange(rowIndex, colName, e.target.value)}
                      disabled={index === 0 || index === 2 || index === 3 || index === 10}
                    />
                  </td>
                ))}
                <td className="position-relative">
                  <button className="btn btn-danger position-absolute start-50 translate-middle" onClick={() => handleDelete(rowIndex)}>
                    <i className="fas fa-window-close"></i>{' '}
                  </button>
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
    </div>
    );
};


export default ContingentTable;