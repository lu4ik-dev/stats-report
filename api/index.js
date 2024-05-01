const fs = require('fs');
const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const session = require('express-session');
const crypto = require('crypto');
var cors = require("cors");
const os = require('os');

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

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

const configPath = 'config-website.json';
const logFilePath = 'log-api.log';
let configData;

try {
  configData = JSON.parse(fs.readFileSync(configPath, 'utf8'));
  console.log(`Конфигурационный файл (${configPath}) прочитан`);
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
  console.log(`Конфигурационный файл (${configPath}) не был найден, создана копия, записаны стандартные значения переменных.`);
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
    console.error("Ошибка подключения к базе данных:", error);
    console.error("Попробуй запусти OpenServer и phpmyadmin");
    console.error("Если запущен, то проверь пароль и логин пользователя базы данных");
  } else {
    console.log("Подключение к базе данных успешно установлено");
  }
});

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

      // Insert records into invalids_body
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

app.listen(port, () => {
    console.log(`Сервер запущен на порту: ${port}`);
    console.log(`Используй: localhost:${port}/api/testServerApi`);
});