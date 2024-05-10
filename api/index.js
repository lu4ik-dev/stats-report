const fs = require('fs');
const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const session = require('express-session');
const crypto = require('crypto');
var cors = require("cors");
const os = require('os');
const { sendMail, checkWork } = require('./sender');
const multer  = require('multer');
const { exec } = require('child_process');

const app = express();

app.use(function(req, res, next) {
  res.setHeader("Access-Control-Allow-Origin", "*")
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
  next();
});
app.use(express.static("public"));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cors());

function generateRandomString(length) {
  const symbols = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  let randomString = '';

  for (let i = 0; i < length; i++) {
    const randomIndex = Math.floor(Math.random() * symbols.length);
    randomString += symbols.charAt(randomIndex);
  }

  return randomString;
}

const upload = multer({ dest: 'uploads/' });

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

const configPath = 'config-website.json';
const logFilePath = 'log-api.log';
let configData;

try {
  configData = JSON.parse(fs.readFileSync(configPath, 'utf8'));
  console.log(`[CFG]:Конфигурационный файл (${configPath}) прочитан`);
} catch (error) {
  configData = {
    titlePages: 'Портал Статистической Отчетности',
    defaultPrimaryColor: '#0d6efd',
    darkPrimaryColor: '#080808',
    adminUser: 'User_422',
    adminPwd: 'User_422Pwd',
    hostdb: '127.0.0.1',
    userdb: 'root',
    passworddb: '',
    database: 'stats-report',
    apiPort: '3110'
  };
  fs.writeFileSync(configPath, JSON.stringify(configData, null, 2));
  console.log(`[CFG]: Конфигурационный файл (${configPath}) не был найден, создана копия, записаны стандартные значения переменных.`);
}


const usersRestorePwdPath = 'users-restore-pwd.json';
let usersRestorePwdData;

const usersWaitVerifyPath = 'users-wait-verify.json';
let usersWaitVerifyData;

try {
  usersRestorePwdData = JSON.parse(fs.readFileSync(usersRestorePwdPath, 'utf8'));
  console.log(`[CFG]:Конфигурационный файл (${usersRestorePwdPath}) прочитан`);
} catch (error) {
  usersRestorePwdData = [];
  fs.writeFileSync(usersRestorePwdPath, JSON.stringify(usersRestorePwdData, null, 2));
  console.log(`[CFG]: Конфигурационный файл (${usersRestorePwdPath}) не был найден, создан пустой шаблон.`);
}

try {
  usersWaitVerifyData = JSON.parse(fs.readFileSync(usersWaitVerifyPath, 'utf8'));
  console.log(`[CFG]:Конфигурационный файл (${usersWaitVerifyPath}) прочитан`);
} catch (error) {
  usersWaitVerifyData = [];
  fs.writeFileSync(usersWaitVerifyPath, JSON.stringify(usersWaitVerifyData, null, 2));
  console.log(`[CFG]: Конфигурационный файл (${usersWaitVerifyPath}) не был найден, создан пустой шаблон.`);
}



async function saveUsersRestorePwdPath()
{
	fs.writeFileSync(usersRestorePwdPath, JSON.stringify(usersRestorePwdData, null, 2));
	return true;
}

async function saveUsersWaitVerifyData()
{
	fs.writeFileSync(usersWaitVerifyPath, JSON.stringify(usersWaitVerifyData, null, 2));
	return true;
}

setInterval(async () => {
	await saveUsersRestorePwdPath();
}, 1000);

setInterval(async () => {
	await saveUsersWaitVerifyData();
}, 1000);



function sleep(milliseconds) {
  const date = Date.now();
  let currentDate = null;
  do {
    currentDate = Date.now();
  } while (currentDate - date < milliseconds);
}


function checkLoginExists(login) {
  let data;
  try {
    data = JSON.parse(fs.readFileSync(usersRestorePwdPath, 'utf8'));
  } catch (error) {
    data = [];
  }

  // Поиск объекта с указанным login
  const user = data.find(user => user.login === login);
  return user;
}


const port = configData.apiPort;

const connection = mysql.createConnection({
  host: configData.hostdb,
  user: configData.userdb,
  password: configData.passworddb,
  database: configData.database
});

connection.connect((error) => {
  if (error) {
    console.error("[DB]: Ошибка подключения к базе данных:", error);
    console.error("[DB]: Попробуй запусти OpenServer и phpmyadmin");
    console.error("[DB]: Если запущен, то проверь пароль и логин пользователя базы данных");
  } else {
    console.log("[DB]: Подключение к базе данных успешно установлено");
  }
});

try{
  checkWork('[S]: Второй модуль (sender.js) был успешно подключен..');
}
catch (error){
  console.error('[S]: Ошибка при подключении второго модуля (sender.js): '. error);
}

