//
//  main.swift
//  Library
//
//  Created by Tomiris Sultanbay on 11.02.2024.
//

import Foundation

class Book {
    let title: String
    let author: String
    let year: Int
    let pageCount: Int
    
    init(title: String, author: String, year: Int, pageCount: Int) {
        self.title = title
        self.author = author
        self.year = year
        self.pageCount = pageCount
    }
    
    func displayBookInfo() {
        print("Заголовок: \(title)")
        print("Автор: \(author)")
        print("Год: \(year)")
        print("Количество страниц: \(pageCount)")
    }
}

class Library {
    var books: [Book] = []
    
    func addBook(book: Book) {
        books.append(book)
        print("Книга успешно добавлена в библиотеку.")
    }
    
    func removeBook(at index: Int) {
        guard index >= 0 && index < books.count else {
            print("Неверный индекс книги.")
            return
        }
        books.remove(at: index)
        print("Книга успешно удалена из библиотеки.")
    }
    
    func displayLibraryInfo() {
        if books.isEmpty {
            print("Библиотека пуста.")
        } else {
            print("Книги в библиотеке:")
            for (index, book) in books.enumerated() {
                print("Книга \(index + 1):")
                book.displayBookInfo()
                print("-------------")
            }
        }
    }
}

let library = Library()

while true {
    print("Выберите действие: (1) Добавить книгу, (2) Удалить книгу, (3) Показать книги, (4) Выйти")
    if let choice = readLine(), let action = Int(choice) {
        switch action {
        case 1:
            print("Введите заголовок книги:")
            let title = readLine() ?? ""
            print("Введите автора книги:")
            let author = readLine() ?? ""
            print("Введите год выпуска книги:")
            if let year = Int(readLine() ?? "") {
                print("Введите количество страниц книги:")
                if let pageCount = Int(readLine() ?? "") {
                    let book = Book(title: title, author: author, year: year, pageCount: pageCount)
                    library.addBook(book: book)
                } else {
                    print("Неверный формат количества страниц.")
                }
            } else {
                print("Неверный формат года выпуска.")
            }
        case 2:
            print("Введите индекс книги для удаления:")
            if let index = Int(readLine() ?? "") {
                library.removeBook(at: index - 1)
            } else {
                print("Неверный формат индекса.")
            }
        case 3:
            library.displayLibraryInfo()
        case 4:
            print("Завершение работы.")
            exit(0)
        default:
            print("Неверный выбор.")
        }
    } else {
        print("Неверный выбор.")
    }
}
