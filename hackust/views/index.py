import flask
import hackust

@hackust.app.route('/', methods=['GET'])
def show_index():
    context = {}
    if flask.request.method == 'GET':
        return flask.render_template("index.html", **context)

# TODO: Complete this
def allowed_files(filename):
    return True

# TODO: 
# Return the string output of pytesseract after running it
def perform_ocr_on_recipt(image_dir):
    return True

# TODO: 
def parse_receipt_string(receipt):
    return True

# may need additional route for checking completion
@hackust.app.route('/upload', methods=['POST'])
def upload_file_and_parse():
    # first check if file has been uploaded
    if 'file' not in request.files:
        return redirect(flask.url_for('show_index'))
    file = request.files['file']
    if file.filename == '':
        flash('No selected file')
        return redirect(flask.url_for('show_index'))
    if file and allowed_file(file.filename):
        filename = secure_filename(file.filename)
        file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
        return redirect(url_for('show_index'))
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


