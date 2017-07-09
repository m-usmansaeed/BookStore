//
//  ViewController.swift
//  BookStore
//
//  Created by M Usman Saeed on 08/07/2017.
//  Copyright © 2017 MUS. All rights reserved.
//

import UIKit
import CoreData
//import RxSwift
//import RxCocoa


class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    var persistentContainer: NSPersistentContainer!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var books = [Book]()
    
    private lazy var fetchRequest1 : NSFetchRequest<Book> = {
        let fetchRequest = NSFetchRequest<Book>()
        fetchRequest.entity = Book.entity()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "bookTitle", ascending: true)]
        return fetchRequest
    }()
    
    
//        var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        persistentContainer = appDelegate.persistentContainer
        
        
        /*
         usernameValidOutlet.text = "Username has to be at least \(minimalUsernameLength) characters"
         passwordValidOutlet.text = "Password has to be at least \(minimalPasswordLength) characters"
         
         let usernameValid = usernameOutlet.rx.text.orEmpty
         .map { $0.characters.count >= minimalUsernameLength }
         .shareReplay(1) // without this map would be executed once for each binding, rx is stateless by default
         
         let passwordValid = passwordOutlet.rx.text.orEmpty
         .map { $0.characters.count >= minimalPasswordLength }
         .shareReplay(1)
         
         
         
         let everythingValid = Observable.combineLatest(usernameValid, passwordValid) { $0 && $1 }
         .shareReplay(1)
         
         usernameValid
         .bind(to: passwordOutlet.rx.isEnabled)
         .disposed(by: disposeBag)
         
         usernameValid
         .bind(to: usernameValidOutlet.rx.isHidden)
         .disposed(by: disposeBag)
         
         passwordValid
         .bind(to: passwordValidOutlet.rx.isHidden)
         .disposed(by: disposeBag)
         
         everythingValid
         .bind(to: doSomethingOutlet.rx.isEnabled)
         .disposed(by: disposeBag)
         
         doSomethingOutlet.rx.tap
         .subscribe(onNext: { [weak self] in self?.showAlert() })
         .disposed(by: disposeBag)
         */
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getAllBooks { (finish, books) in
            if finish {
                self.books = books
                self.tableView.reloadData()
            }
        }
        
    }
    
    
    func getAllBooks(_ closure: (Bool,[Book]) -> Void) {
        
        var bks = [Book]()
        do {
            let fetchRequest = NSFetchRequest<Book>()
            fetchRequest.entity = Book.entity()
            fetchRequest.sortDescriptors = [NSSortDescriptor(key: "bookTitle", ascending: true)]
            
            bks = try persistentContainer.viewContext.fetch(fetchRequest)
            print(bks[0].bookTitle ?? "")
        }catch {
            print(error.localizedDescription)
        }
        closure(true,bks)
    }
    
    
    func showAlert() {
        let alertView = UIAlertView(
            title: "RxExample",
            message: "This is wonderful",
            delegate: nil,
            cancelButtonTitle: "OK"
        )
        
        alertView.show()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        configureCell(cell: cell, forRowAt: indexPath)
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    
    func configureCell(cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let book = books[indexPath.row]
        
        if let title = book.bookTitle{
            cell.textLabel?.text = title
        }
    }
}



































