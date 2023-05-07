//
//  main.swift
//  TLineMemorizer
//
//  Created by Orszagh Sandor on 2022. 08. 22..
//

import Foundation

var bl = BusinessLogic(appState: .start)
bl.mainViewModel.loadData()
bl.Update()

var iterate = 0
while bl.appState != .quit {
    
    bl.mainView.screenUpdate(bl.appState)     //---appSate re jellemzo kepernyo
    bl.lastInput = bl.consoleInput.getInput() //---interakcio a userrel
    bl.lastInputEval()                        //---az interakcio válaszának kiertekelese
    bl.Update()                               //Budiness Logic Control Flow az appState-ekkel
    
    iterate=iterate + 1
    
}

//goodbye kepernyo
//    print(bl.appState)
//    print(bl.indexOfQuestion)
//    print(bl.countOfQuestion)

