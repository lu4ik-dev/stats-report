const crypto = require('crypto');

function hashPassword(password) {
    const hash = crypto.createHash('sha256');
    hash.update(password);
    return hash.digest('hex');
  }
  

console.log(hashPassword('admin'));


sendMail('dmitriy_smir1_2_3@mail.ru', 'dima', 'Регистрация', '123fas')