
import {  Link  } from 'react-router-dom';
import Header from '../Header';
import React, {useState, useEffect} from 'react';
import { url_api } from '../../tech/config';
function A_Main() {
    const userInfo = JSON.parse(sessionStorage.getItem("userInfo")).userInfo;
    const [greeting, setGreeting] = useState('');

    useEffect(() => {
      const getCurrentTime = () => {
        const currentTime = new Date().getHours();
  
        if (currentTime >= 5 && currentTime < 12) {
          setGreeting('Доброе утро');
        } else if (currentTime >= 12 && currentTime < 18) {
          setGreeting('Добрый день');
        } else if (currentTime >= 18 && currentTime < 24) {
          setGreeting('Добрый вечер');
        } else {
          setGreeting('Доброй ночи');
        }
      };
  
      getCurrentTime(); 
  
      const intervalId = setInterval(getCurrentTime, 60000);
  
      return () => clearInterval(intervalId);
    }, []); 
  

    const handleBackup = () => {
      try {    // Выполняем запрос к API для создания резервной копии базы данных
        const response = fetch(url_api+'/backup', {
          method: 'POST',
        });

        if (!response.ok) {
          throw new Error('Ошибка создания резервной копии базы данных');
        }

        // Получаем файл резервной копии от сервера
        const blob =  response.blob();
        // Создаем ссылку для скачивания файла
        const url = window.URL.createObjectURL(blob);
        // Создаем ссылку для загрузки файла
        const link = document.createElement('a');
        link.href = url;
        link.setAttribute('download', 'stats-report-backup.sql');

        // Проверяем, поддерживается ли симуляция клика
        if (typeof link.download === 'undefined') {
          // Если браузер не поддерживает атрибут 'download'
          window.open(url);
        } else {
          // Если поддерживается, симулируем клик по ссылке для загрузки файла
          document.body.appendChild(link);
          link.click();
          // Удаляем ссылку из DOM после загрузки файла
          document.body.removeChild(link);
        }
      } catch (error) {
        console.error('Error backing up database:', error);
      }
};
    
    return (
        <div>
          <Header />
          <main>
            <div className="container px-4 py-5" id="featured-3">
            <h3 className="pb-2 border-bottom text-secondary"><b>{greeting},</b>  <span className={["System Administrator", "Administrator", "Администратор", 'Dmitriy'].includes(userInfo.complectName) ? "text-danger" : ""}>{userInfo.complectName}
  </span></h3>
                <div className="row">
                    <div className="col-sm-6 pb-3">
                        <div className="card">
                        <div className="card-body">
                            <h5 className="card-title">Организации</h5>
                            <p className="card-text">
                            Управление организациями
                            </p>

                            <Link to="/admin-panel/organizations" className="btn btn-primary">Перейти</Link>
                        </div>
                        </div>
                    </div>
                    <div className="col-sm-6 pb-3">
                        <div className="card">
                        <div className="card-body">
                            <h5 className="card-title">Заявки</h5>
                            <p className="card-text">
                            Заявки на регистрацию пользователя / организации
                            </p>
                            <Link to='/admin-panel/accepts' className="btn btn-primary">
                            Перейти
                            </Link>
                        </div>
                        </div>
                    </div>

                    <div className="col-sm-6 pb-3">
                        <div className="card">
                        <div className="card-body">
                            <h5 className="card-title">Настройки</h5>
                            <p className="card-text">
                            Настройки стандартных значений
                            </p>
                            <Link to='/admin-panel/settings' className="btn btn-primary">
                            Перейти
                            </Link>
                        </div>
                        </div>
                    </div>
                    <div className="col-sm-6 pb-3">
                        <div className="card">
                        <div className="card-body">
                            <h5 className="card-title">Логи</h5>
                            <p className="card-text">
                            Журнал действий 
                            </p>
                            <Link to='/admin-panel/logs' className="btn btn-primary">
                            Перейти
                            </Link>
                        </div>
                        </div>
                    </div>
                    <div className="col-sm-6 pb-3">
                        <div className="card">
                        <div className="card-body">
                            <h5 className="card-title">Пользователи</h5>
                            <p className="card-text">
                            Список аккаунтов пользователей 
                            </p>
                            <Link to='/admin-panel/users' className="btn btn-primary">
                            Перейти
                            </Link>
                        </div>
                        </div>
                    </div>
                    <div className="col-sm-6 pb-3">
                        <div className="card">
                        <div className="card-body">
                            <h5 className="card-title">В разработке</h5>
                            <p className="card-text">
                            ну а рил чё сюда вставить? рекламу? 
                            </p>
                            <button className="btn btn-primary" onClick={handleBackup}>
                              Получить базу данных
                            </button>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
            </main>
    
        </div>
      );
}

export default A_Main;