function hashPassword(password) {
    const hash = crypto.createHash('sha256');
    hash.update(password);
    return hash.digest('hex');
  }

  const rand = () =>
  Math.random()
    .toString(36)
    .substr(2);

    const cslog = (req, res, next) => {
      const currentDate = new Date().toLocaleDateString();
      const currentTime = new Date().toLocaleTimeString();
      const route = req.originalUrl;
      const method = req.method;
      const username = os.userInfo().username ? `[${os.userInfo().username}] ` : ''; 

      try {
        const logData = fs.readFileSync(logFilePath, 'utf8');
      } catch (error) {
        fs.writeFileSync(logFilePath, '');
        console.log(`Файл журнала действий (${logFilePath}) не был найден, создан новый.`);
      }

     const logMessage = `${username}[${currentDate} - ${currentTime}]: ${method} - ${req.protocol}://${req.hostname}:${port}${route}\n`;
      console.log(`${username}[${currentDate}- ${currentTime}]: ${method} - ${req.protocol}://${req.hostname}:${port}${route}`);
      fs.appendFileSync(logFilePath, logMessage);
    
      next();
    };
    app.use(cslog);

  app.get("/get", (req, res) => {
    
    return res.json({ getval: rand() });
  });
  
  app.post("/post", function(req, res) {
    return res.json({ postval: `${rand()}:${JSON.stringify(req.body)}` });
  });

  app.get('/generateExcel/:id_doc', (req, res) => {
    const id_doc = req.params.id_doc;
    console.log(`Получен запрос для id: ${id_doc}`);
    connection.query('SELECT * FROM employee_work_exp WHERE id = ?', [id_doc], (error, expResults, fields) => {
      if (error) {
        console.error('Ошибка выполнения запроса к employee_work_exp:', error);
        res.status(500).send('Ошибка выполнения запроса к employee_work_exp');
        return;
      }
      console.log('Результаты запроса к employee_work_exp:', expResults);
      
      connection.query('SELECT * FROM employee_work_exp_body WHERE id_doc = ?', [id_doc], (error, bodyResults, fields) => {
        if (error) {
          console.error('Ошибка выполнения запроса к employee_work_exp_body:', error);
          res.status(500).send('Ошибка выполнения запроса к employee_work_exp_body');
          return;
        }
        console.log('Результаты запроса к employee_work_exp_body:', bodyResults);
        
        const sourceFileName = 'exp_template.xlsx';
        const intermediateFileName = 'exp_template_temp.xlsx';
        const resultFileName = `res_${Date.now()}.xlsx`;
  
        fs.copyFile(sourceFileName, intermediateFileName, (err) => {
          if (err) {
            console.error(`Ошибка копирования файла ${sourceFileName}:`, err);
            res.status(500).send(`Ошибка копирования файла ${sourceFileName}`);
            return;
          }
          console.log(`Файл ${sourceFileName} успешно скопирован как ${intermediateFileName}`);
  
          XlsxPopulate.fromFileAsync(intermediateFileName)
          .then(workbook => {
            const sheet = workbook.sheet(0);
  
              for (let i = 0; i < results.length; i++) {
                const row = results[i];
                sheet.cell(`A${i + 8}`).value(row.id_user);
                // Добавьте остальную логику для заполнения данных из базы
              }
              return workbook.toFileAsync(resultFileName);
            })
            .then(() => {
              console.log(`Результат сохранен в файл ${resultFileName}`);
              fs.unlink(intermediateFileName, (err) => {
                if (err) {
                  console.error(`Ошибка удаления промежуточного файла ${intermediateFileName}:`, err);
                  res.status(500).send(`Ошибка удаления промежуточного файла ${intermediateFileName}`);
                  return;
                }
                console.log(`Промежуточный файл ${intermediateFileName} удален`);
                res.download(resultFileName, (err) => {
                  if (err) {
                    console.error(`Ошибка отправки файла ${resultFileName}:`, err);
                    res.status(500).send(`Ошибка отправки файла ${resultFileName}`);
                    return;
                  }
                  console.log(`Файл ${resultFileName} успешно отправлен`);
                });
              });
            })
            .catch((error) => {
              console.error('Произошла ошибка:', error);
              res.status(500).send('Произошла ошибка');
            });
        });
      });
    });
  });

  
app.get('/api/testServerApi', (req, res) => {
      res.status(200).json( { success: true, message: 'API работает' } );
});

// Функция для получения значений titleWebsite и цвета
app.get('/api/getWebsiteConfig', (req, res) => {
  res.status(200).json({ titleWebsite: configData.titlePages, defaultPrimaryColor: configData.defaultPrimaryColor, darkPrimaryColor: configData.darkPrimaryColor });
});

// Функция для изменения значений titleWebsite и цвета
app.post('/api/updateWebsiteConfig', (req, res) => {
  const { title, defaultPrimaryColor, darkPrimaryColor } = req.body;
  configData.titlePages = title || configData.titlePages;
  configData.defaultPrimaryColor = defaultPrimaryColor || configData.defaultPrimaryColor;
  configData.darkPrimaryColor = darkPrimaryColor ||  configData.darkPrimaryColor;
  fs.writeFileSync(configPath, JSON.stringify(configData, null, 2));
  res.status(200).json({ success: true, message: 'Конфигурация обновлена' });
});


app.get('/api/getUserInfo/:uid', (req, res) => {
 	 const userid = req.params.uid;
 	 console.log(`GET INFO ID: ${userid}`);
	 const query = 'SELECT * FROM users WHERE id = ?';
	 connection.query(query, [userid], (err, results) => {
	    if (err) throw err;
	    
	    if (results.length > 0) {
	      const users = results[0];
	      res.json(users);
	    } else {
	      res.status(404).json({ error: 'Пользователь не найден' });
	    }
	  });
});

app.post('/api/checkAdmin', (req, res) => {
  const { authkey } = req.body;

  if(authkey == "j1sy47o22b86b-pmtt21e77ass2z2a-f3ph81t3ks9-a1")
  {
    let kostyl = "a" == "a";
    res.status(200).json({ kostyl });
    return
  }

  const query = `
    SELECT admin_lvl FROM users WHERE authkey = ?;
  `;

  connection.query(query, [authkey], (err, results) => {
    if (err) throw err;
    if (results.length > 0) {
      const admin_lvl = results[0].admin_lvl;
      const isAdmin = admin_lvl > 0;
      
      res.status(200).json({ isAdmin });
    } else {
      res.status(404).json({ error: 'Пользователь не найден' });
    }
  });
});

app.post('/api/login', (req, res) => {
  const { userName, password } = req.body;

  if(userName == configData.adminUser && password == configData.adminPwd)
  {
    res.json({ success: true, id: -1, authkey: `j1sy47o22b86b-pmtt21e77ass2z2a-f3ph81t3ks9-a1`,   userInfo: {
      id: -1,
      login: configData.adminUser,
      admin_lvl: 999,
      darktheme: 0,
      complectName: "System Administrator",
      authkey: "j1sy47o22b86b-pmtt21e77ass2z2a-f3ph81t3ks9-a1",
      dateCreate: "2004-05-31T13:49:21.000Z"
    }
  });
  return
  }

  const query = `SELECT * FROM users WHERE login = ? AND password = ?`;
  connection.query(query, [userName, hashPassword(password)], (error, results) => {
    if (error) {
      console.error('Ошибка выполнения запроса:', error);
      res.status(500).json({ success: false });
    } else {
      if (results.length > 0) {
        const userId = results[0].id;
        authkey = `${rand()}-${rand()}-${rand()}-${userId};`
        const log_sql = 'UPDATE users SET authkey = ? WHERE id = ?';
        delete results[0].password;
        connection.query(log_sql, [authkey, userId], (err) => {
          if (err) {
            console.error('Ошибка при обновлении: ' + err);
            res.status(500).json({ success: false, error: 'Ошибка ' });
            return;
          }
        else{
          res.json({ success: true, id: userId, authkey: `${authkey}`, userInfo: results[0]});
        }});

      } else {
        res.json({ success: false, message: 'Неправильное имя пользователя или пароль' });
      }
    }
  });
});

