from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
# insert DB name, create with sqlite3
app.config['SQLALCHEMY_DATABASE_URI'] = '' 
app.config['SEND_FILE_MAX_AGE_DEFAULT'] = 0

db = SQLAlchemy(app)

import hackust.views
