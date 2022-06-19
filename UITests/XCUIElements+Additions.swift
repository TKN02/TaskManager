//
//  XCUIElement+Additions.swift
//  WeatherAppUITests
//
//  Created by Jennifer McMillan on 21/04/2022.
//

import XCTest

extension XCUIElement {
    // MARK: Inspection
    var isOn: Bool {
        value as? String == "1"
    }

    // MARK: - Assertions

    @discardableResult
    func assertIsDisplayed(matchingRegex regex: NSRegularExpression, file: StaticString = #file, line: UInt = #line) -> Self {
        assertIsDisplayed(file: file, line: line)
        XCTAssertFalse(
            regex.matches(in: label, range: NSRange(location: 0, length: (label as NSString).length)).isEmpty,
            "Text found was \(label) but did not match regex \(regex.pattern)",
            file: #file,
            line: #line)
        return self
    }

    @discardableResult
    func assertIsDisplayed(withText text: String, partialMatch: Bool = false, file: StaticString = #file, line: UInt = #line) -> Self {
        assertIsDisplayed(file: file, line: line)
        XCTAssertEqual(label, text, "Text found was \(label) but expected \(text)", file: #file, line: #line)
        return self
    }

    @discardableResult
    func assertIsDisplayed(file: StaticString = #file, line: UInt = #line) -> Self {
        XCTAssertTrue(exists, "\(self) not found", file: file, line: line)
        return self
    }

    @discardableResult
    func assertIsNotDisplayed(file: StaticString = #file, line: UInt = #line) -> Self {
        XCTAssertFalse(exists, "Unexpectedly found \(self)", file: file, line: line)
        return self
    }

    @discardableResult
    func assertCellCount(expectedCount: Int, file: StaticString = #file, line: UInt = #line) -> Self {
        assertIsDisplayed(file: file, line: line)
        XCTAssertEqual(cells.count, expectedCount, "Found \(cells.count) but expected \(expectedCount)", file: file, line: line)
        return self
    }

    @discardableResult
    func assertIsSelected(file: StaticString = #file, line: UInt = #line) -> Self {
        XCTAssertTrue(isSelected, "\(self) is not selected", file: file, line: line)
        return self
    }

    @discardableResult
    func assertIsNotSelected(file: StaticString = #file, line: UInt = #line) -> Self {
        XCTAssertFalse(isSelected, "\(self) is not selected", file: file, line: line)
        return self
    }

    // MARK: - Interaction
    @discardableResult
    func tapHittableButton(withText text: String, file: StaticString = #file, line: UInt = #line) -> Self {
        assertIsDisplayed(withText: text)
        XCTAssert(isHittable, "🔨Element \(self) is not hittable", file: file, line: line)
        tap()
        return self
    }

    @discardableResult
    func tapHittableElement(file: StaticString = #file, line: UInt = #line) -> Self {
        assertIsDisplayed()
        XCTAssert(isHittable, "🔨Element \(self) is not hittable", file: file, line: line)
        tap()
        return self
    }

    @discardableResult
    func tapHittableCell(row: Int = 0, file: StaticString = #file, line: UInt = #line) -> Self {
        let cell = cells.element(boundBy: row)
        XCTAssert(cell.isHittable, "🔨Cell \(cell) is not hittable", file: file, line: line)
        cell.tap()
        return self
    }

    // MARK: - Other
    @discardableResult
    func waitForAndAssertExistence(timeout: WaitTime = .medium, file: StaticString = #file, line: UInt = #line) -> Self {
        XCTAssert(waitForExistence(timeout: timeout.rawValue), "\(self) did not exist on screen within the time \(timeout.rawValue)", file: file, line: line)
        return self
    }
}

