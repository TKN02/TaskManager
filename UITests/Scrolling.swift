//
//  Scrolling.swift
//  WeatherAppUITests
//
//  Created by Jennifer McMillan on 21/04/2022.
//

import XCTest

extension XCUIApplication {
    private struct Constants {
        static let topOffset = CGVector(dx: 0.5, dy: 0.4)
        static let bottomOffset = CGVector(dx: 0.5, dy: 0.8)
    }

    var screenTopCoordinate: XCUICoordinate {
        return coordinate(withNormalizedOffset: Constants.topOffset)
    }

    var screenBottomCoordinate: XCUICoordinate {
        return coordinate(withNormalizedOffset: Constants.bottomOffset)
    }

    func scrollDownTo(element: XCUIElement, maxScrolls: Int = 3) {
        for _ in 0..<maxScrolls {
            if element.exists && element.isHittable { break }
            screenBottomCoordinate.press(forDuration: 0.1, thenDragTo: screenTopCoordinate)
        }
    }

    func scrollUpTo(element: XCUIElement, maxScrolls: Int = 3) {
        for _ in 0..<maxScrolls {
            if element.exists && element.isHittable { break }
            screenTopCoordinate.press(forDuration: 0.1, thenDragTo: screenBottomCoordinate)
        }
    }

    func scrollLeft(from elementFrom: XCUIElement, to elementTo: XCUIElement, withVelocity velocity: XCUIGestureVelocity = 500.0, file: StaticString = #file, line: UInt = #line) {
        let elementCoordinate = elementFrom.coordinate(withNormalizedOffset: .zero)
        let leftOffset = CGVector(dx: elementCoordinate.screenPoint.x, dy: 0.0)

        elementCoordinate.withOffset(leftOffset).press(forDuration: 0.1, thenDragTo: elementCoordinate.withOffset(.zero), withVelocity: velocity, thenHoldForDuration: 0.0)

        XCTAssert(elementTo.exists && elementTo.isHittable, "Could not locate destination element \(elementTo)", file: #file, line: #line)
    }

    func scrollRight(from elementFrom: XCUIElement, to elementTo: XCUIElement, withVelocity velocity: XCUIGestureVelocity = 500.0, file: StaticString = #file, line: UInt = #line) {
        let elementCoordinate = elementFrom.coordinate(withNormalizedOffset: .zero)
        let rightOffset = CGVector(dx: elementCoordinate.screenPoint.x, dy: 0.0)

        elementCoordinate.withOffset(.zero).press(forDuration: 0.1, thenDragTo: elementCoordinate.withOffset(rightOffset), withVelocity: velocity, thenHoldForDuration: 0.0)

        XCTAssert(elementTo.exists && elementTo.isHittable, "Could not locate destination element \(elementTo)", file: #file, line: #line)
    }
}

