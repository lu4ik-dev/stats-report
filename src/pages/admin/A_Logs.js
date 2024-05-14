import React from 'react';
import Header from '../Header';
import {  Link  } from 'react-router-dom';
const A_Logs = () => {
    return (
        <div>
            <Header />
            <main>
            <div className="container px-4 py-5">
                <h3 className="pb-2 border-bottom">Admin logs, <span className='font-weight-bold'>welcome</span></h3>
                <div className="row">
                    <div className="col-sm-6 pb-3">
                        <div className="card">
                        <div className="card-body">
                            <h5 className="card-title">Действия администраторов</h5>
                            <p className="card-text">
                            
                            </p>

                            <Link to="/admin-panel/organizations" className="btn btn-primary">Перейти</Link>
                        </div>
                        </div>
                    </div>
                    <div className="col-sm-6 pb-3">
                        <div className="card">
                        <div className="card-body">
                            <h5 className="card-title">Действия пользователей</h5>
                            <p className="card-text">
                            Заявки на регистрацию пользователя / организации
                            </p>
                            <Link to='/admin-panel/accepts' className="btn btn-primary">
                            Перейти
                            </Link>
                        </div>
                        </div>
                    </div>
                </div>
                </div>

            </main>
    
        </div>
    );
};

export default A_Logs;