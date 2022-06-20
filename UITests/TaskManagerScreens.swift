//
//  TaskManagerScreens.swift
//  TaskManagerUITests
//
//  Created by Thushari Karunatissa on 16/06/2022.
//

import Foundation
import XCTest
class TaskManagerScreens : BaseScreen {
    
    // MARK: - UI Element Queries
    
    private func addTaskButton(text :String) -> XCUIElement {
        return element(withLabelContaining: text, type: .button).firstMatch
    }
    
    private func taskColour(colour:String) -> XCUIElement {
        return app.buttons.firstMatch
    }
    
    
    private func tasks(text:String) -> XCUIElement {
        return element(withLabelContaining: text, type: .textField).firstMatch
        
    }
    
    private func taskTypeButtons(button:String) -> XCUIElement {
        return element(withLabelContaining: button, type: .button).firstMatch
    }
    
    private var saveTaskButton:XCUIElement {
        return app.buttons.matching(identifier: "Save Task").firstMatch
    }
    
    
    
    
    
    
    
    // MARK: - Steps
    @discardableResult
    func addTask(button:String) -> Self {
        inActivity(named: "Add Task") {
            addTaskButton(text: button).tapHittableButton(withText: button)
        }
        return self
    }
    
    @discardableResult
    func selectTaskColour(colour:String) -> Self {
        inActivity(named: "selectTaskColour"){
            taskColour(colour: colour).tap()
        }
        return self
    }
    
    @discardableResult
    func deadline(text:String) -> Self {
        inActivity(named: "Task Deadline") {
            tasks(text: "Enter task deadline").tap()
        }
        return self
    }
    
   @discardableResult
    func title(text:String) -> Self {
        inActivity(named: "Task Title") {
            tasks(text: "Enter task title").tap()
        }
        return self
    }
    
    @discardableResult
    func selectBasicButton(buttonText:String) -> Self {
        inActivity(named: "Select Basic Button") {
            taskTypeButtons(button: buttonText).assertIsDisplayed()
        }
        return self
    }
    
    @discardableResult
    func saveTask() -> Self {
        inActivity(named: "Save Task") {
            saveTaskButton.tap()
        }
        return self
    }
}
