import xlsxwriter
import random
import string

# Создаем новый файл Excel
workbook = xlsxwriter.Workbook('cont_template_filled.xlsx')
worksheet = workbook.add_worksheet()

# Значения для записи
values = [
    ['№'] + [f'Value {i} (edit)' for i in range(1, 3)] + [f'{random.choice(string.ascii_letters + string.digits)}' for _ in range(8)]
]

# Записываем значения в 7 строку, столбцы с 1 по 10
for row_index, row_values in enumerate(values, start=1):
    for col_index, value in enumerate(row_values, start=1):
        worksheet.write(row_index+5, col_index-1, value)

# Сохраняем файл
workbook.close()