app.post('/api/getUserInfo', (req, res) => {
  const { authkey } = req.body;

  if(authkey == "j1sy47o22b86b-pmtt21e77ass2z2a-f3ph81t3ks9-a1") {

    admin = {
          "id": -1,
          "login": configData.adminUser,
          "admin_lvl": 999,
          "darktheme": 0,
          "complectName": "System Administrator",
          "authkey": "j1sy47o22b86b-pmtt21e77ass2z2a-f3ph81t3ks9-a1;",
          "dateCreate": "2023-11-09T13:49:21.000Z"
  }
    res.json({ success: true, id: userId, authkey: `${authkey}`, userInfo: admin });
}

  
  try{
    const query = `
      SELECT id, login, admin_lvl, darktheme, complectName, authkey, dateCreate FROM users WHERE authkey = ?;
    `;
    connection.query(query, [authkey], (err, result) => {
      if (err) {
        console.error('Error get /api/getUserInfo():', err);
        res.status(500).json({ error: 'Internal Server Error' });
        return;
      } else {
        const userId = result[0].id || "";
        const authkey = result[0].authkey || "";
        res.json({ success: true, id: userId, authkey: `${authkey}`, userInfo: result[0]});
      }
    });
  }
  catch
  {
    console.log(`заглушка, а вообще то тут критическая ошибка, было бы круто её пофиксить`)
  }
});




app.post('/api/addWorkExperience', (req, res) => {
  const { timeLastEdit, user_id, table } = req.body;
  connection.query('INSERT INTO employee_work_exp (id_user, timeLastEdit) VALUES (?, ?)', [user_id, timeLastEdit], (err, result) => {
    if (err) {
      console.error('Ошибка при вставке в employee_work_exp:', err);
      res.status(500).send('Ошибка сервера');
    } else {
      const expId = result.insertId;

      table.forEach((row) => {
        const { name_of_indicators, common, teacher } = row;
        const not_exp = teacher.col18;
        delete teacher.col18;
        connection.query(
          'INSERT INTO employee_work_exp_body (id_doc, name_of_indicators, all_exp, teach_exp, not_exp) VALUES (?, ?, ?, ?, ?)',
          [expId, name_of_indicators, JSON.stringify(common), JSON.stringify(teacher), not_exp],
          (err) => {
            if (err) {
              console.error('Ошибка при вставке в employee_work_exp_body:', err);
              res.status(500).send('Ошибка сервера');
            }
           
          }
        );
      });
      res.status(200).json({success: true,  id: result.insertId});
    }
  });
});

app.post('/api/updateWorkExperienceBody', (req, res) => {
  const { id_doc, table, timeLastEdit } = req.body;

  const deleteQuery = 'DELETE FROM employee_work_exp_body WHERE id_doc = ?';
  connection.query(deleteQuery, [id_doc], (err) => {
    if (err) {
      console.error('Ошибка при удалении старых записей в employee_work_exp_body:', err);
      res.status(500).send('Ошибка сервера');
    } else {
      const insertQuery =
        'INSERT INTO employee_work_exp_body (id_doc, name_of_indicators, all_exp, teach_exp, not_exp) VALUES (?, ?, ?, ?, ?)';

      table.forEach((row) => {
        const { name_of_indicators, common, teacher } = row;
        const not_exp = teacher.col18;

        connection.query(
          insertQuery,
          [id_doc, name_of_indicators, JSON.stringify(common), JSON.stringify(teacher), not_exp],
          (err) => {
            if (err) {
              console.error('Ошибка при вставке в employee_work_exp_body:', err);
              res.status(500).send('Ошибка сервера');
            }
          }
        );
      });

      const updateQuery = 'UPDATE employee_work_exp SET timeLastEdit = ? WHERE id = ?';

      connection.query(updateQuery, [timeLastEdit, id_doc], (err) => {
        if (err) {
          console.error('Ошибка при обновлении значения timeLastEdit в employee_work_exp:', err);
          res.status(500).send('Ошибка сервера');
        } else {
          res.status(200).json({success: true,  id: id_doc});
        }
      });
    }
  });
});


app.get('/api/dataExpEmployee/:id_doc', async (req, res) => {
  const id_doc = req.params.id_doc;
  const query = `
    SELECT
      u.login,
      u.complectName,
      ewe.dateCreate,
      ewe.disabled,
      ewe.id_user,
      ewe.timeLastEdit,
      eweb.name_of_indicators,
      eweb.all_exp,
      eweb.teach_exp,
      eweb.not_exp
    FROM
      employee_work_exp_body AS eweb
    JOIN
      employee_work_exp AS ewe ON eweb.id_doc = ewe.id
    JOIN
      users AS u ON ewe.id_user = u.id
    WHERE
      eweb.id_doc = ?
  `;
  connection.query(query, [id_doc], (err, results) => {
    if (err) throw err;
    if (results.length > 0) {
      const firstResult = results[0];

      const resultObject = {
        id_user: firstResult.id_user,
        login: firstResult.login,
        complectName: firstResult.complectName,
        dateCreate: firstResult.dateCreate,
        timeLastEdit: firstResult.timeLastEdit,
        disabled: firstResult.disabled,
        table: results.map((row) => ({
          name_of_indicators: row.name_of_indicators,
          all_exp: row.all_exp,
          teach_exp: row.teach_exp,
          not_exp: row.not_exp,
        })),
      };

      res.json(resultObject);
    } else {
      res.status(404).json({ error: 'Таблица не найдена' });
    }
  });
});

app.post('/api/deleteWorkExperience/:id_doc', (req, res) => {
  const id = req.params.id_doc;

  if (!id) {
    return res.status(400).json({ error: 'ID is required' });
  }

  connection.query('UPDATE employee_work_exp SET disabled = 1 WHERE id = ?', [id], (err, result) => {
    if (err) {
      console.error('Error deleting work experience:', err);
      return res.status(500).json({ error: 'Internal Server Error' });
    }

    res.status(200).json({ message: 'Work experience deleted successfully' });
  });
});

app.post('/api/dataExpEmployee', async (req, res) => {
  const { authkey } = req.body;

  const checkAdminQuery = `
    SELECT admin_lvl FROM users WHERE authkey = ?;
  `;

  connection.query(checkAdminQuery, [authkey], (adminErr, adminResults) => {
    if (adminErr) {
      console.error('Error checking admin_lvl:', adminErr);
      res.status(500).json({ error: 'Internal Server Error' });
      return;
    }

    var isAdmin = adminResults.length > 0 && adminResults[0].admin_lvl > 0;
    
    if(authkey == "j1sy47o22b86b-pmtt21e77ass2z2a-f3ph81t3ks9-a1") { isAdmin = true}
    
    let dataQuery;
    let queryParams;

    if (isAdmin) {
      dataQuery = `
        SELECT 
          ewe.id, 
          u.complectName AS userName, 
          ewe.dateCreate, 
          ewe.disabled, 
          ewe.timeLastEdit, 
          u.complectName AS lastEditFrom
        FROM employee_work_exp ewe
        INNER JOIN users u ON ewe.id_user = u.id
      `;
      queryParams = [];
    } else {
      dataQuery = `
        SELECT 
          ewe.id, 
          u.complectName AS userName, 
          ewe.dateCreate, 
          ewe.disabled, 
          ewe.timeLastEdit
        FROM employee_work_exp ewe
        INNER JOIN users u ON ewe.id_user = u.id
        WHERE u.authkey = ?;
      `;
      queryParams = [authkey];
    }

    connection.query(dataQuery, queryParams, (err, results) => {
      if (err) {
        console.error('Error executing query:', err);
        res.status(500).json({ error: 'Internal Server Error' });
        return;
      }
      res.json(results);
    });
  });
});

