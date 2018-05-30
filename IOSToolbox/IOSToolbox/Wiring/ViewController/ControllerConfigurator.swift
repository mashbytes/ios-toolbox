import Foundation
import UIKit

protocol ControllerConfigurator {
    
    func configure<T: UIViewController>(_ target: T)
    
}

