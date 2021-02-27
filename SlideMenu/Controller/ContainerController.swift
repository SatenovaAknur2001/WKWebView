//
//  ContainerController.swift
//  SlideMenu
//
//  Created by Акнур on 1/27/21.
//  Copyright © 2021 Акнур. All rights reserved.
//


import UIKit

class ContainerController: UIViewController {
    var window: UIWindow?
    var menuController:  MenuController!
    var centerController: UIViewController!
    var isExpanded = false
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeController()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation{
        return.slide
    }
    override var prefersStatusBarHidden: Bool{
        return isExpanded
    }
    
    func configureHomeController() {
        let homeController = HomeController()
        centerController  = UINavigationController(rootViewController: homeController)
        homeController.delegate = self
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    
    func configureMenuController() {
        if menuController == nil {
            menuController = MenuController()
            view.insertSubview(menuController.view, at: 0)
            menuController.delegate = self 
            addChild(menuController)
            menuController.didMove(toParent: self)
            
            
        }
    }
    func animatePanel(shouldExpand: Bool, menuOption: MenuOption?) {
        if shouldExpand{
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80
            }, completion: nil)
        }else{
        
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                self.centerController.view.frame.origin.x = 0
            }) { (_) in
                guard let menuOption = menuOption else {return}
                self.didSelectMenuOption(menuOption: menuOption)
            }
        }
        animateStatusBar()
    }
    
    func didSelectMenuOption(menuOption: MenuOption) {
        switch menuOption {
        case .Telegram:
            let vc = TelegramController()
            self.navigationController?.pushViewController(vc, animated: true)
        case .Instagram:
            let vc  = InstagramViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case .Vk:
          let vc  = VkViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case .Youtube:
            let controller = YoutubeController()
            present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
        
  
        }
    }
    func animateStatusBar() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
        }, completion: nil)
    }
}
extension ContainerController: HomeControllerDelegate {
    func handleMenuToggle(forMenuOption menuOption: MenuOption?) {
        if !isExpanded {
            configureMenuController()
        }
        
        isExpanded.toggle()
        animatePanel(shouldExpand: isExpanded, menuOption: menuOption)
    }
    
    
}
