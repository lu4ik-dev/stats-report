import React, { useState, useEffect, useRef } from 'react';
import Header from './Header';
import * as XLSX from 'xlsx';
import { showAlert } from '../tech/alert';
import { formatDate } from '../tech/formatterDate';
import { url_api } from '../tech/config';



const EductionTable = () => {
  const userInfo = JSON.parse(localStorage.getItem("userInfo")).userInfo;
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
              col1: userInfo.complectName,
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
            },
          ]);
        } else {
          const response = await fetch(url_api + '/api/eduction-table/' + id_doc);
          const result = await response.json();
  
          if (response.ok) {
            setAuthor(result.complectName);
            setLastTimeEdit(result.timeLastEdit);
            setDateCreateDoc(result.dateCreate);
  
            setTableData(result.map((rowData, index) => {
              const have_obr = JSON.parse(rowData.have_obr);
              const kval_cat = JSON.parse(rowData.kval_cat);
  
              return {
                col1: userInfo.complectName || '',
                col2: rowData.name_of_indicators || '',
                col4: 0, // auto 
                col5: have_obr.col5 || 0,
                col6: have_obr.col6 || 0,
                col7: have_obr.col7 || 0,
                col8: have_obr.col8 || 0,
                col9: have_obr.col9 || 0,
                col10: have_obr.col10 || 0,
                col11: have_obr.col11 || 0,
                col12: have_obr.col12 || 0,
                col13: have_obr.col13 || 0,
                col14: have_obr.col14 || 0,
                col15: kval_cat.col15 || 0,
                col16: kval_cat.col16 || 0,
                col17: kval_cat.col17 || 0,
                col18: kval_cat.col18 || 0,
              };
            }));
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
    const id_doc = new URLSearchParams(window.location.search).get('id_doc');
    const now = new Date();
  
    const requestBody = {
      user_id: userInfo.id,
      id_doc: id_doc,
      table: tableData,
      timeLastEdit: formatDate(now),
    };
  
    const apiUrl = id_doc !== 'newDoc' ? '/api/updateEduction' : '/api/addEduction';
  
    fetch(url_api + apiUrl, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(requestBody),
    })
      .then((response) => response.json())
      .then((data) => {
        showAlert('Таблица успешно сохранена!');
        const currentUrl = window.location.href;
        const targetUrl = `http://localhost:3000/eduction-table?id_doc=${data.id}`;
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
    console.log(tableData)
    const intValue = parseInt(value, 10);
    const newValue = colName === 'col2' || colName === 'col3' ? value : isNaN(intValue) ? 0 : Math.min(Math.max(0, intValue), 999);
    
    setTableData((prevData) => {
      const newData = [...prevData];
      newData[rowIndex][colName] = newValue;

      if (colName === 'col5' || colName === 'col6' || colName === 'col7' || colName === 'col8' ) {

        newData[rowIndex].col5 = parseInt(newData[rowIndex].col6) + parseInt(newData[rowIndex].col7) + parseInt(newData[rowIndex].col8) + parseInt(newData[rowIndex].col9) + parseInt(newData[rowIndex].col10) + parseInt(newData[rowIndex].col11);
      }
      return newData;
    });
  };

  const exportToExcel = () => {

  };


  const handlerInsert = () => {
    setTableData((prevData) => [
      ...prevData,
      {
        col1: userInfo.complectName,
              col2: '',
              col3: prevData.length+1,
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
    return (
      <div>
        
      <Header />
        <div>
          
            <table className="iksweb">
	<thead>
		<tr>
			<th className='bg-primary'rowSpan="5">Наименование образовательной организации (филиала) (повторять в каждой строке)</th>
			<th className='bg-primary'rowSpan="4">Наименование показателей</th>
			<th className='bg-primary'rowSpan="4">№ строки</th>
			<th className='bg-primary'rowSpan="4">Всего, чел</th>
			<th className='bg-primary'colSpan="10">из них (из гр. 3) имеют образование:</th>
			<th className='bg-primary'colSpan="3">из гр. 3</th>
			<th className='bg-primary'rowSpan="4">численность работников в пересчете на полную занятость, ед.</th>
      <th className='bg-primary' rowSpan="5">Действие</th>
		</tr>
		<tr>
			<th className='bg-primary'rowSpan="3">высшее</th>
			<th className='bg-primary'rowSpan="3">из них (гр. 4) педагогическое</th>
			<th className='bg-primary'colSpan="5">из гр. 4 имеют</th>
			<th className='bg-primary'rowSpan="3">среднее профессиональное образование по программам подготовки специалистов среднего звена</th>
			<th className='bg-primary'rowSpan="3">из них (гр. 11) педагогическое</th>
			<th className='bg-primary'rowSpan="3">среднее профессиональное образование по программам подготовки квалификацированных рабочих, служащих</th>
			<th className='bg-primary'colSpan="2" rowSpan="2">имеют квалификационные категории</th>
			<th className='bg-primary'rowSpan="3">женщины</th>
		</tr>
		<tr>
			<th className='bg-primary'colSpan="3">ученую степень</th>
			<th className='bg-primary'colSpan="2">ученое звание</th>
		</tr>
		<tr>
			<th className='bg-primary'>доктора наук</th>
			<th className='bg-primary'>кандидата наук</th>
			<th className='bg-primary'>PhD</th>
			<th className='bg-primary'>профессора</th>
			<th className='bg-primary'>доцента</th>
			<th className='bg-primary'>высшую</th>
			<th className='bg-primary'>первую</th>
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
          </tbody>
</table>
<button className='position-relative start-100 btn btn-sm btn-primary zoom-5 rounded-pill' style={{'margin': '0px -6rem'}} onClick={handlerInsert}><i className="fas fa-add"></i> </button>
      	<button className='position-relative start-100 btn btn-sm btn-success zoom-5 rounded-pill' style={{'margin': '0px -3rem'}} onClick={() => handleSave(0)}><i className="fas fa-save"></i> </button>
        </div>
        </div>
    );
};

export default EductionTable;