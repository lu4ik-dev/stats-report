import React, {useEffect} from 'react';
import EductionTable from './EductionTable';
import { redirectToLogin } from '../tech/checking';
import Header from './Header';

const Eduction = () => {
    useEffect(() => {
        redirectToLogin();
      }, []);
    const userInfo = JSON.parse(sessionStorage.getItem("userInfo")).userInfo;
    return (
    <div>
        <Header />
        <div className="d-flex flex-wrap justify-content-center py-1 mb-2">
                <span className="d-flex align-items-center mb-1 mb-md-0 me-md-auto text-dark fs-5 ms-3">Образование</span>
            <ul className="nav nav-pills me-3">
                <button className="btn btn-primary zoom-5" aria-current="page" disabled>
                    Экспорт в CSV
                </button>
            </ul>
        </div>
        <EductionTable />
    </div>
    );
};

export default Eduction;