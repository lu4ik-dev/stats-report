const mysqldump = require('mysqldump')
 
// dump the result straight to a file
mysqldump({
    connection: {
        host: 'localhost',
        user: 'root',
        password: '',
        database: 'stats-report',
    },
    dumpToFile: './dump.sql',
});