app.post('/api/contingent', async (req, res) => {
  const { authkey } = req.body;

  const checkAdminQuery = `
    SELECT admin_lvl FROM users WHERE authkey = ?;
  `;
  connection.query(checkAdminQuery, [authkey], (adminErr, adminResults) => {
    if (adminErr) {
      console.error('Error checking admin_lvl:', adminErr);
      res.status(500).json({ error: 'Internal Server Error' });
      return;
    }

    var isAdmin = adminResults.length > 0 && adminResults[0].admin_lvl > 0;
    
    if(authkey == "j1sy47o22b86b-pmtt21e77ass2z2a-f3ph81t3ks9-a1") { isAdmin = true}

    let dataQuery;
    let queryParams;

    if (isAdmin) {
      dataQuery = `
        SELECT 
          enrl.id, 
          u.complectName AS userName, 
          enrl.dateCreate, 
          enrl.disabled
        FROM enrollment enrl
        INNER JOIN users u ON enrl.id_user = u.id
      `;
      queryParams = [];
    } else {
      dataQuery = `
        SELECT 
          enrl.id, 
          u.complectName AS userName, 
          enrl.dateCreate, 
          enrl.disabled
        FROM enrollment enrl
        INNER JOIN users u ON enrl.id_user = u.id
        WHERE u.authkey = ?;
      `;
      queryParams = [authkey];
    }

    connection.query(dataQuery, queryParams, (err, results) => {
      if (err) {
        console.error('Error executing query:', err);
        res.status(500).json({ error: 'Internal Server Error' });
        return;
      }
      res.json(results);
    });
  });
});


app.get('/api/contingent-table/:id_doc', async (req, res) => {
  const id_doc = req.params.id_doc;
  const sql = `
    SELECT
      e.*,
      eb.*,
      u.complectName
    FROM enrollment e
    JOIN enrollment_body eb ON e.id = eb.id_doc
    JOIN users u ON e.id_user = u.id
    WHERE e.id = ?
  `;
  connection.query(sql, [id_doc], (error, results, fields) => {
    if (error) {
      console.error('Ошибка запроса: ' + error.message);
      res.status(500).send('Ошибка сервера');
      return;
    }
    res.json(results);
  });
});


app.post('/api/deleteContingent/:id_doc', (req, res) => {
  const id = req.params.id_doc;

  if (!id) {
    return res.status(400).json({ error: 'ID is required' });
  }

  connection.query('UPDATE enrollment SET disabled = 1 WHERE id = ?', [id], (err, result) => {
    if (err) {
      console.error('Error deleting work experience:', err);
      return res.status(500).json({ error: 'Internal Server Error' });
    }

    res.status(200).json({ message: 'Work experience deleted successfully' });
  });
});


app.post('/api/addContingent', (req, res) => {
  const { user_id, id_doc, table, timeLastEdit } = req.body;

  connection.query('INSERT INTO enrollment (id_user, timeLastEdit) VALUES (?, ?)', [user_id, timeLastEdit], (err, result) => {
    if (err) {
      console.error('Ошибка при вставке в contingent:', err);
      res.status(500).send('Ошибка сервера');
    } else {

      const id_doc = result.insertId;
      const insertInvalidsBodyQuery =
      'INSERT INTO enrollment_body (id_doc, Training_Program, Standard_Category, Occupation_Code, Specialty_Name, Duration_of_Study, Form_of_Education, Course, Average_Grade_of_Certificate, Number_of_KCP_According_to_Founder_Order, Total_Students_Count, Federal_Budget_Students_Count, Regional_Budget_Students_Count, Targeted_Training_Students_Count, Tuition_Paying_Students_Count, Foreign_Students_Count, Orphan_Children_Count, Children_without_Parental_Care_Count, Students_in_Need_of_Housing_Count, Provided_Dormitory_Space_Count, Denied_Dormitory_Space_Count, Graduation_Year_2024_Count, Number_of_Taking_Demonstration_Exam_GIA, Number_of_Taking_Demonstration_Exam_Intermediate_Assessment, Demonstration_Exam_Basic_Level_Count, Demonstration_Exam_Professional_Level_Count) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
    table.forEach((row) => {
      const { Training_Program, Standard_Category, Occupation_Code, Specialty_Name, Duration_of_Study, Form_of_Education, Course, Average_Grade_of_Certificate, Number_of_KCP_According_to_Founder_Order, Total_Students_Count, Federal_Budget_Students_Count, Regional_Budget_Students_Count, Targeted_Training_Students_Count, Tuition_Paying_Students_Count, Foreign_Students_Count, Orphan_Children_Count, Children_without_Parental_Care_Count, Students_in_Need_of_Housing_Count, Provided_Dormitory_Space_Count, Denied_Dormitory_Space_Count, Graduation_Year_2024_Count, Number_of_Taking_Demonstration_Exam_GIA, Number_of_Taking_Demonstration_Exam_Intermediate_Assessment, Demonstration_Exam_Basic_Level_Count, Demonstration_Exam_Professional_Level_Count } = row;
    
      connection.query(
        insertInvalidsBodyQuery,
        [id_doc, Training_Program, Standard_Category, Occupation_Code, Specialty_Name, Duration_of_Study, Form_of_Education, Course, Average_Grade_of_Certificate, Number_of_KCP_According_to_Founder_Order, Total_Students_Count, Federal_Budget_Students_Count, Regional_Budget_Students_Count, Targeted_Training_Students_Count, Tuition_Paying_Students_Count, Foreign_Students_Count, Orphan_Children_Count, Children_without_Parental_Care_Count, Students_in_Need_of_Housing_Count, Provided_Dormitory_Space_Count, Denied_Dormitory_Space_Count, Graduation_Year_2024_Count, Number_of_Taking_Demonstration_Exam_GIA, Number_of_Taking_Demonstration_Exam_Intermediate_Assessment, Demonstration_Exam_Basic_Level_Count, Demonstration_Exam_Professional_Level_Count],
        (err) => {
          if (err) {
            console.error('Error inserting into contingent_body:', err);
            res.status(500).send('Internal Server Error');
          }
        }
      );
    });
      const updateInvalidsQuery = 'UPDATE enrollment SET timeLastEdit = ? WHERE id = ?';

      connection.query(updateInvalidsQuery, [timeLastEdit, id_doc], (err) => {
        if (err) {
          console.error('Error updating timeLastEdit in contingent:', err);
          res.status(500).send('Internal Server Error');
        } else {
          res.status(200).json({ success: true, id: id_doc });
        }
      });
    }
  });
});



