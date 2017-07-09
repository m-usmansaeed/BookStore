//
//  NewBookVC.swift
//  BookStore
//
//  Created by M Usman Saeed on 09/07/2017.
//  Copyright © 2017 MUS. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class NewBookVC: UIViewController {
    @IBOutlet weak var titleConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var txtFieldBookTitle: UITextField!
    @IBOutlet weak var txtFieldPrice: UITextField!
    @IBOutlet weak var btnSaveBook: UIButton!
    
    var disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UIDevice.current.orientation.isLandscape {
            self.registerUIObservers()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {

        if UIDevice.current.orientation.isLandscape {
           self.registerUIObservers()
            
        }
    }
    
    func registerUIObservers(){
        
        txtFieldBookTitle.rx.controlEvent(.editingDidBegin)
            .asObservable()
            .subscribe(onNext: {
                self.titleConstraint.constant = (self.navigationController?.navigationBar.frame.origin.y)! + 8
                self.view.layoutIfNeeded()
            }).addDisposableTo(disposeBag)
        
        
    }
    
}
