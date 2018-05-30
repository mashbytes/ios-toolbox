import XCTest

class DefaultControllerInstantiatorTest: XCTestCase {
    

    func testInstantiatesNibViewController() {
        let instantiator = DefaultControllerInstantiator.nib(DefaultControllerNamingStrategy.namedAfter(EnglandWorldCupWinnersViewController.self))
        let controller: EnglandWorldCupWinnersViewController = instantiator.instantiate()
        controller.loadViewIfNeeded()
        XCTAssertNotNil(controller.label)
    }
    
    func testFailsInstantiatingNibViewControllerThatDoesntExist() {
        let instantiator = DefaultControllerInstantiator.nib(DefaultControllerNamingStrategy.namedExplicitly("FooBar"))
        do {
            try instantiator.instantiate().loadViewIfNeeded()
        } catch  {
            
        }
//        XCTAssertThrowsError()
    }
    
    func testInstantiatesStoryboardViewController() {
        let instantiator = DefaultControllerInstantiator.storyboard(DefaultControllerNamingStrategy.namedAfterWithoutViewControllerSuffix(EnglandWorldCupLosersViewController.self))
        let controller: EnglandWorldCupLosersViewController = instantiator.instantiate()
        controller.loadViewIfNeeded()
        XCTAssertNotNil(controller.toggle)
    }
    
}
