import React from 'react';
import { redirectToLogin } from '../../tech/checking';
import Header from '../Header';
import { Link } from 'react-router-dom';

const A_Configurate = () => {
    redirectToLogin();
    
    return (
        <div>
            <Header />

            <div className="container px-5">
            <div className="row justify-content">
                    <div className="col-md-auto">
                        <h3><a href="/admin-panel">Админ-панель</a> / настройки</h3>
                    </div>
                </div>
                <div className="card mt-2 zoom-2">
                    <div className="card-body">
                        <h5 className="card-title">Области</h5>
                        <p className="card-text">Удалить / Изменить / Добавить область</p>
                        <a href="settings/regions" className="btn btn-primary zoom-10">Перейти</a>
                    </div>
                </div>

                <div className="card mt-2 zoom-2">
                    <div className="card-body">
                        <h5 className="card-title">Города</h5>
                        <p className="card-text">Удалить / Изменить / Добавить город</p>
                        <a href="settings/cities" className="btn btn-primary zoom-10">Перейти</a>
                    </div>
                </div>

                <div className="card mt-2 zoom-2">
                    <div className="card-body">
                        <h5 className="card-title">Специальности</h5>
                        <p className="card-text">Удалить / Изменить / Добавить специальность</p>
                        <a href="settings/specialnost" className="btn btn-primary zoom-10">Перейти</a>
                    </div>
                </div>

            </div>
        </div>
    );
};

export default A_Configurate;