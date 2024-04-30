import React from 'react';
import imageError404 from '../pages/img/error_404.png'
import { generateRandomNumbers } from '../tech/global_vars';

const ErrorPage = () => {

  return (
    <div className="container">
        <div className="row">
            <div className="col-md-6 offset-md-3 text-center mt-5">
                <img className="img-fluid" src={`${imageError404}?${generateRandomNumbers()}`} />
                <h5 className="display-6 text-danger mt-5">404 - страница не найдена</h5>
                <h6 className="display-8">Похоже Вы пытаетесь перейти на несуществующую страницу</h6>
                <a className="btn btn-primary zoom-10" href = "/">Вернуться на главную</a>
            </div>
        </div>
    </div>
  );
};

export default ErrorPage;