//
//  BaseScreen.swift
//  WeatherAppUITests
//
//  Created by Jennifer McMillan on 21/04/2022.
//

import XCTest

public class BaseScreen {
    let app: XCUIApplication

    init(app: XCUIApplication) {
        self.app = app
    }

    func element(withLabelContaining text: String, type: XCUIElement.ElementType) -> XCUIElement {
        let predicate = NSPredicate(format: "label CONTAINS[c] '\(text)'")
        return app.descendants(matching: type).matching(predicate).firstMatch
    }

    @discardableResult
    func inActivity<T>(named name: String, block: () -> T) -> T {
        return XCTContext.runActivity(named: "\(Self.self) \(name)") { _ in
            return block()
        }
    }
}


