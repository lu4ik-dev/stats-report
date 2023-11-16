import React from 'react';
import { redirectToLogin } from '../../tech/checking';
import Header from '../Header';

const A_Configurate = () => {
    redirectToLogin();
    
    return (
        <div>
            <Header />
            <div className="container-fluid px-5">
                <div className="card mt-2 zoom-5">
                    <div className="card-body">
                        <h5 className="card-title">Области</h5>
                        <p className="card-text">придумай как тут сделать редактирование областей / добавление новых</p>
                        <a href="" className="btn btn-primary zoom-10">Перейти</a>
                    </div>
                </div>

                <div className="card mt-2 zoom-5">
                    <div className="card-body">
                        <h5 className="card-title">Города</h5>
                        <p className="card-text">а тут после выбора области добавлять и редактировать города</p>
                        <a href="tech.php" className="btn btn-primary zoom-10">Перейти</a>
                    </div>
                </div>

                <div className="card mt-2 zoom-5">
                    <div className="card-body">
                        <h5 className="card-title">Специальности</h5>
                        <p className="card-text">Код профессии, специальности</p>
                        <a href="tech.php" className="btn btn-primary zoom-10">Перейти</a>
                    </div>
                </div>

            </div>
        </div>
    );
};

export default A_Configurate;