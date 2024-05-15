import React, { useState, useEffect, useRef } from 'react';
import { showAlert } from '../tech/alert';
import { url_api, url_web } from '../tech/config';
import * as XLSX from 'xlsx';
import { formatDate } from '../tech/formatterDate';

const DynamicTable = () => {
  const userInfo = JSON.parse(localStorage.getItem("userInfo")).userInfo;
  const [tableData, setTableData] = useState([ ]);
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
            col1: userInfo.complectName, 
            col2: 'Численность работников - всего (сумма строк 02, 06, 21, 22)',
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
            col18: 0 
          },
          { 
            col1: userInfo.complectName, 
            col2: 'в том числе: руководящие работники - всего',
            col3: 2, 
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
            col18: 0 
          },
          { 
            col1: userInfo.complectName, 
            col2: 'из них: директор (начальник)',
            col3: 3, 
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
            col18: 0 
          },
          { 
            col1: userInfo.complectName, 
            col2: 'из них: заместители директора (начальника)',
            col3: 4, 
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
            col18: 0 
          },
          { 
            col1: userInfo.complectName, 
            col2: 'из них: руководитель филиала',
            col3: 5, 
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
            col18: 0 
          },
          { 
            col1: userInfo.complectName, 
            col2: 'в том числе: педагогические работники - всего (сумма строк 07,12-20)',
            col3: 6, 
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
            col18: 0 
          },
          { 
            col1: userInfo.complectName, 
            col2: 'в том числе: преподаватели - всего (сумма строк 8-11)',
            col3: 7, 
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
            col18: 0 
          },
          { 
            col1: userInfo.complectName, 
            col2: 'из них: общеобразовательных дисциплин',
            col3: 8, 
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
            col18: 0 
          },
          { 
            col1: userInfo.complectName, 
            col2: "из них: общего гуманитарного и социально-экономического учебного цикла",
            col3: 9, 
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
            col18: 0 
          },
          { 
            col1: userInfo.complectName, 
            col2: "из них: математического и общего естественнонаучного учебного цикла",
            col3: 10, 
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
            col18: 0 
          },
          { 
            col1: userInfo.complectName, 
            col2: "из них: профессионального учебного цикла",
            col3: 11, 
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
            col18: 0 
          },
          { 
            col1: userInfo.complectName, 
            col2: "в том числе: мастера производственного обучения",
            col3: 12, 
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
            col18: 0 
          },
          { 
            col1: userInfo.complectName, 
            col2: "в том числе: социальные педагоги",
            col3: 13, 
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
            col18: 0 
          },
          { 
            col1: userInfo.complectName, 
            col2: "в том числе: педагоги-психологи",
            col3: 14, 
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
            col18: 0 
          },
          { 
            col1: userInfo.complectName, 
            col2: "в том числе: педагоги-организаторы",
            col3: 15, 
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
            col18: 0 
          },
          { 
            col1: userInfo.complectName, 
            col2: "в том числе: преподаватели-организаторы (основ безопасности жизнедеятельности, допризывной подготовки)",
            col3: 16, 
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
            col18: 0 
          },
          { 
            col1: userInfo.complectName, 
            col2: "в том числе: руководители физического воспитания",
            col3: 17, 
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
            col18: 0 
          },
          { 
            col1: userInfo.complectName, 
            col2: "в том числе: методисты",
            col3: 18, 
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
            col18: 0 
          },
          { 
            col1: userInfo.complectName, 
            col2: "в том числе: тьюторы",
            col3: 19, 
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
            col18: 0 
          },
          { 
            col1: userInfo.complectName, 
            col2: "в том числе: прочие",
            col3: 20, 
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
            col18: 0 
          },
          { 
            col1: userInfo.complectName, 
            col2: "в том числе: учебно-вспомогательный персонал",
            col3: 21, 
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
            col18: 0 
          },
          { 
            col1: userInfo.complectName, 
            col2: "в том числе: обслуживающий персонал",
            col3: 22, 
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
            col18: 0 
          }
        ]);
      } else {

        const response = await fetch(url_api + '/api/dataExpEmployee/' + id_doc);
        const result = await response.json();

        if (response.ok) {
          setTableData((prevData) => [
            ...prevData.slice(1),
            ...result.table.map((rowData, index) => {
              const allExpObject = JSON.parse(rowData.all_exp);
              const teachExpObject = JSON.parse(rowData.teach_exp);

              setAuthor(result.complectName);
              setLastEditor(result.lastEditFrom);
              setLastTimeEdit(result.timeLastEdit);
              setCity(result.cityname);
              setRegion(result.r_name);
              setDateCreateDoc(result.dateCreate);

              return {
                col1: result.complectName,
                col2: rowData.name_of_indicators || '',
                col3: prevData.length + 1 + index,
                col4: ((allExpObject.col5 || 0) + (allExpObject.col6 || 0) + (allExpObject.col7 || 0) + (allExpObject.col8 || 0) + (allExpObject.col9 || 0) + (allExpObject.col10 || 0)) || 0,
                col5: allExpObject.col5 || 0,
                col6: allExpObject.col6 || 0,
                col7: allExpObject.col7 || 0,
                col8: allExpObject.col8 || 0,
                col9: allExpObject.col9 || 0,
                col10: allExpObject.col10 || 0,
                col11: ((teachExpObject.col12 || 0) + (teachExpObject.col13 || 0) + (teachExpObject.col14 || 0) + (teachExpObject.col15 || 0) + (teachExpObject.col16 || 0) + (teachExpObject.col17 || 0)) ||  0,
                col12: teachExpObject.col12 || 0,
                col13: teachExpObject.col13 || 0,
                col14: teachExpObject.col14 || 0,
                col15: teachExpObject.col15 || 0,
                col16: teachExpObject.col16 || 0,
                col17: teachExpObject.col17 || 0,
                col18: rowData.not_exp,
              };
            }),
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
    const id_doc = new URLSearchParams(window.location.search).get("id_doc");
    const tableRows = [];

    tableData.forEach((row) => {
      const rowObject = {
        name_of_indicators: row.col2,
        common: {
          col4: row.col4,
          col5: row.col5,
          col6: row.col6,
          col7: row.col7,
          col8: row.col8,
          col9: row.col9,
          col10: row.col10,
        },
        teacher: {
          col12: row.col12,
          col13: row.col13,
          col14: row.col14,
          col15: row.col15,
          col16: row.col16,
          col17: row.col17,
          col18: row.col18,
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

    const apiUrl = id_doc !== 'newDoc' ? '/api/updateWorkExperienceBody' : '/api/addWorkExperience';

    fetch(url_api + apiUrl, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        user_id: userInfo.id,
        id_doc: id_doc,
        table: tableRows,
        timeLastEdit: formatDate(now),
      }),
    })
      .then((response) => response.json())
      .then((data) => {
        showAlert('Таблица успешно сохранена!');
        const currentUrl = window.location.href;
        const targetUrl = `http://${url_web}:3000/experience?id_doc=${data.id}`;
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
    const newValue = colName === 'col2' ? value : isNaN(intValue) ? 0 : Math.min(Math.max(0, intValue), 999);

    setTableData((prevData) => {
      const newData = [...prevData];
      newData[rowIndex][colName] = newValue;

      if (colName === 'col5' || colName === 'col6' || colName === 'col7' || colName === 'col8' || colName === 'col9' || colName === 'col10') {
        newData[rowIndex].col4 = parseInt(newData[rowIndex].col5) + parseInt(newData[rowIndex].col6) + parseInt(newData[rowIndex].col7) + parseInt(newData[rowIndex].col8) + parseInt(newData[rowIndex].col9) + parseInt(newData[rowIndex].col10);
      } else if (colName === 'col12' || colName === 'col13' || colName === 'col14' || colName === 'col15' || colName === 'col16' || colName === 'col17') {
        newData[rowIndex].col11 = parseInt(newData[rowIndex].col12 + parseInt(newData[rowIndex].col13) + parseInt(newData[rowIndex].col14) + parseInt(newData[rowIndex].col15) + parseInt(newData[rowIndex].col16) + parseInt(newData[rowIndex].col17) );
      }
      return newData;
    });
  };

  const exportToExcel = () => {
    const url = `${url_api}/api/getExcelExperience/${id_doc}`;
    window.location.href = url;
  };


  const handlerInsert = () => {
    setTableData((prevData) => [
      ...prevData,
      {
        col1: userInfo.complectName,
        col2: '',
        col3: prevData.length + 1,
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
      },
    ]);
  };
  const id_doc = new URLSearchParams(window.location.search).get("id_doc");
  return (
    <div>
        <div className="d-flex flex-wrap justify-content-center py-1 mb-2">
                <span className="d-flex align-items-center mb-1 mb-md-0 me-md-auto text-dark fs-5 ms-3"><a href="/experience">Распределение персонала по стажу работы</a></span>
            <ul className="nav nav-pills me-3">
                <button className="btn btn-primary zoom-5" aria-current="page" onClick={exportToExcel}>
                    Экспорт в CSV
                </button>
            </ul>
        </div>
      <table className="iksweb" id="experinceTable">
        <tr className='bg-primary'>
            <th className='bg-primary' rowSpan={3} width="8%">
              Наименование образовательной организации (филиала)(повторять в
              каждой строке)
            </th>
            <th className='bg-primary' width="15%" rowSpan={2}>Наименование показателей</th>
            <th className='bg-primary' rowSpan={2} width="3%">№ строки</th>
            <th className='bg-primary' rowSpan={2} width="4%">Всего (сумма гр. 4-9)</th>
            <th className='bg-primary' colSpan={6} width="4%">из гр. 3 - имеют общий стаж работы, лет</th>
            <th className='bg-primary' rowSpan={2} width="7%">
              из гр. 3 имеют педагогический стаж работы, всего (сумма гр. 11-16)
            </th>
            <th className='bg-primary' colSpan={6} width="7%">
              из гр. 10 - имеют педагогический стаж работы, лет
            </th>
            <th className='bg-primary' rowSpan={2} width="7%">Не имеют педагогического стажа работы</th>
            { userInfo.admin_lvl >= 1 ?  <th className='bg-primary' rowSpan={3} width="4%">Действие</th>   : '' }
          </tr>
          <tr>
            <th className='bg-primary' width="7%">до 3</th>
            <th className='bg-primary' width="7%">от 3 до 5</th>
            <th className='bg-primary' width="7%">от 5 до 10</th>
            <th className='bg-primary' width="7%">от 10 до 15</th>
            <th className='bg-primary' width="7%">от 15 до 20</th>
            <th className='bg-primary' width="7%">20 и более</th>
            <th className='bg-primary' width="7%">до 3</th>
            <th className='bg-primary' width="7%">от 3 до 5</th>
            <th className='bg-primary' width="7%">от 5 до 10</th>
            <th className='bg-primary' width="7%">от 10 до 15</th>
            <th className='bg-primary' width="7%">от 15 до 20</th>
            <th className='bg-primary' width="7%">20 и более</th>
          </tr>
          <tr>
            <th className='bg-primary'>1</th>
            <th className='bg-primary'>2</th>
            <th className='bg-primary'>3</th>
            <th className='bg-primary'>4</th>
            <th className='bg-primary'>5</th>
            <th className='bg-primary'>6</th>
            <th className='bg-primary'>7</th>
            <th className='bg-primary'>8</th>
            <th className='bg-primary'>9</th>
            <th className='bg-primary'>10</th>
            <th className='bg-primary'>11</th>
            <th className='bg-primary'>12</th>
            <th className='bg-primary'>13</th>
            <th className='bg-primary'>14</th>
            <th className='bg-primary'>15</th>
            <th className='bg-primary'>16</th>
            <th className='bg-primary'>17</th>
          </tr>
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
                    disabled={index === 0 || index === 2 || index === 3 || index === 10 || index === 1}
                  />
                </td>
              ))}
            { userInfo.admin_lvl >= 1 ?    <td className='position-relative'>
                <button className='btn btn-danger position-absolute start-50 translate-middle' onClick={() => handleDelete(rowIndex)}><i className="fas fa-window-close"></i> </button>
              </td>  : '' }
            </tr>
          ))}
          <tr>
            <td colSpan={17}>
            </td>
            <td colSpan={2}>
            { userInfo.admin_lvl >= 1 ? <button className='btn btn-sm btn-primary zoom-5 rounded-pill ms-3 my-1'  onClick={handlerInsert}><i className="fas fa-add"></i> добавить запись</button> : '' }
              <button className='btn btn-sm btn-success zoom-5 rounded-pill ms-1'  onClick={() => handleSave(0)}><i className="fas fa-save"></i> сохранить документ</button>
            </td>
          </tr>
        </tbody>
      </table>
      { userInfo.admin_lvl >= 1 ?   <button className='position-relative start-100 btn btn-sm btn-primary zoom-5 rounded-pill' style={{'margin': '0px -6rem'}} onClick={handlerInsert}><i className="fas fa-add"></i> </button>
         : '' }
        <button className='position-relative start-100 btn btn-sm btn-success zoom-5 rounded-pill' style={  userInfo.admin_lvl >= 1 ?  {'margin': '0px -3rem'}  : {'margin': '0px -9rem'} } onClick={() => handleSave(0)}><i className="fas fa-save"></i>  { userInfo.admin_lvl >= 1 ?  ''  : 'Сохранить' }</button>

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

export default DynamicTable;