import React from 'react';
import { redirectToLogin } from '../../tech/checking';
import Header from '../Header';

const A_accepts = () => {
    redirectToLogin();
    
    return (
        <div>
            <Header />
        </div>
    );
};

export default A_accepts;