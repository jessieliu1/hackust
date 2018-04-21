import os
import sqlite3
import flask
import hackust
import datetime



def dict_factory(cursor, row):
    """
    Convert database row objects to a dictionary.

    This is useful for building dictionaries to render a template.
    Note that this would be inefficient for large queries.
    """
    output = {}
    for idx, col in enumerate(cursor.description):
        output[col[0]] = row[idx]
    return output


def get_db():
    """Open a new database connection."""
    if not hasattr(flask.g, 'sqlite_db'):
        flask.g.sqlite_db = sqlite3.connect(hackust.app.config['DATABASE_FILENAME'])
        flask.g.sqlite_db.row_factory = dict_factory

        # Foreign keys have to be enabled per-connection.  This is an sqlite3
        # backwards compatibility thing.
        flask.g.sqlite_db.execute("PRAGMA foreign_keys = ON")

    return flask.g.sqlite_db


def query_db(query, args=(), one=False):
    """Template functions for executing sql queries upon database."""
    cur = get_db().execute(query, args)
    result = cur.fetchall()
    cur.close()
    return (result[0] if result else None) if one else result


@hackust.app.route('/query/')
def show_receipts():

    receipt_id = flask.request.args.get("receipt_id", default=None, type=int)
    num_receipts = flask.request.args.get("num_receipts", default=None, type=int)
    if num_receipts:
        last_receipt_id = query_db("Select MAX(receipt_id) AS 'receipt_id' FROM receipt")[0]['receipt_id']
        receipts = []
        i = 0
        while i != num_receipts and last_receipt_id != -1:
            receipt = query_db("Select * from receipt where receipt_id=?", (last_receipt_id,))
            if receipt:
                receipt[0]["items"] = query_db("Select name, price from item where receipt_id=?", (last_receipt_id,))
                receipts.append(receipt)
                i += 1
            last_receipt_id -= 1
        return flask.jsonify(receipts)


    if receipt_id:
        receipt = query_db("Select * from receipt where receipt_id=?", (receipt_id,))
        receipt[0]["items"] = query_db("Select name, price from item where receipt_id=?", (receipt_id,))

        return flask.jsonify(receipt[0])

    receipts = []

    day = flask.request.args.get("day", default=None, type=int)
    if not day:
        receipts = query_db("Select * from receipt")
    else:
        early_date = flask.request.args.get("early_date", default=None, type=str)
        curr_date_str = flask.request.args.get("curr_date_str", default=None, type=str)
        if not early_date or not curr_date_str:
            curr_date = datetime.datetime.now()
            curr_date_str = str(curr_date).split(" ")[0]
            difference = datetime.timedelta(days=-day)
            early_date = str(curr_date + difference)
        receipts = query_db("Select * from receipt where purchase_date between ? and ?", (early_date, curr_date_str,))
    for receipt in receipts:
        receipt['items'] = query_db("Select name, price from Item where receipt_id=?", (receipt['receipt_id'],))

    return flask.jsonify(receipts)

def insert_receipts(receipts):
    last_receipt_id = query_db("Select MAX(receipt_id) AS 'receipt_id' FROM receipt")[0]['receipt_id']
    for receipt in receipts:
        print("Inserting\n")
        print(receipt)
        print("date: ")
        print(str(receipt["date"]))
        print("Last receipt id")
        print(last_receipt_id)
        if not receipt["date"]:
            receipt["date"] = datetime.datetime.now().date()
            receipt["time"] = datetime.datetime.now().time()
        #receipt["total"] = line.translate(None, '!@#$')

        query_db("Insert into receipt(receipt_id, store, purchase_date, purchase_time) VALUES(?, ?, ?, ?)",
            (last_receipt_id + 1, receipt["store"], str(receipt["date"]), str(receipt["time"]),))
        last_receipt_id += 1
    return flask.redirect(flask.url_for('show_index'))
