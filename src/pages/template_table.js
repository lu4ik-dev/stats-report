import React, {useEffect} from 'react';
import Table from './table';
import { redirectToLogin} from '../tech/checking';
import Header from './Header';
import Index from './Index';

const Template_table = () =>
 {
    useEffect(() => {
        redirectToLogin();
      }, []);



    return (
        <div>
            <Header />
            <Index /> 
        </div>
    );
};

export default Template_table;