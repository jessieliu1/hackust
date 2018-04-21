import os

# insert DB name, create with sqlite3
SQLALCHEMY_DATABASE_URI = ''  # For future implementations of SQL ALCHEMY
SEND_FILE_MAX_AGE_DEFAULT = 0
UPLOAD_FOLDER = 'static/uploads/'
# TODO: @Nathan create sqlite3 db in var
DATABASE_FILENAME = os.path.join(
        os.path.dirname(os.path.dirname(os.path.realpath(__file__))),
        'var', 'hackust.sqlite3'
        )
