const fs = require('fs');
const XlsxPopulate = require('xlsx-populate');
const fetch = require('node-fetch');
const path = require('path'); // Добавлен модуль path для работы с путями


async function getExcelInvalids(id_doc, sourceFileName = 'ovz_template.xlsx', intermediateFileName = 'ovz_template_temp.xlsx') {
  try {
    await fs.promises.copyFile(sourceFileName, intermediateFileName);
    console.log(`[T]: Файл ${sourceFileName} успешно скопирован как ${intermediateFileName}`);

    const response = await fetch(`http://localhost:3110/api/invalids-table/${id_doc}`);
    const data = await response.json();

    const workbook = await XlsxPopulate.fromFileAsync(intermediateFileName);
    const sheet = workbook.sheet(0);

    // Переместить A10:AB16 вниз на количество строк данных из API
    const numRows = data.length;
    const startRow = 10;
    const endRow = 16 + numRows - 1; // Вычисляем конечную строку после смещения
    sheet.cell("A1").value("Значение ячейки A1");
    console.log(`[T]: Проверочная запись успешно выполнена`)

    data.forEach((obj, index) => {
      const rowIndex = 10 + index; // Начинаем заполнение с 10 строки
      sheet.cell(rowIndex, 1).value(obj.name_poo);
      sheet.cell(rowIndex, 2).value(obj.specialnost);
      sheet.cell(rowIndex, 3).value(obj.code_of_specialnost);
    
      // Заполнение counts (5-9 столбцы)
      const counts = JSON.parse(obj.counts);
      Object.keys(counts).forEach((key, i) => {
        const columnIndex = 5 + i; // Начальный индекс столбца, с которого начинаются counts (col5)
        sheet.cell(rowIndex, columnIndex).value(counts[key]);
      });
    
      // Сумма counts (4 столбец)
      const countsSum = Object.values(counts).reduce((acc, curr) => acc + curr, 0);
      sheet.cell(rowIndex, 4).value(countsSum);
      
      // Заполнение diagnoses (11-28 столбцы)
      const diagnoses = JSON.parse(obj.diagnoses);
      Object.keys(diagnoses).forEach((key, i) => {
        const columnIndex = 11 + i; // Начальный индекс столбца, с которого начинаются diagnoses (col11)
        const value = diagnoses[key];
        sheet.cell(rowIndex, columnIndex).value(value);
      });
    
      // Вычисление суммы значений в столбцах с 11 по 28
      const sum = Object.values(diagnoses).reduce((acc, curr) => acc + curr, 0);
    
      // Запись суммы в 10 столбец
      sheet.cell(rowIndex, 10).value(sum);
    });
    

    const outputFileName = `invalids_${Date.now()}.xlsx`;
    const outputPath = path.join(__dirname, outputFileName);

    await workbook.toFileAsync(outputPath);
    console.log(`[T]: Результат сохранен в файл ${outputPath}`);

    await fs.promises.unlink(intermediateFileName);
    console.log(`[T]: Промежуточный файл ${intermediateFileName} удален`);

    return outputPath;
  } catch (error) {
    console.error('[T]: Произошла ошибка:', error);
    
  }
}


