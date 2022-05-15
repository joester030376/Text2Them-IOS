//
//  Redirection.swift
//  DIOS Transportation
//
//  Created by mac on 12/03/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
import UIKit

protocol RedirectionProtocol {
    
    static func getViewController() -> UIViewController
    
}


protocol StoryboardRedirectionProtocol: RedirectionProtocol {
    
    static var storyboard: UIStoryboard { get }
    
    static var storyboardIdentifier: String { get }
    
}


extension StoryboardRedirectionProtocol where Self: UIViewController {
    
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
    
    
    private static func fromStoryboard() -> Self {
        
        let viewController = storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as! Self
        return viewController
    }
    
    static func getViewController() -> UIViewController {
        return fromStoryboard()
    }
    
}




protocol DashBoardRedirectionProtocol: RedirectionProtocol {
    
    static var storyboard: UIStoryboard { get }
    
    static var storyboardIdentifier: String { get }
    
}


extension DashBoardRedirectionProtocol where Self: UIViewController {
    
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "Dashboard", bundle: nil)
    }
    
    
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
    
    
    private static func fromStoryboard() -> Self {
        
        let viewController = storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as! Self
        return viewController
    }
    
    static func getViewController() -> UIViewController {
        return fromStoryboard()
    }
    
}

