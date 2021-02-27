//
//  HomeController.swift
//  SlideMenu
//
//  Created by Акнур on 1/27/21.
//  Copyright © 2021 Акнур. All rights reserved.
//


import UIKit

class HomeController: UIViewController {
    
    var delegate: HomeControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavigationBar()
        view.backgroundColor = .yellow
        addControl()
    }
    func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        navigationItem.title = "Side Menu"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
//        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "plus"), style: .plain, target: self, action: #selector(save))
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(save))
     
        
        //MARK: - Alert
        
    let alertController = UIAlertController(title: "Add New Browser", message: "", preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
               textField.placeholder = "Enter  Name"
           }
        let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { alert -> Void in
               let firstTextField = alertController.textFields![0] as UITextField
               let secondTextField = alertController.textFields![1] as UITextField
           })
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {
               (action : UIAlertAction!) -> Void in })
        alertController.addTextField { (textField : UITextField!) -> Void in
               textField.placeholder = "Enter Link"
           }
           
           alertController.addAction(saveAction)
           alertController.addAction(cancelAction)
           
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func handleMenuToggle() {
        delegate?.handleMenuToggle(forMenuOption: nil)
    }
     
//    @objc func save () {
//        let alertController = UIAlertController(title: "Add a new browser", message: "Please write email", preferredStyle: .alert)
//
//        let saveAction = UIAlertAction(title: "Save", style: .default) { [unowned self] action  in
//            guard let textField = alertController.textFields?.first, let athToadd = textField.text else {return}
//            self
           
            func addControl() {
               let segmentItems = ["Browser", "Favourite"]
               let control = UISegmentedControl(items: segmentItems)
               control.frame = CGRect(x: 10, y: 250, width: (self.view.frame.width - 20), height: 50)
               control.addTarget(self, action: #selector(segmentControl(_:)), for: .valueChanged)
               control.selectedSegmentIndex = 1
               view.addSubview(control)
            }
    @objc func segmentControl(_ segmentedControl: UISegmentedControl) {
       switch (segmentedControl.selectedSegmentIndex) {
          case 0:
             // First segment tapped
          break
          case 1:
             // Second segment tapped
          break
          default:
          break
       }
    }
        }


