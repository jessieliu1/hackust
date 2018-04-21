from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config.from_object('hackust.config')

db = SQLAlchemy(app)

import hackust.views
import hackust.model
