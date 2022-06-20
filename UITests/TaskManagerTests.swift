//
//  TaskManagerTests.swift
//  TaskManagerTests
//
//  Created by Tifo Audi Alif Putra on 06/05/22.
//

import XCTest
@testable import TaskManager

class TaskManagerTests: UITestCase {
    
    lazy var taskManagerTests = {TaskManagerScreens (app: app)} ()
    let taskDeadlineField = XCUIApplication().textFields["Enter task deadline"]
    let taskTitlefield = XCUIApplication().textFields["Enter task title"]

    func testBasicTask() {
        //app.tap()
       // app.debugDescription
        
        //Tap on Add Task Button
        taskManagerTests.addTask(button: "Add Task")
        
        //Then Add Task screen is displayed
            .selectTaskColour(colour: "Circle")
        
        taskDeadlineField.tap()
        taskDeadlineField.typeText("15July2022")
        taskTitlefield.tap()
        taskTitlefield.typeText("This is a test")
        
        taskManagerTests.selectBasicButton(buttonText: "Basic")
        taskManagerTests.saveTask()
        
    }
}