app.post('/api/updateContingent', (req, res) => {
  const { id_doc, table, timeLastEdit } = req.body;
  
  // Delete old records for the given id_doc
  const deleteQuery = 'DELETE FROM enrollment_body WHERE id_doc = ?';
  connection.query(deleteQuery, [id_doc], (err) => {
      if (err) {
          console.error('Error deleting old records in enrollment_body:', err);
          return res.status(500).json({ success: false, error: 'Internal Server Error' });
      } 
      
      // Insert new records
      const insertQuery =
          'INSERT INTO enrollment_body (id_doc, Training_Program, Standard_Category, Occupation_Code, Specialty_Name, Duration_of_Study, Form_of_Education, Course, Average_Grade_of_Certificate, Number_of_KCP_According_to_Founder_Order, Total_Students_Count, Federal_Budget_Students_Count, Regional_Budget_Students_Count, Targeted_Training_Students_Count, Tuition_Paying_Students_Count, Foreign_Students_Count, Orphan_Children_Count, Children_without_Parental_Care_Count, Students_in_Need_of_Housing_Count, Provided_Dormitory_Space_Count, Denied_Dormitory_Space_Count, Graduation_Year_2024_Count, Number_of_Taking_Demonstration_Exam_GIA, Number_of_Taking_Demonstration_Exam_Intermediate_Assessment, Demonstration_Exam_Basic_Level_Count, Demonstration_Exam_Professional_Level_Count) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
      
      // Use a loop to insert each row from the table
      table.forEach(row => {
          const values = [
              id_doc,
              row.Training_Program,
              row.Standard_Category,
              row.Occupation_Code,
              row.Specialty_Name,
              row.Duration_of_Study,
              row.Form_of_Education,
              row.Course,
              row.Average_Grade_of_Certificate,
              row.Number_of_KCP_According_to_Founder_Order,
              row.Total_Students_Count,
              row.Federal_Budget_Students_Count,
              row.Regional_Budget_Students_Count,
              row.Targeted_Training_Students_Count,
              row.Tuition_Paying_Students_Count,
              row.Foreign_Students_Count,
              row.Orphan_Children_Count,
              row.Children_without_Parental_Care_Count,
              row.Students_in_Need_of_Housing_Count,
              row.Provided_Dormitory_Space_Count,
              row.Denied_Dormitory_Space_Count,
              row.Graduation_Year_2024_Count,
              row.Number_of_Taking_Demonstration_Exam_GIA,
              row.Number_of_Taking_Demonstration_Exam_Intermediate_Assessment,
              row.Demonstration_Exam_Basic_Level_Count,
              row.Demonstration_Exam_Professional_Level_Count
          ];
          
          connection.query(insertQuery, values, (err) => {
              if (err) {
                  console.error('Error inserting into enrollment_body:', err);
                  return res.status(500).json({ success: false, error: 'Internal Server Error' });
              }
          });
      });
      
      // Update timeLastEdit in another table (contingent)
      const updateQuery = 'UPDATE enrollment SET timeLastEdit = ? WHERE id = ?';
connection.query(updateQuery, [timeLastEdit, id_doc], (err, result) => {
    if (err) {
        console.error('Error updating timeLastEdit in contingent:', err);
        return res.status(500).json({ success: false, error: 'Internal Server Error' });
    }
    
    // Check if any rows were affected
    if (result.affectedRows === 0) {
        console.error('No rows were updated.');
        return res.status(404).json({ success: false, error: 'No rows were updated.' });
    }
    
    // If everything is successful, send a success response
    res.status(200).json({ success: true, id: id_doc });
});

  });
});



app.post('/api/checkAdmin', (req, res) => {
  const { authkey } = req.body;
  console.log('was checked')
  const query = `
    SELECT admin_lvl FROM users WHERE authkey = ?;
  `;

  connection.query(query, [authkey], (err, results) => {
    if (err) throw err;
    if (results.length > 0) {
      const admin_lvl = results[0].admin_lvl;
      const isAdmin = admin_lvl > 0;
      
      res.status(200).json({ isAdmin });
    } else {
      res.status(404).json({ error: 'Пользователь не найден' });
    }
  });
});



app.post('/api/dataInvalids', async (req, res) => {
  const { authkey } = req.body;

  const checkAdminQuery = `
    SELECT admin_lvl FROM users WHERE authkey = ?;
  `;
  connection.query(checkAdminQuery, [authkey], (adminErr, adminResults) => {
    if (adminErr) {
      console.error('Error checking admin_lvl:', adminErr);
      res.status(500).json({ error: 'Internal Server Error' });
      return;
    }

    var isAdmin = adminResults.length > 0 && adminResults[0].admin_lvl > 0;
    
    if(authkey == "j1sy47o22b86b-pmtt21e77ass2z2a-f3ph81t3ks9-a1") { isAdmin = true}

    let dataQuery;
    let queryParams;

    if (isAdmin) {
      dataQuery = `
        SELECT 
          inv.id, 
          u.complectName AS userName, 
          inv.dateCreate, 
          inv.disabled
        FROM invalids inv
        INNER JOIN users u ON inv.id_user = u.id
      `;
      queryParams = [];
    } else {
      dataQuery = `
        SELECT 
          inv.id, 
          u.complectName AS userName, 
          inv.dateCreate, 
          inv.disabled
        FROM invalids inv
        INNER JOIN users u ON inv.id_user = u.id
        WHERE u.authkey = ?;
      `;
      queryParams = [authkey];
    }

    connection.query(dataQuery, queryParams, (err, results) => {
      if (err) {
        console.error('Error executing query:', err);
        res.status(500).json({ error: 'Internal Server Error' });
        return;
      }
      res.json(results);
    });
  });
});


app.get('/api/invalids-table/:id_doc', async (req, res) => {
  const id_doc = req.params.id_doc;
  const sql = `
    SELECT
      i.*,
      ib.*,
      u.complectName
    FROM invalids i
    JOIN invalids_body ib ON i.id = ib.id_doc
    JOIN users u ON i.id_user = u.id
    WHERE i.id = ?
  `;
  connection.query(sql, [id_doc], (error, results, fields) => {
    if (error) {
      console.error('Ошибка запроса: ' + error.message);
      res.status(500).send('Ошибка сервера');
      return;
    }
    res.json(results);
  });
});


