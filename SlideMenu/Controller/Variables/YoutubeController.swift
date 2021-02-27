//
//  SettingsController.swift
//  SlideMenu
//
//  Created by Акнур on 1/28/21.
//  Copyright © 2021 Акнур. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class YoutubeController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        let webView = WKWebView(frame: view.frame)
        view.addSubview(webView)
        
        let url = URL(string: "https://www.youtube.com")!
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
