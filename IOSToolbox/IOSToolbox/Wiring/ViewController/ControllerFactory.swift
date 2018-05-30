import Foundation
import UIKit

protocol ControllerFactory {
    
    func newController<T: UIViewController>(configuredUsing configurator: ControllerConfigurator, instantiatedUsing instantiator: ControllerInstantiator) -> T
    
}

extension ControllerFactory {
 
    func newController<T: UIViewController>(configuredUsing configurator: ControllerConfigurator, instantiatedUsing instantiator: ControllerInstantiator) -> T {
        let controller: T = instantiator.instantiate()
        configurator.configure(controller)
        return controller
    }

    func newController<T: UIViewController & ProvidesControllerInstantiator>(configuredUsing configurator: ControllerConfigurator) -> T {
        return newController(configuredUsing: configurator, instantiatedUsing: T.instantiator)
    }

    func newController<T: UIViewController & ProvidesControllerConfigurator>(instantiatedUsing instantiator: ControllerInstantiator) -> T {
        return newController(configuredUsing: T.configurator, instantiatedUsing: instantiator)
    }

    func newController<T: UIViewController & ProvidesControllerInstantiator & ProvidesControllerConfigurator>() -> T {
        return newController(configuredUsing: T.configurator, instantiatedUsing: T.instantiator)
    }

}