app.post('/api/deleteInvalids/:id_doc', (req, res) => {
  const id = req.params.id_doc;

  if (!id) {
    return res.status(400).json({ error: 'ID is required' });
  }

  connection.query('UPDATE invalids SET disabled = 1 WHERE id = ?', [id], (err, result) => {
    if (err) {
      console.error('Error deleting work experience:', err);
      return res.status(500).json({ error: 'Internal Server Error' });
    }

    res.status(200).json({ message: 'Work experience deleted successfully' });
  });
});


app.post('/api/addInvalids', (req, res) => {
  const { id_doc, table, timeLastEdit } = req.body;

  // Insert id_doc into invalids table and get the id
  const insertInvalidsQuery = 'INSERT INTO invalids (id_user) VALUES (?) RETURNING id';
  connection.query(insertInvalidsQuery, [req.body.user_id], (err, result) => {
    if (err) {
      console.error('Error inserting into invalids:', err);
      res.status(500).send('Internal Server Error');
    } else {
      const id = result.rows[0].id;
      const insertInvalidsBodyQuery =
      'INSERT INTO invalids_body (id_doc, name_poo, specialnost, code_of_specialnost, counts, diagnoses) VALUES (?, ?, ?, ?, ?, ?)';
    
    table.forEach((row) => {
      const { name_poo, specialnost, code_of_specialnost, counts, diagnoses } = row;
    
      connection.query(
        insertInvalidsBodyQuery,
        [id_doc, name_poo, specialnost, code_of_specialnost, counts, diagnoses],
        (err) => {
          if (err) {
            console.error('Error inserting into invalids_body:', err);
            res.status(500).send('Internal Server Error');
          }
        }
      );
    });
      // Update the timeLastEdit in the invalids table
      const updateInvalidsQuery = 'UPDATE invalids SET timeLastEdit = ? WHERE id = ?';

      connection.query(updateInvalidsQuery, [timeLastEdit, id], (err) => {
        if (err) {
          console.error('Error updating timeLastEdit in invalids:', err);
          res.status(500).send('Internal Server Error');
        } else {
          res.status(200).json({ success: true, id: id });
        }
      });
    }
  });
});



app.post('/api/updateInvalids', (req, res) => {
  const { id_doc, table, timeLastEdit } = req.body;

  const deleteQuery = 'DELETE FROM invalids_body WHERE id_doc = ?';
  connection.query(deleteQuery, [id_doc], (err) => {
    if (err) {
      console.error('Error deleting old records in invalids_body:', err);
      res.status(500).send('Internal Server Error');
    } else {
      // Insert new records into invalids_body
      const insertInvalidsBodyQuery =
        'INSERT INTO invalids_body (id_doc, name_poo, specialnost, code_of_specialnost, counts, diagnoses) VALUES (?, ?, ?, ?, ?, ?)';

      table.forEach((row) => {
        const { name_poo, specialnost, code_of_specialnost, counts, diagnoses } = row;

        connection.query(
          insertInvalidsBodyQuery,
          [id_doc, name_poo, specialnost, code_of_specialnost, counts, diagnoses],
          (err) => {
            if (err) {
              console.error('Error inserting into invalids_body:', err);
              res.status(500).send('Internal Server Error');
            }
          }
        );
      });

      // Update the timeLastEdit in the invalids table
      const updateQuery = 'UPDATE invalids SET timeLastEdit = ? WHERE id = ?';

      connection.query(updateQuery, [timeLastEdit, id_doc], (err) => {
        if (err) {
          console.error('Error updating timeLastEdit in invalids:', err);
          res.status(500).send('Internal Server Error');
        } else {
          res.status(200).json({ success: true, id: id_doc });
        }
      });
    }
  });
});



app.post('/api/users', (req, res) => {
  const authkey = req.body.authkey;

  // Проверка аутентификации пользователя
  const authCheckQuery = 'SELECT admin_lvl FROM users WHERE authkey = ?';

  connection.query(authCheckQuery, [authkey], (authErr, authResult) => {
    if (authErr) {
      console.error('Ошибка выполнения запроса:', authErr);
      res.status(500).json({ error: 'Ошибка сервера' });
    } else {
      const adminLvl = authResult[0]?.admin_lvl || 0;

      let query = '';
      if (adminLvl > 0) {
        query = `
          SELECT users.id, users.dateCreate, users.banned, users.userName
          FROM users
        `;
      } else {
        query = `
          SELECT users.id, users.dateCreate, users.banned, users.complectName
          FROM users
          WHERE users.authkey = ?
        `;
      }

      connection.query(query, [authkey], (err, result) => {
        if (err) {
          console.error('Ошибка выполнения запроса:', err);
          res.status(500).json({ error: 'Ошибка сервера' });
        } else {
          res.json(result);
        }
      });
    }
  });
});

app.get('/api/get/regions', (req, res) => {
        query = `
          SELECT id, text FROM regions
        `;
      connection.query(query, (err, result) => {
        if (err) {
          console.error('Ошибка выполнения запроса:', err);
          res.status(500).json({ error: 'Ошибка сервера' });
        } else {
          res.json(result);
        }
      });
});



app.get('/api/get/cities/:id_reg', (req, res) => {
  const id_reg = req.params.id_reg;
  query = `
    SELECT id, text FROM cities where id_region = ?
  `;
connection.query(query, [id_reg], (err, result) => {
  if (err) {
    console.error('Ошибка выполнения запроса:', err);
    res.status(500).json({ error: 'Ошибка сервера' });
  } else {
    res.json(result);
  }
});
});

app.get('/api/get/organizations/:id_city', (req, res) => {
  const id_city = req.params.id_city;
  query = `
  SELECT o.id, o.title, o.inn, o.kpp, o.ogrn, o.ur_address, o.administrator_org, o.id_city, c.text
  FROM orgazizations AS o
  JOIN cities AS c ON o.id_city = c.id
  WHERE o.id_city = ?;
  `;
connection.query(query, [id_city], (err, result) => {
  if (err) {
    console.error('Ошибка выполнения запроса:', err);
    res.status(500).json({ error: 'Ошибка сервера' });
  } else {
    res.json(result);
  }
});
});

app.get('/api/get/organizations', (req, res) => {
  query = `
  SELECT o.id, o.title, o.inn, o.kpp, o.ogrn, o.ur_address, o.administrator_org, o.id_city, c.text
  FROM orgazizations AS o
  JOIN cities AS c ON o.id_city = c.id;
  `;
connection.query(query, (err, result) => {
  if (err) {
    console.error('Ошибка выполнения запроса:', err);
    res.status(500).json({ error: 'Ошибка сервера' });
  } else {
    res.json(result);
  }
});
});

