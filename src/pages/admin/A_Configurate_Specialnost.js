import React, { useState, useEffect } from 'react';
import Header from '../Header';
import { url_api } from '../../tech/config';
import { showAlert } from '../../tech/alert';

const A_Configurate_Specialnost = () => {
    const [professions, setProfessions] = useState([]);
    const [selectedProfession, setSelectedProfession] = useState(null);
    const [newProfessionName, setNewProfessionName] = useState('');
    const [newProgramCode, setNewProgramCode] = useState('');
    const [newEducationAreaCode, setNewEducationAreaCode] = useState('');
    const [showAddModal, setShowAddModal] = useState(false);
    const [newProfessionCode, setNewProfessionCode] = useState('');
    const [searchText, setSearchText] = useState('')
    const [filteredProfessions, setFilteredProfessions] = useState(professions);




    const handleSearch = (text) => {
        setSearchText(text);
        if (text === '') {
            // Если searchText пустой, возвращаем все профессии
            setFilteredProfessions(professions);
        } else {
            // Иначе фильтруем профессии по profession_name и profession_code
            setTimeout(() => {
                const filtered = professions.filter(profession => {
                    return (
                        profession.profession_name.toLowerCase().includes(text.toLowerCase()) ||
                        profession.profession_code.includes(text)
                    );
                });
                setFilteredProfessions(filtered);
            }, 1000); // Задержка в 1000 миллисекунд (1 секунда)
        }
    };

    const handleProfessionCodeChange = (e) => {
       // Проверяем, что введенный символ является цифрой или точкой
       if (/^\d|\.$/.test(e.target.value)) {
        // Ограничиваем длину ввода
        if (e.target.value.length <= 8) {
            // Добавляем точки после каждых двух символов, кроме последней группы
            const formattedCode = e.target.value.replace(/\./g, '').match(/.{1,2}/g).join('.');
            setNewProfessionCode(formattedCode);
        }
    } else if (e.target.value === '') {
        // Если поле ввода пустое, разрешаем изменение
        setNewProfessionCode('');
    }
};
    useEffect(() => {
        fetchProfessions();
    }, []);

    const fetchProfessions = async () => {
    
        try {
            const response = await fetch(`${url_api}/api/get/professions`);
            const data = await response.json();
            setProfessions(data);
        } catch (error) {
            console.error('Error fetching professions:', error);
        }
    };



    

    const handleEditProfession = (profession) => {
        setSelectedProfession(profession);
        setNewProfessionName(profession.profession_name);
        setNewProgramCode(profession.program_code);
        setNewEducationAreaCode(profession.education_area_code);
    };
    
    const handleCancelEdit = () => {
        setSelectedProfession(null);
        setNewProfessionName('');
        setNewProgramCode('');
        setNewEducationAreaCode('');
    };
    const handleDeleteProfession = async (professionCode) => {
        try {
            const response = await fetch(`${url_api}/api/delete/profession`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    code: professionCode
                })
            });
            console.log(professionCode)

            if (response.ok) {
                // Удаление профессии прошло успешно
                setProfessions(professions.filter(profession => profession.profession_code !== professionCode));
                setFilteredProfessions(professions.filter(profession => profession.profession_code !== professionCode));
                setSelectedProfession(null); // Сброс выбранной профессии
                showAlert(`Специальность ${professionCode} успешно удалена`)
            } else {
                console.error('Failed to delete profession');
            }
        } catch (error) {
            console.error('Error deleting profession:', error);
        }
    };
    
    
    const handleSaveProfession = async () => {
        try {
            const response = await fetch(`${url_api}/api/update/profession`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json', // Изменяем Content-Type на application/json
                },
                body: JSON.stringify({
                    code: selectedProfession.profession_code,
                    profession_name: newProfessionName,
                    program_code: newProgramCode,
                    education_area_code: newEducationAreaCode
                })
            });
            
            if (response.ok) {
                setProfessions(professions.map(profession => {
                    if (profession.profession_code === selectedProfession.profession_code) {
                        return { 
                            ...profession, 
                            profession_name: newProfessionName,
                            program_code: newProgramCode,
                            education_area_code: newEducationAreaCode
                        };
                    }
                    return profession;
                }));

                setFilteredProfessions(professions.map(profession => {
                    if (profession.profession_code === selectedProfession.profession_code) {
                        return { 
                            ...profession, 
                            profession_name: newProfessionName,
                            program_code: newProgramCode,
                            education_area_code: newEducationAreaCode
                        };
                    }
                    return profession;
                }));

                showAlert(`Специальность ${selectedProfession.profession_code}  успешно обновлена`)
                setSelectedProfession(null); // Сброс выбранной профессии
            } else {
                console.error('Failed to update profession');
            }
        } catch (error) {
            console.error('Error updating profession:', error);
        }
    };


    const handleAddModalOpen = () => {
        setShowAddModal(true);
    };

    const handleAddModalClose = () => {
        setShowAddModal(false);
    };

    const handleAddProfession = async () => {
        try {
            const response = await fetch(`${url_api}/api/settings/add/profession`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    code: newProfessionCode,
                    profession_name: newProfessionName,
                    program_code: newProgramCode,
                    education_area_code: newEducationAreaCode
                })
            });
            const data = await response.json();
            if (response.ok) {
                // Успешно добавлено
                showAlert('Профессия успешно добавлена');
                // Сброс значений полей после добавления
                setNewProfessionCode('');
                setNewProfessionName('');
                setNewProgramCode('');
                setNewEducationAreaCode('');
                handleAddModalClose();
            } else {
                showAlert(data.message || 'Ошибка добавления профессии')
                console.error('Не удалось добавить профессию');
            }
        } catch (error) {
            console.error('Ошибка при добавлении профессии:', error);
        }
    };

    return (
        <div>
            <Header/>
            <div className="container">
                <div className="row justify-content">
                    <div className="col-md-auto">
                        <h3><a href="/admin-panel">Админ-панель</a> / <a href="/admin-panel/settings">настройки</a></h3>
                    </div>
                    <div className="w-50 mt-2  d-flex">
                            <input
                                    type="text"
                                    placeholder='Поиск..'
                                    className="form-control me-3"
                                    value={searchText}
                                    onChange={(e) => handleSearch(e.target.value)}
                                />
                        <button className="btn btn-primary zoom-5" onClick={handleAddModalOpen}>
                            Добавить новую профессию
                        </button>
                    </div>
                </div>
                <table className="table table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Название профессии</th>
                            <th>Код программы</th>
                            <th>Код области обучения</th>
                            <th>Действия</th>
                        </tr>
                    </thead>
                    <tbody>

                        {searchText != '' ? (
                             filteredProfessions.map((profession, index) => (
                                <tr key={profession.profession_code}>
                                <td>{profession.profession_code}</td>
                                <td>{profession.profession_name}</td>
                                <td>{profession.program_code ? profession.program_code : '-'}</td>
                                <td>{profession.education_area_code ? profession.education_area_code : '-'}</td>
                                <td>
                                    <button className="btn btn-danger ml-2 ms-1" onClick={() => handleDeleteProfession(profession.profession_code)}>Удалить</button>
                                    <button className="btn btn-primary ml-2 ms-1" onClick={() => handleEditProfession(profession)}>Редактировать</button>
                                </td>
                                </tr>
                            ))
                        ) : 
             ''
                        }
                            
                        {professions.length > 0 && searchText == '' ? (
                            professions.map(profession => (
                                <tr key={profession.profession_code}>
                                    <td>{profession.profession_code}</td>
                                    <td>{profession.profession_name}</td>
                                    <td>{profession.program_code ? profession.program_code : '-'}</td>
                                    <td>{profession.education_area_code ? profession.education_area_code : '-'}</td>
                                    <td>
                                        <button className="btn btn-danger ml-2 ms-1" onClick={() => handleDeleteProfession(profession.profession_code)}>Удалить</button>
                                        <button className="btn btn-primary ml-2 ms-1" onClick={() => handleEditProfession(profession)}>Редактировать</button>
                                    </td>
                                </tr>
                            ))
                        ) : (
   ''
                        )}
                    </tbody>
                </table>
            </div>
            {selectedProfession && (
                <div id="confirmModal2" className={`modal fade show d-block`} tabIndex="-1" aria-labelledby="confirmModalLabel2" aria-modal="true" role="dialog" >
                    <div className="modal-dialog modal-dialog-centered">
                        <div className="modal-content">
                            <div className="modal-header">
                                <h5 className="modal-title" id="confirmModalLabel2">Редактирование профессии</h5>
                                <button type="button" className="btn-close" data-bs-dismiss="modal" aria-label="Закрыть" onClick={handleCancelEdit}></button>
                            </div>
                            <div className="modal-body">
                                <p>Введите новое название профессии:</p>
                                <input
                                    type="text"
                                    className="form-control"
                                    value={newProfessionName}
                                    onChange={(e) => setNewProfessionName(e.target.value)}
                                />
                                <p>Введите новый код программы:</p>
                                <input
                                    type="text"
                                    className="form-control"
                                    value={newProgramCode}
                                    onChange={(e) => setNewProgramCode(e.target.value)}
                                />
                                <p>Введите новый код области обучения:</p>
                                <input
                                    type="text"
                                    className="form-control"
                                    value={newEducationAreaCode}
                                    onChange={(e) => setNewEducationAreaCode(e.target.value)}
                                />
                            </div>
                            <div className="modal-footer">
                                <button type="button" className="btn btn-secondary" onClick={handleCancelEdit}>Отмена</button>
                                <button type="button" className="btn btn-primary" onClick={handleSaveProfession}>Сохранить</button>
                            </div>
                        </div>
                    </div>
                </div>
            )}

            {showAddModal && (
                <div id="confirmModal2" className={`modal fade show d-block`} tabIndex="-1" aria-labelledby="confirmModalLabel2" aria-modal="true" role="dialog" >
                    <div className="modal-dialog modal-dialog-centered">
                        <div className="modal-content">
                            <div className="modal-header">
                                <h5 className="modal-title" id="confirmModalLabel2">Редактирование профессии</h5>
                                <button type="button" className="btn-close" data-bs-dismiss="modal" aria-label="Закрыть" onClick={handleAddModalClose}></button>
                            </div>
                            <div className="modal-body">
                                <p>Введите код:</p>
                                <input
                                    type="text"
                                    className="form-control"
                                    value={newProfessionCode}
                                    onChange={handleProfessionCodeChange}
                                />
                                <p>Введите название профессии:</p>
                                <input
                                    type="text"
                                    className="form-control"
                                    value={newProfessionName}
                                    onChange={(e) => setNewProfessionName(e.target.value)}
                                />
                                <p>Введите код программы:</p>
                                <input
                                    type="text"
                                    className="form-control"
                                    value={newProgramCode}
                                    onChange={(e) => setNewProgramCode(e.target.value)}
                                />
                                <p>Введите код области обучения:</p>
                                <input
                                    type="text"
                                    className="form-control"
                                    value={newEducationAreaCode}
                                    onChange={(e) => setNewEducationAreaCode(e.target.value)}
                                />
                            </div>
                            <div className="modal-footer">
                                <button type="button" className="btn btn-secondary" onClick={handleAddModalClose}>Отмена</button>
                                <button type="button" className="btn btn-primary" onClick={handleAddProfession}>Сохранить</button>
                            </div>
                        </div>
                    </div>
                </div>
            )}
        </div>
    );
};


export default A_Configurate_Specialnost;
