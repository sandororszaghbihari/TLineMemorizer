//
//  BusinessLogic.swift
//  TLineMemorizer
//
//  Created by Orszagh Sandor on 2022. 08. 22..
//

import Foundation
class BusinessLogic {
    
    var appState : AppState = .start
    var mainViewModel = MainViewModel()
    var consoleInput = ConsoleInput()
    var mainView = MainView()
        
    var indexOfQuestion: Int? = nil
    var countOfQuestion: Int = 0
    var lastInput : String? = nil
    var stat : (countOfRight: Int, countOfWrong: Int) = (0,0)
    
    
    init(appState: AppState) {
        countOfQuestion = mainViewModel.countOfLines()
        self.appState = appState
    }
    
    func lastInputEval(){
        
        guard lastInput != "" else {
            
            switch appState {
            case .start:
                appState = .newQuestion
            case .startBackward:
                appState = .newQuestion
            case .allData:
                appState = .allData
            case .newQuestion:
                appState = .newQuestion
            case .sameQuestion:
                appState = .newQuestion
            case .waitForAnswer:
                appState = .waitForAnswer
            case .rightAnswer:
                appState = .newQuestion
            case .wrongAnswer:
                appState = .sameQuestion
            case .quit:
                appState = .quit
            case .statistic:
                appState = .sameQuestion
            case .back:
                appState = .sameQuestion
            case .answered:
                appState = .answered
            case .help:
                if indexOfQuestion == nil {
                    appState = .newQuestion
                } else {
                    appState = .sameQuestion
                }
            case .end:
                appState = .quit
            case .choosenFile:
                appState = .start
            }
            return
        }
        
        switch lastInput {
            case "q"    : appState = .quit
            case "s"    : appState = .newQuestion
            case "sb"   : appState = .startBackward
            case "a"    : appState = .allData
            case "b"    : appState = .back
            case "h"    : appState = .help
            default     : appState = .answered
        }
    }
    
    func Update(){
        
        switch appState {
            
            case .start:         start()
            case .startBackward: startBackward()
            case .allData:       allData()
            case .newQuestion:   newQuestion()
            case .waitForAnswer: waitForAnswer()
            case .rightAnswer:   rightAnswer()
            case .wrongAnswer:   wrongAnswer()
            case .quit:          quit()
            case .statistic:     statistic()
            case .back:          back()
            case .answered:      answered()
            case .sameQuestion:  sameQuestion()
            case .help:          help()
            case .end:           end()
            case .choosenFile:   choosenFile()
            
                                 
        }
    }
    
    //---Do section
    
    func choosenFile() {
        
    }
    
    
    func startBackward() {
        mainViewModel.lines = mainViewModel.lines.reversed()
        start()
    }
    
    func start() {

        mainView.count = mainViewModel.countOfLines()
        self.countOfQuestion = mainViewModel.countOfLines()
    }

    func allData() {}

    func newQuestion() {
        
        guard indexOfQuestion != nil else {
            indexOfQuestion = 0
            mainView.question = mainViewModel.lines[indexOfQuestion!].question
            mainView.answer = mainViewModel.lines[indexOfQuestion!].answer
            mainView.questionIndex = indexOfQuestion!
            mainView.count = countOfQuestion
            return
        }
        
        guard indexOfQuestion! < countOfQuestion - 1 else {
            appState = .end
            return
        }
        
        indexOfQuestion = (indexOfQuestion!) + 1
        mainView.question = mainViewModel.lines[indexOfQuestion!].question
        mainView.answer = mainViewModel.lines[indexOfQuestion!].answer
        mainView.questionIndex = indexOfQuestion!
        mainView.count = countOfQuestion
    }

    func waitForAnswer() {}

    func rightAnswer() {
        stat.countOfRight = stat.countOfRight + 1
        mainView.appState = appState
        mainView.formState = .right
        appState = .newQuestion
    }

    func wrongAnswer() {
        stat.countOfWrong = stat.countOfWrong + 1
        mainView.appState = appState
        mainView.formState = .wrong
    }

    func quit() {}

    func statistic() {}
    
    func back() {
        
        guard indexOfQuestion != nil else {
            appState = .newQuestion
            newQuestion()
            return
        }
        
        if indexOfQuestion! > 0 {
            indexOfQuestion = indexOfQuestion! - 1
            mainView.question = mainViewModel.lines[indexOfQuestion!].question
            mainView.answer = mainViewModel.lines[indexOfQuestion!].answer
            mainView.questionIndex = indexOfQuestion!
            mainView.count = countOfQuestion
        }
        appState = .sameQuestion
        
    }

    func answered() {
        
        let yourAnswer = lastInput?
            .lowercased()
            .trimmingCharacters(in: .whitespacesAndNewlines)
        
        let officialAnswer = mainViewModel.lines[indexOfQuestion!].answer
            .lowercased()
            .trimmingCharacters(in: .whitespacesAndNewlines)

        
        if yourAnswer == officialAnswer {
            appState = .rightAnswer
        } else {
            //mainView.difference = zip(yourAnswer!, officialAnswer).filter{ $0 != $1 }
            appState = .wrongAnswer
        }
        
    }
    
    func sameQuestion() {
        
    }
    
    func help() {
        appState = .help
    }
    
    func end() {
        
    }
    
    //---End of Do section

    
}
