import XCTest

class DefaultControllerInstantiatorTest: XCTestCase {
    

    func testInstantiatesNibViewController() {
        let instantiator = DefaultControllerInstantiator.nib(DefaultControllerNamingStrategy.namedAfter(EnglandWorldCupWinnersViewController.self))
        let controller: EnglandWorldCupWinnersViewController = instantiator.instantiate()
        controller.loadViewIfNeeded()
        XCTAssertNotNil(controller.label)
    }
    
    func testFailsToInstantiateNibViewControllerThatDoesntExist() {
        let instantiator = DefaultControllerInstantiator.nib(DefaultControllerNamingStrategy.namedExplicitly("FooBar"))
        SwiftTryCatch.try({
            instantiator.instantiate().loadViewIfNeeded()
            XCTAssertFalse(false, "Should have thrown an exception")
        }, catch: { (error) in
            XCTAssertEqual("NSInternalInconsistencyException", error.name.rawValue)
        })
    }
    
    func testInstantiatesStoryboardViewController() {
        let instantiator = DefaultControllerInstantiator.storyboard(DefaultControllerNamingStrategy.namedAfterWithoutViewControllerSuffix(EnglandWorldCupLosersViewController.self))
        let controller: EnglandWorldCupLosersViewController = instantiator.instantiate()
        controller.loadViewIfNeeded()
        XCTAssertNotNil(controller.toggle)
    }
    
    func testFailsToInstantiatesStoryboardViewController() {
        let instantiator = DefaultControllerInstantiator.storyboard(DefaultControllerNamingStrategy.namedExplicitly("FooBar"))
        SwiftTryCatch.try({
            instantiator.instantiate().loadViewIfNeeded()
            XCTAssertFalse(false, "Should have thrown an exception")
        }, catch: { (error) in
            XCTAssertEqual("NSInvalidArgumentException", error.name.rawValue)
        })
    }

}
