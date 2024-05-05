const fs = require('fs');
const XlsxPopulate = require('xlsx-populate');


a = 1;
switch (a) {
  case 1:
    const sourceFileName = 'exp_template.xlsx';
    const intermediateFileName = 'exp_template_temp.xlsx';
    const resultFileName = `res_${Date.now()}.xlsx`;
    fs.copyFile(sourceFileName, intermediateFileName, (err) => {
      if (err) {
        console.error(`Ошибка копирования файла ${sourceFileName}:`, err);
        return;
      }
      console.log(`Файл ${sourceFileName} успешно скопирован как ${intermediateFileName}`);
      XlsxPopulate.fromFileAsync(intermediateFileName)
        .then(workbook => {
          const sheet = workbook.sheet(0);
          // Заполнение ячеек A8-A29
          for (let i = 8; i <= 29; i++) {
            sheet.cell(`A${i}`).value('ГАПОУ "БНК"');
          }
          // Заполнение ячеек D8-R29 рандомными числами от 0 до 20
          for (let row = 8; row <= 29; row++) {
            for (let col = 4; col <= 18; col++) {
              sheet.cell(row, col).value(Math.floor(Math.random() * 21));
            }
          }
          // Сохранение результата
          return workbook.toFileAsync(resultFileName);
        })
        .then(() => {
          console.log(`Результат сохранен в файл ${resultFileName}`);
          // Удаление промежуточного файла
          fs.unlink(intermediateFileName, (err) => {
            if (err) {
              console.error(`Ошибка удаления промежуточного файла ${intermediateFileName}:`, err);
              return;
            }
            console.log(`Промежуточный файл ${intermediateFileName} удален`);
          });
        })
        .catch((error) => {
          console.error('Произошла ошибка:', error);
        });
    });
    break;

  default:
    break;
}
