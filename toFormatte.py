import json

# Загрузка данных из файла с явным указанием кодировки UTF-8
with open('out.json', 'r', encoding='utf-8') as file:
    data = json.load(file)

# Проход по каждому объекту в данных
for obj in data:
    # Проверка, есть ли программный код и код образовательной области
    if 'program_code' not in obj:
        obj['program_code'] = ""
    if 'education_area_code' not in obj:
        obj['education_area_code'] = ""
    
    # Проверка, существует ли уже список профессий, иначе создание
    if 'professions' not in obj:
        obj['professions'] = []
    
    # Удаление дубликатов
    if obj not in obj['professions']:
        obj['professions'].append(obj.copy())

# Сохранение обновленных данных в файл
with open('out_updated.json', 'w', encoding='utf-8') as file:
    json.dump(data, file, ensure_ascii=False, indent=2)