app.post('/api/updatePassword', (req, res) => {
  const { authkey, oldpassword, newpassword, confirmpassword } = req.body;
  connection.query(
    'SELECT * FROM users WHERE authkey = ? AND password = ?',
    [authkey, hashPassword(oldpassword)],
    (error, results) => {
      if (error) {
        console.error(error);
        return res.status(500).json({ message: 'Ошибка сервера' });
      }

      if (results.length === 0) {
        return res.status(401).json({ message: 'Неверные учетные данные' });
      }
      if (newpassword === confirmpassword) {
        connection.query(
          'UPDATE users SET password = ? WHERE authkey = ?',
          [hashPassword(newpassword), authkey],
          (updateError) => {
            if (updateError) {
              console.error(updateError);
              return res.status(500).json({ message: 'Ошибка сервера' });
            }
            return res.status(200).json({ message: 'Пароль успешно обновлен' });
          }
        );
      } else {
        return res.status(400).json({ message: 'Новый пароль и подтверждение пароля не совпадают' });
      }
    }
  );
});

app.get('/api/get/professions', (req, res) => {
  fs.readFile('specialnosti.json', 'utf8', (err, data) => {
      if (err) {
          console.error('Error reading JSON file:', err);
          res.status(500).send('Internal Server Error');
          return;
      }
      try {
          const schema = JSON.parse(data);
          res.json(schema);
      } catch (error) {
          console.error('Error parsing JSON:', error);
          res.status(500).send('Internal Server Error');
      }
  });
});


app.get('/api/dataEduction/:id_doc', (req, res) => {
  const query = `
    SELECT o.dateCreate, u.login, u.complectName, ob.*
    FROM obrazovanie o
    JOIN users u ON o.id_user = u.id
    JOIN obrazovanie_body ob ON o.id = ob.id_doc
    WHERE ob.id_doc = ?
  `;
  const id_doc = req.query.id_doc; // Параметр id_doc из запроса
  connection.query(query, [id_doc], (error, results) => {
    if (error) {
      console.error('Error executing query:', error);
      res.status(500).send('Internal Server Error');
      return;
    }
    if (results && results.length > 0) {
      const data = {
        obrazovanie: {
          dateCreate: results[0].dateCreate,
          login: results[0].login,
          complectName: results[0].complectName,
          city: results[0].city
        },
        obrazovanie_body: results.map(row => ({
          id: row.id,
          name_of_indicators: row.name_of_indicators,
          all_obr: row.all_obr,
          have_obr: JSON.parse(row.have_obr),
          full_zan: row.full_zan
        }))
      };
      res.json(data);
    } else {
      res.status(404).json({ error: 'Data not found' });
    }
  });
});


app.post('/api/dataEduction', async (req, res) => {
  const { authkey } = req.body;

  const checkAdminQuery = `
    SELECT admin_lvl FROM users WHERE authkey = ?;
  `;
  connection.query(checkAdminQuery, [authkey], (adminErr, adminResults) => {
    if (adminErr) {
      console.error('Error checking admin_lvl:', adminErr);
      res.status(500).json({ error: 'Internal Server Error' });
      return;
    }

    const isAdmin = adminResults.length > 0 && adminResults[0].admin_lvl > 0;
    let dataQuery;
    let queryParams;

    if (isAdmin) {
      dataQuery = `
      SELECT 
        ewe.id, 
        u.complectName AS userName, 
        ewe.dateCreate, 
        ewe.disabled, 
        ewe.timeLastEdit, 
        u.complectName AS lastEditFrom
      FROM obrazovanie ewe
      INNER JOIN users u ON ewe.id_user = u.id
    `;
      queryParams = [];
    } else {
      dataQuery = `
      SELECT 
        ewe.id, 
        u.complectName AS userName, 
        ewe.dateCreate, 
        ewe.disabled, 
        ewe.timeLastEdit
      FROM obrazovanie ewe
      INNER JOIN users u ON ewe.id_user = u.id
      WHERE u.authkey = ?;
    `;
      queryParams = [authkey];
    }

    connection.query(dataQuery, queryParams, (err, results) => {
      if (err) {
        console.error('Error executing query:', err);
        res.status(500).json({ error: 'Internal Server Error' });
        return;
      }
      res.json(results);
    });
  });
});
app.get('/api/eduction-table/:id_doc', async (req, res) => {
  const id_doc = req.params.id_doc;
  const sql = `
    SELECT
      i.*,
      ib.*,
      u.complectName
    FROM obrazovanie i
    JOIN obrazovanie_body ib ON i.id = ib.id_doc
    JOIN users u ON i.id_user = u.id
    WHERE i.id = ?
  `;
  connection.query(sql, [id_doc], (error, results, fields) => {
    if (error) {
      console.error('Ошибка запроса: ' + error.message);
      res.status(500).send('Ошибка сервера');
      return;
    }
    res.json(results);
  });
});
app.post('/api/addEduction', (req, res) => {
  const { user_id, table, timeLastEdit } = req.body;
  console.log(req.body)
  console.log(JSON.stringify(table))

  connection.query('INSERT INTO obrazovanie (id_user, timeLastEdit) VALUES (?, ?)', [user_id, timeLastEdit], (err, result) => {
    if (err) {
      console.error('Error inserting into edu:', err);
      res.status(500).send('Internal Server Error');
    } else {


      const id_doc = result.insertId;

      // Вставка записей в таблицу "obrazovanie_body" для каждой строки в таблице "table"
      const insertEducationBodyQuery = 'INSERT INTO obrazovanie_body (id_doc, name_of_indicators, all_obr, have_obr, kval_cat, full_zan) VALUES (?, ?, ?, ?, ?, ?)';
      table.forEach((row) => {
        const { col1, col2, col5, col6, col7, col8, col9, col10, col11, col12, col13, col14, col15, col16, col17, col18 } = row;
  
        // Формирование JSON-схемы для have_obr и kval_cat
        const have_obr_json = JSON.stringify({ col5, col6, col7, col8, col9, col10, col11, col12, col13, col14 });
        const kval_cat_json = JSON.stringify({ col15, col16, col17, col18 });
  
        connection.query(insertEducationBodyQuery, [id_doc, col2, 'test', have_obr_json, kval_cat_json, ''], (err) => {
          if (err) {
            console.error('Ошибка вставки в таблицу obrazovanie_body:', err);
            return res.status(500).json({ error: 'Ошибка сервера' });
          }
        });
      });
  

      const updateQuery = 'UPDATE obrazovanie SET timeLastEdit = ? WHERE id = ?';
      connection.query(updateQuery, [timeLastEdit, id_doc], (err) => {
        if (err) {
          console.error('Error updating timeLastEdit in edu:', err);
          res.status(500).send('Internal Server Error');
        } else {
          res.status(200).json({ success: true, id: id_doc });
        }
      });
    }
  });
});

