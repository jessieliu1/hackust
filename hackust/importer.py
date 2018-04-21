import os
import flask
import hackust
from PIL import Image
import cv2
import pytesseract
import shutil

THIS_FOLDER = os.getcwd()
INPUT_FOLDER = hackust.app.config['UPLOAD_FOLDER']
TMP_FOLDER = os.path.join(THIS_FOLDER, "tmp")
OUTPUT_FOLDER = os.path.join(THIS_FOLDER, "txt")

def prepare_folders():
    """
    :return: void
    Creates necessary folders
    """

    for folder in [
    TMP_FOLDER, INPUT_FOLDER, OUTPUT_FOLDER
    ]:
        if not os.path.exists(folder):
            os.makedirs(folder)

def find_images(folder):
    """
    :param folder: str
        Path to folder to search
    :return: generator of str
        List of images in folder
    """

    for file in os.listdir(folder):
        full_path = os.path.join(folder, file)
        if os.path.isfile(full_path):
            try:
                _ = Image.open(full_path)  # if constructor succeeds
                yield file
            except:
                pass

def clarify_image(input_file, output_file):
    """
    :param input_file: str
    Path to image to prettify
    :param output_file: str
    Path to output image
    :return: void
    Prettifies image and saves result
    """

    image = cv2.imread(input_file)
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    gray = cv2.medianBlur(gray, 3)
    gray = cv2.threshold(gray, 0, 255, cv2.THRESH_BINARY | cv2.THRESH_OTSU)[1]

    cv2.imwrite(output_file, gray)

    #cmd = "convert -auto-level -sharpen 0x4.0 -contrast "
    #cmd += "'" + output_file + "' '" + output_file + "'"
    #os.system(cmd)  # sharpen

def run_tesseract(input_file, output_file):
    """
    :param input_file: str
    Path to image to OCR
    :param output_file: str
    Path to output file
    :return: void
    Runs tesseract on image and saves result
    """

    cmd = "tesseract "
    cmd += "'" + input_file + "' '" + output_file + "'"
    os.system(cmd)

def read_images():
    prepare_folders()
    images = list(find_images(INPUT_FOLDER))

    for image in images:
        input_path = os.path.join(
          INPUT_FOLDER,
          image
        )
        tmp_path = os.path.join(
          TMP_FOLDER,
          image
        )
        out_path = os.path.join(
          OUTPUT_FOLDER,
          image + '.txt'
        )

        clarify_image(input_path, tmp_path)
        """text = pytesseract.image_to_string(Image.open(tmp_path))
        with open(out_path, 'w') as the_file:
        the_file.write(text)"""
    
        run_tesseract(tmp_path, out_path)
        os.remove(input_path)
        os.remove(tmp_path)

    shutil.rmtree(TMP_FOLDER)
    return flask.redirect(flask.url_for('parse_text'))