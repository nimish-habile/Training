import json

def deleteBook():
    with open("bookData.json", "r") as file:
        data = json.load(file)
        bookId = int(input("Enter the book id to delete: "))
        flag = 0
        for i in data:
            if i["id"] == bookId:
                flag = 1
                with open(
                    "bookData.json",
                    "w",
                ) as file:
                    data.remove(i)
                    json.dump(data, file)
                break
        if flag == 0:
            print("No book exist for this book id.")
        else:
            print("Book successfully deleted from the data.")

deleteBook()
def getBook():
    with open("bookData.json") as file:
        data = json.load(file)
        print(data)
        bookId = int(input("Enter the book id to fetch: "))
        flag = 0
        for i in data:
            if i["id"] == bookId:
                flag = 1
                return i
        if flag == 0:
            print("No book exist for this book id.")


def getAllBooks():
    with open("bookData.json") as file:
        data = json.load(file)
        return data


def enterBook():
    with open("bookData.json", "r") as file:
        data = json.load(file)
        book = {
            "id": 5,
            "title": "Learning JavaScript Design Patterns",
            "subtitle": "A JavaScript and jQuery Developer's Guide",
            "author": "Addy Osmani",
            "published": "2012-08-30T00:00:00.000Z",
            "publisher": "O'Reilly Media",
            "pages": 254,
            "description": "With Learning JavaScript Design Patterns, you'll learn how to write beautiful, structured, and maintainable JavaScript by applying classical and modern design patterns to the language. If you want to keep your code efficient, more manageable, and up-to-date with the latest best practices, this book is for you.",
            "website": "http://www.addyosmani.com/resources/essentialjsdesignpatterns/book/",
        }
        flag = 0
        for i in data:
            if i["id"] == book["id"]:
                flag = 1
                break
        if flag:
            print("Book with this id already exists in the data.")
        else:
            data.append(book)
            with open(
                "bookData.json",
                "w",
            ) as file:
                json.dump(data, file, indent=4)
            print("Book successfully entered in the data.")


def editBook():
    with open("bookData.json", "r") as file:
        data = json.load(file)
        bookId = int(input("Enter the book id to edit : "))
        flag = 0
        for i in data:
            if i["id"] == bookId:
                flag = 1
                newTitle = input("Enter new title : ")
                newSubTitle = input("Enter new subtitle : ")
                newAuthor = input("Enter new Author name: ")
                i["title"] = newTitle
                i["subtitle"] = newSubTitle
                i["author"] = newAuthor
                break
        if flag:
            with open(
                "bookData.json",
                "w",
            ) as file:
                json.dump(data, file, indent=4)
            print("Book details successfully updated in the data.")
        else:
            print("No such books exists with the given book id.")
