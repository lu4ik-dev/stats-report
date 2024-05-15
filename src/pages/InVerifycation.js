import React from 'react';
import imageError404 from '../pages/img/error_404.png'
import { generateRandomNumbers } from '../tech/global_vars';
import { checkAdmin, logout, redirectToLogin } from '../tech/checking';

const InVerifycation = () => {
    return (
        <div>
            <div className="container">
                <div className="row">
                    <div className="col-md-6 offset-md-3 text-center mt-5">
                        <img className="img-fluid" src={`${imageError404}?${generateRandomNumbers()}`} />
                        <h5 className="display-6 text-danger mt-5">Ваш аккаунт не подтвержден Администратором сервиса</h5>
                        <h6 className="display-8">Для связи используйте: CrazyCuts@gmail.com</h6>
                        <button className="btn btn-primary zoom-10" onClick={logout}>Выйти из аккаунта</button>
                    </div>
                </div>
            </div>
        </div>
    );
};

export default InVerifycation;