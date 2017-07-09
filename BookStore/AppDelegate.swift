//
//  AppDelegate.swift
//  BookStore
//
//  Created by M Usman Saeed on 08/07/2017.
//  Copyright © 2017 MUS. All rights reserved.
//

import UIKit
import BNRCoreDataStack


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    public var persistentContainer : NSPersistentContainer!
    var window: UIWindow?

    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        
        persistentContainer = NSPersistentContainer(name: "BookStore")
        
        persistentContainer.loadPersistentStores() { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
            
            self.seedInitialData()
        }
    }
    
    private func seedInitialData() {
        
        let moc = persistentContainer.newBackgroundContext()
        
        moc.performAndWait() {
            // `countInContext` is a convenience extension
            // provided by BNR Core Data Stack.
            if try! Book.countInContext(moc) == 0 {
                let books = Book.books
                for bookTitle in books {
                    let book = Book(context: moc)
                    book.bookTitle = bookTitle
                }
                
                do {
                    try moc.save()
                } catch {
                    fatalError("Saving records should not fail. Error: \(error)")
                }
            }
        }
 
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
//        self.saveContext()
    }

    
}

