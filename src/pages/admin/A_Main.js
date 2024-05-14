
import {  Link  } from 'react-router-dom';
import Header from '../Header';
import React, {useState, useEffect} from 'react';
import { url_api } from '../../tech/config';
function A_Main() {
    const userInfo = JSON.parse(localStorage.getItem("userInfo")).userInfo;
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
  
  
    
      const handleBackup = async () => {
        const url = `${url_api}/backup`;
        window.location.href = url;
      };
    return (
        <div>
          <Header />
          <main>
            <div className="container px-4 py-5" id="featured-3">
            <h3 className="pb-2 border-bottom text-secondary"><b>{greeting},</b>  <span className={["System Administrator", "Administrator", "Администратор", 'Dmitriy'].includes(userInfo.complectName) ? "text-danger" : ""}>{userInfo.complectName}
  </span></h3>
                <div className="row">
                    <div className="col-sm-6 pb-3 zoom-5">
                        <div className="card ">
                        <div className="card-body ">
                            <h5 className="card-title">Организации</h5>
                            <p className="card-text">
                            Управление организациями
                            </p>

                            <Link to="/admin-panel/organizations" className="btn btn-primary">Перейти</Link>
                        </div>
                        </div>
                    </div>
                    <div className="col-sm-6 pb-3 zoom-5 d-none">
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

                    <div className="col-sm-6 pb-3 zoom-5">
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
                    <div className="col-sm-6 pb-3 zoom-5 d-none">
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
                    <div className="col-sm-6 pb-3 zoom-5 d-none">
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
                    <div className="col-sm-6 pb-3 zoom-5 ">
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