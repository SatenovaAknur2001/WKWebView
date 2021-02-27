//
//  Model.swift
//  SlideMenu
//
//  Created by Акнур on 1/27/21.
//  Copyright © 2021 Акнур. All rights reserved.
//

import Foundation
import UIKit

enum MenuOption: Int, CustomStringConvertible {
    case Telegram
    case Instagram
    case Vk
    case Youtube
    
    
    var description: String{
        switch self {
        case .Telegram:
            return "Telegram"
            case .Instagram:
            return "Instagram"
            case .Vk:
            return "Vk"
            case .Youtube:
            return "Youtube"
        }
    }
    var image: UIImage{
        switch self {
        case .Telegram:
            return UIImage(named: "telegram") ?? UIImage()
        case .Instagram:
            return UIImage(named: "instagram") ?? UIImage()
        case .Vk:
            return UIImage(named: "vk") ?? UIImage()
        case .Youtube:
            return UIImage(named: "youtube") ?? UIImage()
        }
    }
}
