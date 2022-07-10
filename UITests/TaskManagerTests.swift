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

    func testBasicTask() {
        
        //Tap on Add Task Button
        taskManagerTests.upcomingTask(buttonText: "Upcoming")
        taskManagerTests.addTask(button: "Add Task")
        
        //Then Add a Basic Task
            .selectTaskColour(colour: "Circle", number: 3)
            .deadline(text: "15July2022, 15:30")
            .title(text: "This is a Basic Task test")
            .selectButton(buttonText: "Basic")
       
        
        //Save Task
            .saveTask()
    }
        
    func testUrgentTask() {
            
            //Tap on Add Task Button
        taskManagerTests.upcomingTask(buttonText: "Done")
            taskManagerTests.addTask(button: "Add Task")
            
            //Then select Task Colour Red
            .selectTaskColour(colour: "Circle", number: 2)
            //Then complete other fields
            .deadline(text: "29July2022, 16:00")
            .title(text: "This is an urgent task, Please complete asap")
            .selectButton(buttonText: "Urgent")
        
            //Save Task
            .saveTask()
        }
    
}
