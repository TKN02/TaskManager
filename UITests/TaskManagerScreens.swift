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
    
    
    private func taskDeadline(text:String) -> XCUIElement {
        return element(withLabelContaining: text, type: .textField)
        
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
    func deadline(placeholder:String,mytext:String) -> Self {
        inActivity(named: "Task Deadline") {
            taskDeadline(text: placeholder).typeText(mytext)
        }
        return self
    }
}


