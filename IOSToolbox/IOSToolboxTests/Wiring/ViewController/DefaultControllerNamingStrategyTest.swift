import XCTest

class DefaultControllerNamingStrategyTest: XCTestCase {
    

    func testNamedAfterStrategy() {
        XCTAssertEqual("UIViewController", DefaultControllerNamingStrategy.namedAfter(UIViewController.self).name())
        XCTAssertEqual("EnglandWorldCupWinnersViewController", DefaultControllerNamingStrategy.namedAfter(EnglandWorldCupWinnersViewController.self).name())
        XCTAssertEqual("EnglandWorldCupLosersViewController", DefaultControllerNamingStrategy.namedAfter(EnglandWorldCupLosersViewController.self).name())
    }
    
    func testNamedAfterWithoutViewControllerSuffix() {
        XCTAssertEqual("UI", DefaultControllerNamingStrategy.namedAfterWithoutViewControllerSuffix(UIViewController.self).name())
        XCTAssertEqual("EnglandWorldCupWinners", DefaultControllerNamingStrategy.namedAfterWithoutViewControllerSuffix(EnglandWorldCupWinnersViewController.self).name())
        XCTAssertEqual("EnglandWorldCupLosers", DefaultControllerNamingStrategy.namedAfterWithoutViewControllerSuffix(EnglandWorldCupLosersViewController.self).name())
    }
    
    func testNamedExplcitly() {
        XCTAssertEqual("MySpeciallyNameViewController", DefaultControllerNamingStrategy.namedExplicitly("MySpeciallyNameViewController").name())
        XCTAssertEqual("EnglandWorldCupWinners", DefaultControllerNamingStrategy.namedExplicitly("EnglandWorldCupWinners").name())
    }


}
