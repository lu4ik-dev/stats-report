import React, { useState, useEffect } from 'react';
import { checkAdmin, logout, redirectToLogin } from '../tech/checking';
import { Link, useLocation  } from 'react-router-dom';
import { url_api, url_web } from '../tech/config';
import { showAlert } from '../tech/alert';
import imgLogo from '../pages/img/logo.svg';
const Header = () => {

    redirectToLogin();


    
    useEffect(() => {
        const authKey = sessionStorage.getItem("auth");
        const currentUrl = window.location.href;
        if (!checkAdmin(authKey) && currentUrl.includes("admin-panel")) {
          window.location.replace('http://'+url_web+':3000/');
        }
      }, []);

    const [changePwd, setChangePwd] = useState('');
    const [changePwdRole, setChangePwdRole] = useState('');

    const [confirmExit, setConfirmExit] = useState('');
    const [confirmExitRole, setConfirmExitRole] = useState('');

    const handleChangerPwd = () => {
        if (changePwd != 'show d-block'){
            setChangePwd('show d-block')
            setChangePwdRole('dialog')
        }
        else{
            setChangePwd('d-none');
            setChangePwdRole('')
        }
    }

    const handleConfirmExit = () => {
        if (confirmExit != 'show d-block'){
            setConfirmExit('show d-block')
            setConfirmExitRole('dialog')
        }
        else{
            setConfirmExit('d-none');
            setConfirmExitRole('')
        }
    }
    
    
    const handleLogout = () => {
        logout();
      };
    const location = useLocation();
    
   
    const userInfo = JSON.parse(sessionStorage.getItem("userInfo")).userInfo;

    //const email = 'bisquirt@lu4ik.com';
    const email = userInfo.login;
    const [useremail, domain] = email.split('@');

    const [oldPassword, setOldPassword] = useState('');
    const [newPassword, setNewPassword] = useState('');
    const [confirmNewPassword, setConfirmNewPassword] = useState('');

  const handleConfirmChangePassword = async () => {
    if (newPassword !== confirmNewPassword) {
      console.error('Новый пароль и подтверждение не совпадают');
      showAlert('Новый пароль и подтверждение не совпадают');
      setNewPassword('');
      setConfirmNewPassword('');
      return;
    }

    try {
      const response = await fetch(url_api+'/api/updatePassword', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          authkey: sessionStorage.getItem('auth'),
          oldpassword: oldPassword,
          newpassword: newPassword,
          confirmpassword: confirmNewPassword,
        }),
      });

      if (response.ok) {
        showAlert('Пароль успешно обновлен');
        handleChangerPwd();

        setOldPassword('');
        setNewPassword('');
        setConfirmNewPassword('');
      } else {
        const errorData = await response.json();
        console.error('Ошибка при обновлении пароля:', errorData.message);
        showAlert(`Ошибка при обновлении пароля:\n${errorData.message}`);
        setOldPassword('');
        setNewPassword('');
        setConfirmNewPassword('');
      }
    } catch (error) {
      showAlert(`Ошибка при обновлении пароля:\n${error}`);
      console.error('Ошибка при выполнении fetch запроса:', error);
      setOldPassword('');
      setNewPassword('');
      setConfirmNewPassword('');
    }

  };

  const [nameUserHeader, other] = userInfo.complectName.split(' ');

    return (
        <header className="custom-hg d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
        <a
            href="/"
            className="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none"
        >
           <img src={imgLogo} alt="SVG Image" className='mx-3' width={36} />
            <span className="fs-4 text-light"><span className='font-weight-bold'>Портал</span> статистической отчетности</span>
        </a>
        <ul className="nav nav-pills ">
            <li className="nav-item">
            <Link to='/' className={`zoom-5 nav-link ${location.pathname.startsWith('/admin-panel') ? '' : 'active'}`}>
            Главная
             </Link>
            </li>
            
            {userInfo.admin_lvl > 0 && (
            <li className="nav-item">
                <a href="/admin-panel" className={`zoom-5 nav-link ${location.pathname.startsWith('/admin-panel') ? 'active' : ''}`}>
                Админ-панель
                </a>
            </li>
            )}
            <li className="nav-item">
                <div className="btn-group">
                <button type="button" className="zoom-5 nav-link" data-bs-toggle="dropdown" aria-expanded="false">
                    {nameUserHeader}
                </button>
                <ul className="dropdown-menu">
                    <li><span className="dropdown-item disabled"><b>{useremail}</b><span className='text-secondary'>@{domain}</span></span></li>
                    <li><button className="dropdown-item zoom-5" onClick={handleChangerPwd}>Сменить пароль</button></li>
                    <li><hr className="dropdown-divider" /></li>
                    <li><button onClick={handleConfirmExit} className="dropdown-item zoom-5">Выход</button></li>
                </ul>
                </div>
            </li>
        </ul>

        <div id="confirmModal2" className={`modal fade ${changePwd}`} tabIndex="-1" aria-labelledby="confirmModalLabel2" aria-modal="true" role={`${changePwdRole}`} >
        <div className="modal-dialog modal-dialog-centered">
      <div className="modal-content">
        <div className="modal-header">
          <h5 className="modal-title" id="confirmModalLabel2">Смена пароля</h5>
          <button type="button" className="btn-close" data-bs-dismiss="modal" aria-label="Закрыть" onClick={handleChangerPwd}></button>
        </div>
      <div className="modal-body">
        <p>Введите старый пароль:</p>
        <input
          type="text"
          id="inputOldPwd"
          className="form-control"
          value={oldPassword}
          onChange={(e) => setOldPassword(e.target.value)}
        />
      </div>
      <div className="modal-body">
        <p>Введите новый пароль:</p>
        <input
          type="text"
          id="inputNewPwd"
          className="form-control"
          value={newPassword}
          onChange={(e) => setNewPassword(e.target.value)}
        />
      </div>
      <div className="modal-body">
        <p>Подтвердите новый пароль:</p>
        <input
          type="text"
          id="confirmNewPwd"
          className="form-control"
          value={confirmNewPassword}
          onChange={(e) => setConfirmNewPassword(e.target.value)}
        />
      </div>
      <button
        type="button"
        className="btn btn-primary px-4"
        id="confirmChangePasswordButton"
        onClick={handleConfirmChangePassword}
      >
        Подтвердить
      </button>
    </div>
    </div>
    </div>

    <div id="confirmModal" className={`modal fade ${confirmExit}`} tabIndex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true" role={`${confirmExitRole}`}>
    <div className="modal-dialog modal-dialog-centered">
      <div className="modal-content">
        <div className="modal-header">
          <h5 className="modal-title" id="confirmModalLabel">Подтверждение</h5>
          <button type="button" className="btn-close" data-bs-dismiss="modal" aria-label="Закрыть" onClick={handleConfirmExit}></button>
        </div>
        <div className="modal-body">
          <p>Вы действительно хотите выйти из аккаунта?</p>
        </div>
        <div className="modal-footer">
          <button type="button" className="btn btn-secondary px-4" data-bs-dismiss="modal" onClick={handleConfirmExit}>Нет</button>
          <button href="/includes/logout.php" className="btn btn-primary px-4" onClick={handleLogout}>Да</button>
        </div>
      </div>
    </div>
  </div>
</header>
    );
};

export default Header;