import flask
import hackust
from hackust import importer as importer
from hackust import parser
from hackust import model
import os
from werkzeug.utils import secure_filename

@hackust.app.route('/', methods=['GET'])
def show_index():
    context = {}
    if flask.request.method == 'GET':
        return flask.render_template("index.html", **context)

# TODO: Complete this
def allowed_file(filename):
    if filename[-4::] == ".jpg" or filename[-4::] == ".png":
        return True
    print("Incorrect file type")
    return False

# TODO: 
# Write string output of ocr to text file
def perform_ocr_on_recipt(image_dir):
    import_photos()

# TODO: 
def parse_receipt_string(receipts):
    return True


def edit_receipt(receipts):
    # TODO:
    # implement structure to edit the receipts
    model.insert_receipts(receipts)

@hackust.app.route('/parse_text')
def parse_text():
    config = parser.read_config()
    receipts = parser.get_files(config.receipts_path) #might need to change this
    parsed = parser.ocr_receipts(config, receipts)
    edit_receipt(parsed)
    return flask.redirect(flask.url_for('show_index'))

# may need additional route for checking completion
@hackust.app.route('/upload', methods=['POST'])
def upload_file_and_parse():
    # first check if file has been uploaded
    if 'file' not in flask.request.files:
        print('No file part')
        return flask.redirect(flask.url_for('show_index'))
    file = flask.request.files['file']
    if file.filename == '':
        print('No selected file')
        return flask.redirect(flask.url_for('show_index'))
    if file and allowed_file(file.filename):
        filename = secure_filename(file.filename)
        filepath = os.path.join(hackust.app.config['UPLOAD_FOLDER'], filename)
        file.save(filepath)
        """
        implement OCR and receipt parsing logic here
        """
        importer.read_images()

    return flask.redirect(flask.url_for('parse_text'))
    # TODO: This endpoint should delete the uploaded file after parsing the OCR output
    # Also will Persist the information in database, and perform whatever analysis necessary

# TODO: Finish Implementation
@hackust.app.route('/receipts', methods=['GET'])
def get_all_receipts():
    receipts_json = {}
    return flask.render_template("index.html", **receipts_json)

# TODO: Finish Implementation
@hackust.app.route('/receipts/<int:receipt_id>', methods=['GET'])
def get_all_receipts_by_id(receipt_id):
    receipts_json = {}
    return flask.render_template("index.html", **receipts_json)

# TODO: Finish Implementation
@hackust.app.route('/transactions', methods=['GET'])
def get_all_transactions():
    transactions_json = {}
    return flask.render_template("index.html", **transactions_json)

# TODO: Finish Implementation
@hackust.app.route('/transactions/<int:receipt_id>', methods=['GET'])
def get_transactions_by_receipt_id(receipt_id):
    transactions_json = {}
    return flask.render_template("index.html", **transactions_json)


