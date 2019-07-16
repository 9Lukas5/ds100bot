import sqlite3

class Database:
    def __init__(self, db, verbose):
        self.sql = sqlite3.connect('info.db')
        self.verbose = verbose
        self.cursor = self.sql.cursor()
        self.readonly = (db == 'readonly')
        if self.verbose >= 0 and self.readonly:
            print('Running with readonly database')

    def close_sucessfully(self):
        self.cursor.close()
        self.sql.commit()
        self.sql.close()