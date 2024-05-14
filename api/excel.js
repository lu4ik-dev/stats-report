const fs = require('fs');
const XlsxPopulate = require('xlsx-populate');
const fetch = require('node-fetch');
const path = require('path'); // Добавлен модуль path для работы с путями


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

    // Fill 'not_exp'
    data.table.forEach((item, index) => {
      sheet.cell(8 + index, 17).value(item.not_exp);
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

// Пример вызова функции



function checkWorkExcel(message) {
  console.log(message);
}


module.exports = {
  getExcelExperience,
  checkWorkExcel
};