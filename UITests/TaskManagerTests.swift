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

    func testExample() {
        //app.tap()
       // app.debugDescription
        
        //Tap on Add Task Button
        taskManagerTests.addTask(button: "Add Task")
        
        //Then Add Task screen is displayed
            .selectTaskColour(colour: "Circle")
        
            .deadline(placeholder: "Enter task deadline", mytext: "This is a test")
        
    }

}
