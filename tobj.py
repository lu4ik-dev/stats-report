import json

# Чтение данных из файла specialties.json
with open('specialties.json', 'r', encoding='utf-8') as file:
    input_data = json.load(file)

# Новый список для результата
output_data = []

# Переменная для хранения текущего объекта без profession_code
current_object_without_code = None

# Итерация по входным данным
for sublist in input_data:
    for obj in sublist:
        if isinstance(obj, dict) and "profession_code" in obj:
            if obj["profession_code"] == "":
                # Если у текущего объекта отсутствует profession_code,
                # добавляем данные к предыдущему объекту
                if current_object_without_code is not None:
                    current_object_without_code["profession_name"].append(obj)
                else:
                    # Если это первый объект без profession_code, сохраняем его
                    current_object_without_code = {"profession_name": [obj]}
            else:
                # Если у объекта есть profession_code, добавляем его в результат
                output_data.append(obj)
                current_object_without_code = None  # Сбрасываем текущий объект без profession_code

# Если есть оставшийся объект без profession_code, добавляем его в результат
if current_object_without_code is not None:
    output_data.append(current_object_without_code)

# Запись результата в файл out.json
with open('out.json', 'w', encoding='utf-8') as output_file:
    json.dump(output_data, output_file, indent=2, ensure_ascii=False)
