from flask import Flask, jsonify, request
import json

app = Flask(__name__)


def readData():
    with open("bookdata.json") as book:
        return json.load(book)


def writeData(data):
    with open("bookdata.json", "w") as book:
        json.dump(data, book, indent=4)


@app.route("/books", methods=["GET"])
def getAllBooks():
    data = readData()
    return jsonify(data)


@app.route("/books/<int:book_id>", methods=["GET"])
def getBook(bookId):
    data = readData()
    book = next((b for b in data if b["id"] == bookId), None)
    if book:
        return jsonify(book)
    else:
        return ("Not Found", 404)


@app.route("/books", methods=["POST"])
def createBook():
    data = readData()
    newEntry = request.json

    if any(i["id"] == newEntry["id"] for i in data):
        return ({"error": "Book with this ID already exists."}, 400)

    data.append(newEntry)
    writeData(data)
    return (jsonify(newEntry), 201)


@app.route("/books/<int:bookId>", methods=["PUT"])
def updateBook(bookId):
    data = readData()
    book = next((b for b in data if b["id"] == bookId), None)
    if not book:
        return ("Not Found", 404)
    book.update(request.json)
    writeData(data)
    return jsonify(book)


@app.route("/books/<int:bookId>", methods=["DELETE"])
def deleteBook(bookId):
    data = readData()
    newData = [b for b in data if b["id"] != bookId]
    if len(newData) == len(data):
        return ("Book with the given id to delete not found", 404)
    writeData(newData)
    return ("Successfully deleted", 204)


if __name__ == "__main__":
    app.run(debug=True)