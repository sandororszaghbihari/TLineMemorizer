//
//  Utils.swift
//  TLineMemorizer
//
//  Created by Orszagh Sandor on 2022. 08. 22..
//

import Foundation

enum AppState {
    
    case choosenFile, start, startBackward, allData, newQuestion, sameQuestion, waitForAnswer, rightAnswer, wrongAnswer, quit, statistic, back, answered, help, end
}

enum FormState {
    
    case question, right, wrong, allData, invisible, help, end
}