async function getExcelExperience(id_doc, sourceFileName='exp_template.xlsx', intermediateFileName='exp_template_temp.xlsx') {
  try {
    await fs.promises.copyFile(sourceFileName, intermediateFileName);

    console.log(`[T]: Файл ${sourceFileName} успешно скопирован как ${intermediateFileName}`);

    const response = await fetch(`http://localhost:3110/api/dataExpEmployee/${id_doc}`);
    const data = await response.json();

    const workbook = await XlsxPopulate.fromFileAsync(intermediateFileName);
    const sheet = workbook.sheet(0);

    // Fill 'complectName' in column A for each row


    // Fill 'name_of_indicators' in the second column
    data.table.forEach((item, index) => {
      sheet.cell(8+index,1).value(data.complectName);

      sheet.cell(8 + index, 2).value(item.name_of_indicators);
      sheet.cell(8 + index, 3).value(index+1);
    });

    // Fill 'all_exp'
    data.table.forEach((item, index) => {
      const allExp = JSON.parse(item.all_exp);
      Object.keys(allExp).forEach(key => {
        sheet.cell(8 + index, parseInt(key.substring(3)) + 0).value(allExp[key]);
      });
    });

    // Fill 'teach_exp'
    data.table.forEach((item, index) => {
      const teachExp = JSON.parse(item.teach_exp);
      Object.keys(teachExp).forEach(key => {
        sheet.cell(8 + index, parseInt(key.substring(3)) + 0).value(teachExp[key]);
      });
    });

    data.table.forEach((item, index) => {
      const teachExp = JSON.parse(item.teach_exp);
      
      // Исключаем последний объект из teachExp
      const keys = Object.keys(teachExp).slice(0, -1);
      
      // Вычисляем сумму значений, исключая последний объект
      const teachExpSum = keys.reduce((acc, key) => acc + teachExp[key], 0);
      
      sheet.cell(8 + index, 11).value(teachExpSum);
    });


    // Fill 'not_exp'
    data.table.forEach((item, index) => {
      sheet.cell(8 + index, 18).value(item.not_exp);
    });

    const outputFileName = `experience_${Date.now()}.xlsx`; // Генерация имени файла
    const outputPath = path.join(__dirname, outputFileName); // Формирование пути к файлу

    await workbook.toFileAsync(outputPath); // Сохранение файла по сформированному пути
    console.log(`[T]: Результат сохранен в файл ${outputPath}`);

    await fs.promises.unlink(intermediateFileName);
    console.log(`[T]: Промежуточный файл ${intermediateFileName} удален`);
    
    return outputPath; // Возврат полного пути к файлу
  } catch (error) {
    console.error('[T]: Произошла ошибка:', error);
  }
}


async function getExcelEduction(id_doc, sourceFileName='edu_template.xlsx', intermediateFileName='edu_template_temp.xlsx') {
  try {
    await fs.promises.copyFile(sourceFileName, intermediateFileName);
    console.log(`[T]: Файл ${sourceFileName} успешно скопирован как ${intermediateFileName}`);

    const response = await fetch(`http://localhost:3110/api/eduction-table/${id_doc}`);
    const data = await response.json();

    const workbook = await XlsxPopulate.fromFileAsync(intermediateFileName);
    const sheet = workbook.sheet(0);

    // Starting row index
    let rowIndex = 10;

    // Fill data for each item in the API response
    data.forEach((item, index) => {
      sheet.cell(rowIndex, 1).value(item.complectName); // complectName
      sheet.cell(rowIndex, 2).value(item.name_of_indicators); // name_of_indicators
      sheet.cell(rowIndex, 3).value(index + 1); // Row number

      // Sum of have_obr


      // Fill have_obr columns col5 to col14
      const haveObr = JSON.parse(item.have_obr);
      const haveObrSum = [5, 6, 7, 8, 9, 10,11].reduce((acc, col) => acc + (haveObr[`col${col}`] || 0), 0);
sheet.cell(rowIndex, 4).value(haveObrSum); // Sum of have_obr col5 to col10
      for (let i = 5; i <= 14; i++) {
        sheet.cell(rowIndex, i).value(haveObr[`col${i}`]);
      }

      // Fill kval_cat columns col15 to col17
      const kvalCat = JSON.parse(item.kval_cat);
      for (let i = 15; i <= 17; i++) {
        sheet.cell(rowIndex, i).value(kvalCat[`col${i}`]);
      }

      rowIndex++; // Move to the next row
    });

    // Save the workbook
    const outputFileName = `eduction_${Date.now()}.xlsx`;
    const outputPath = path.join(__dirname, outputFileName);
    await workbook.toFileAsync(outputPath);
    console.log(`[T]: Результат сохранен в файл ${outputPath}`);

    // Delete the intermediate file
    await fs.promises.unlink(intermediateFileName);
    console.log(`[T]: Промежуточный файл ${intermediateFileName} удален`);

    return outputPath; // Return the full path to the file
  } catch (error) {
    console.error('[T]: Произошла ошибка:', error);
  }
}

function checkWorkExcel(message) {
  console.log(message);
}


module.exports = {
  getExcelExperience,
  getExcelEduction,
  getExcelInvalids,
  checkWorkExcel
};