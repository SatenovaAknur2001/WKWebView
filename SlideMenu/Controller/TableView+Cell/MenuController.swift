//
//  MenuController.swift
//  SlideMenu
//
//  Created by Акнур on 1/27/21.
//  Copyright © 2021 Акнур. All rights reserved.
//


import UIKit
private let reuseIdentifier = "MenuOptionsCell"
class MenuController: UIViewController {
    
    var tableView: UITableView!
    var delegate: HomeControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
     configureTableView()
    }

    func configureTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = .darkGray
        
        tableView.separatorStyle = .none
        tableView.rowHeight = 80
        
        tableView.register(MenuOptionCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
         tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
         tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }
}

extension MenuController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MenuOptionCell
        let menuOption = MenuOption(rawValue: indexPath.row)
        cell.descriptionLabel.text = menuOption?.description
        cell.iconImageView.image = menuOption?.image
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuOption = MenuOption(rawValue: indexPath.row)
        delegate?.handleMenuToggle(forMenuOption: menuOption)
    }
}
