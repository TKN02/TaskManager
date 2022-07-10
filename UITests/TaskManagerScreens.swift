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
    
    private func initialTabs(tabText:String) ->XCUIElement {
        return element(withLabelContaining: tabText, type: .button).firstMatch
    }
    
    private func addTaskButton(text :String) -> XCUIElement {
        return element(withLabelContaining: text, type: .button).firstMatch
    }
    //In BaseScreen,you need to defife as XCUIElementQuery
    private func taskColour(colour: String,number: Int) -> XCUIElement {
        return element(withLabelContaining: colour, type: .button).element(boundBy: number)
        
    }
    
    private func tasks(text:String) -> XCUIElement {
        return element(withLabelContaining: text, type: .textField).firstMatch
        
    }
    //if you use [], you need to start with app then the element
    private func taskTypeButtons(button:String) -> XCUIElement {
        return app.buttons[button].firstMatch
    }
    
    private var saveTaskButton:XCUIElement {
        return app.buttons.matching(identifier: "Save Task").firstMatch
    }
    //doing same as matching identifier
    private var taskDeadlineField: XCUIElement {
        return app.textFields["Enter task deadline"].firstMatch
    }
    private var taskTitlefield: XCUIElement {
        return app.textFields["Enter task title"].firstMatch
    }
    
    
    
    
    
    
    // MARK: - Steps
    
    @discardableResult
    func upcomingTask(buttonText:String) -> Self {
        inActivity(named: "Upcoming Button") {
            initialTabs(tabText: buttonText).tapHittableButton(withText: buttonText)
        }
        return self
    }
    
    @discardableResult
    func addTask(button:String) -> Self {
        inActivity(named: "Add Task") {
            addTaskButton(text: button).tapHittableButton(withText: button)
        }
        return self
    }
    
    @discardableResult
    func selectTaskColour(colour: String, number:Int ) -> Self {
        inActivity(named: "selectTaskColour"){
            taskColour(colour: colour, number: number).tap()
        }
        return self
    }
    
    @discardableResult
    func deadline(text:String) -> Self {
        inActivity(named: "Task Deadline") {
            taskDeadlineField.tap()
            taskDeadlineField.typeText(text)
        }
        return self
    }
    
    @discardableResult
    func title(text:String) -> Self {
        inActivity(named: "Task Title") {
            taskTitlefield.tap()
            taskTitlefield.typeText(text)
        }
        return self
    }

    @discardableResult
    func selectButton(buttonText:String) -> Self {
        inActivity(named: "Select\(buttonText) Button") {
            if !(taskTypeButtons(button: buttonText)).isHittable {
                app.tap()
                taskTypeButtons(button: buttonText).tap()
          }
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
