//
//  MainView.swift
//  TLineMemorizer
//
//  Created by Orszagh Sandor on 2022. 08. 22..
//

import Foundation

class MainView {
    
    var formState : FormState = FormState.invisible
    var questionIndex: Int = 0
    var count: Int = 0
    var formDetail : String = "hello"
    var question : String = ""
    var answer : String = ""
    var difference = [("", "")]
    var appState : AppState = AppState.start
    
    
    
    init(){ clear() }
    
    func clear() {
        print("\u{001B}[2J")
    }
    
    func screenUpdate(_ appstate : AppState){
        appState = appstate
        
        switch appState {
            
            case .start :
            
                clear()
                topHeader()
                menuDetail()
                //newLine()
                //form()
            
            case .rightAnswer :
            
                clear()
                topHeader()
                menuDetail()
                //newLine()
                formState = FormState.right
                form()
        
            case .wrongAnswer :
                clear()
                topHeader()
                menuDetail()
                //newLine()
                formState = FormState.wrong
                form()
            
            case .help :
                clear()
                topHeader()
                menuDetail()
                //newLine()
                formState = FormState.help
                form()
            
            case .end :
            
                clear()
                topHeader()
                menuDetail()
                //newLine()
                formState = FormState.end
                form()
            
            case .allData:
                clear()
                menuDetail()
                formState = FormState.allData
                form()
            
            default :
            
                //print("MainView.screenUpdate.Default")
                clear()
                topHeader()
                menuDetail()
                //newLine()
                formState = FormState.question
                form()
        }

    }
    
    func topHeader(){
        print("Line Memorizer Terminal ------ v0.1 ------ 2022 OBS")
    }
    
    func menuDetail(){
        print(" › s = Start › sb = Star Backward  › h = Help › a = List all › b = Back › q = Quit ")
    }
    
    func form() {
        
        switch formState {
            case .question:
                print("\(questionIndex)/\(count-1)")
                print("Question: \(question)")
            case .right:
                print("Yesss!!! You Right!")
                print("Press enter to continuous...")
            case .wrong:
                print("Sorry... wrong")
                print("Press enter to continuous...")
            case .allData:
                print("All Data")
                print("_____________")
                print(formDetail)
            case .invisible:
                print("")
            case .help:
                if answer != "" {
                    print("Help:\(answer)")
                } else {
                    print("Start your question")
                }
        case .end:
            
            print("Congratulation! You are finishing our lesson!")
        }
    }
    
    func newLine(){
        print("\n")
    }
    
}
