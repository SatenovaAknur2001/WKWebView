//
//  TelegramController.swift
//  SlideMenu
//
//  Created by Акнур on 2/27/21.
//  Copyright © 2021 Акнур. All rights reserved.
//

import UIKit
import WebKit
class TelegramController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red

       let webView = WKWebView(frame: view.frame)
            view.addSubview(webView)
        
            let url = URL(string: "https://web.telegram.org/#/im")!
            let request = URLRequest(url: url)
            webView.load(request)
    }
    

  

}
