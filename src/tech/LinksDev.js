import React from 'react';

const LinksDev = () => {
    return (
        <div className="btn-group dropup">
            <button
                type="button"
                className="btn bottom-contact-btn zoom-5 dropdown-toggle"
                data-bs-toggle="dropdown"
                aria-expanded="false"
            ></button>
            <ul className="dropdown-menu custom">
                <li>
                    <a href="https://vk.com/a1mt0head" target="_blank" rel="noopener noreferrer">
                        Разработчик 1 (VK)
                    </a>
                </li>
                <li>
                    <a href="https://vk.com/sekretik000" target="_blank" rel="noopener noreferrer">
                        Разработчик 2 (VK)
                    </a>
                </li>
                <li>
                    <a href="mailto:dmitriy_smir1_2_3@mail.ru?subject=Вопрос&body=Здравствуйте,">
                        Тех. Поддержка
                    </a>
                </li>
            </ul>
        </div>
    );
};

export default LinksDev;
