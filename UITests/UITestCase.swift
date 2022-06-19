//
//  UITestCase.swift
//  WeatherAppUITests
//
//  Created by Jennifer McMillan on 21/04/2022.
//

import XCTest

class UITestCase: XCTestCase {
    var app = XCUIApplication()

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        
        app.launch()
    }

    override func tearDown() {
        super.tearDown()
    }

    /// This function can be overrriden at the start of a test.
    /// Can pass in test specific launch arguments or launch envrionments.
    /// configureAppWithOptions should be used if lots of tests need a specific configuration (like not having onboarding).
    func addLaunchOptions() { }

    /// This function can be overriden from any test class
    /// Allows you to pass in a set of stubs you wish to apply before the application is launched
    /// Prevents any race conditions where assertions may start before a stub has been applied to the mock server
    func setupInitialStubsForLaunch() { }
}