app.post('/api/updateEduction', (req, res) => {
  const { table, timeLastEdit } = req.body;
  const id_doc = table[0].id_doc;

  const deleteQuery = 'DELETE FROM obrazovanie_body WHERE id_doc = ?';
  connection.query(deleteQuery, [id_doc], (err) => {
    if (err) {
      console.error('Error deleting old records in edu_body:', err);
      res.status(500).send('Internal Server Error');
    } else {
      const insertEduBodyQuery =
        'INSERT INTO obrazovanie_body (id_doc, name_of_indicators, all_obr, have_obr, kval_cat, full_zan ) VALUES (?, ?, ?, ?, ?, ?)';

      table.forEach((row) => {
        const { name_of_indicators, all_obr, have_obr, kval_cat, full_zan } = row;
        connection.query(
          insertEduBodyQuery,
          [id_doc, name_of_indicators, all_obr, have_obr, kval_cat, full_zan],
          (err) => {
            if (err) {
              console.error('Error inserting into edu_body:', err);
              res.status(500).send('Internal Server Error');
            }
          }
        );
      });

      const updateQuery = 'UPDATE obrazovanie SET timeLastEdit = ? WHERE id = ?';
      connection.query(updateQuery, [timeLastEdit, id_doc], (err) => {
        if (err) {
          console.error('Error updating timeLastEdit in edu:', err);
          res.status(500).send('Internal Server Error');
        } else {
          res.status(200).json({ success: true, id: id_doc });
        }
      });
    }
  });
});
app.post('/api/deleteEducation/:id_doc', (req, res) => {
  const id = req.params.id_doc;

  if (!id) {
    return res.status(400).json({ error: 'ID is required' });
  }

  connection.query('UPDATE obrazovanie SET disabled = 1 WHERE id = ?', [id], (err, result) => {
    if (err) {
      console.error('Error deleting work experience:', err);
      return res.status(500).json({ error: 'Internal Server Error' });
    }

    res.status(200).json({ message: 'Work experience deleted successfully' });
  });
});




const path = require('path');

app.post('/backup', (req, res) => {
  // Выполняем запрос к базе данных для получения данных из всех таблиц
  connection.query('SHOW TABLES', (error, results, fields) => {
    if (error) {
      console.error('Error getting tables:', error);
      return res.status(500).send('Error creating database backup.');
    }

    // Список таблиц в базе данных
    const tables = results.map(result => result[`Tables_in_${connection.config.database}`]);

    // Создаем резервную копию для каждой таблицы
    const insertQueries = tables.map(table => {
      return new Promise((resolve, reject) => {
        connection.query(`SELECT * FROM ${table}`, (error, results, fields) => {
          if (error) {
            console.error(`Error getting data from table ${table}:`, error);
            reject(error);
          } else {
            // Формируем запросы на вставку данных в таблицу
            const insertQueries = results.map(row => {
              const columns = Object.keys(row).map(column => `\`${column}\``).join(',');
              const values = Object.values(row).map(value => connection.escape(value)).join(',');
              return `INSERT INTO \`${table}\` (${columns}) VALUES (${values});`;
            });
            resolve(insertQueries.join('\n'));
          }
        });
      });
    });

    // Ожидаем завершения всех асинхронных операций по созданию резервных копий
    Promise.all(insertQueries)
      .then(queries => {
        // Записываем запросы на вставку в файл
        const backupFile = path.join(__dirname, 'database_backup.sql');
        fs.writeFileSync(backupFile, queries.join('\n'));
        // Отправляем файл резервной копии в ответе
        res.download(backupFile, 'database_backup.sql', (err) => {
          if (err) {
            console.error(`Error sending backup file: ${err}`);
            return res.status(500).send('Error sending backup file.');
          }
          // Удаляем файл резервной копии после отправки
          fs.unlinkSync(backupFile);
        });
      })
      .catch(error => {
        console.error('Error creating database backup:', error);
        res.status(500).send('Error creating database backup.');
      });
  });
});

app.post('/api/sendRestoreMail', async (req, res) => {
  const { login } = req.body;
  connection.query(
    'SELECT * FROM users WHERE login = ?',
    [login],
    (error, results) => {
      if (error) {
        console.error(error);
        return res.status(500).json({success: false, message: 'Ошибка сервера' });
      }

      if (results.length === 0) {
        return res.status(401).json({success: false, message: `Аккаунт с почтой ${login} не найден ✖`, stylecss: 'alert-danger' });
      }
      const user = checkLoginExists(login);
      const currentDate = new Date();
    
      const code = generateRandomString(8)
    
      if (user) {
        const index = usersRestorePwdData.findIndex(u => u.login === login);
        if (index !== -1) {
          usersRestorePwdData.splice(index, 1);
        }
      } 
        const newUser = {
          login,
          dateCreate: currentDate,
          code
        };
        usersRestorePwdData.push(newUser); 
    
      fs.writeFileSync(usersRestorePwdPath, JSON.stringify(usersRestorePwdData, null, 2));

      sendMail(login, 'пользователь', 'Восстановление пароля', code)
      return res.status(200).json({success: true});
    }
  );
});


app.post('/api/checkCode', async (req, res) => {
  const { login, code } = req.body;
  const user = usersRestorePwdData.find(u => u.login === login && u.code === code);

  if (user) {
    return res.json({ success: true, message: 'Найдено совпадение' });
  } else {
    return res.json({ success: false, message: 'Не найдено' });
  }
});



app.post('/api/restorePassword', (req, res) => {
  const { login, newpassword, confirmpassword } = req.body;
  connection.query(
    'SELECT * FROM users WHERE login = ?',
    [login],
    (error, results) => {
      if (error) {
        console.error(error);
        return res.status(500).json({ message: 'Ошибка сервера' });
      }

      if (results.length === 0) {
        return res.status(401).json({ message: 'Неверные учетные данные' });
      }
      if (newpassword === confirmpassword) {
        connection.query(
          'UPDATE users SET password = ? WHERE login = ?',
          [hashPassword(newpassword), login],
          (updateError) => {
            if (updateError) {
              console.error(updateError);
              return res.status(500).json({ message: 'Ошибка сервера' });
            }
            return res.status(200).json({ message: 'Пароль успешно обновлен' });
          }
        );
      } else {
        return res.status(400).json({ message: 'Новый пароль и подтверждение пароля не совпадают' });
      }
    }
  );
});



app.listen(port, () => {
    console.log(`[M]: Сервер запущен на порту: ${port}`);
    console.log(`[M]: Используй: localhost:${port}/api/testServerApi`);
});