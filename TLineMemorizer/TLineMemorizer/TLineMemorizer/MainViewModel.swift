//
//  ViewModel.swift
//  TLineMemorizer
//
//  Created by Orszagh Sandor on 2022. 08. 22..
//

import Foundation

class MainViewModel {
    
    var lines = [LMViewModel]()
    var textSeparator:String = "§"
    
    
    init() {}
    
    func loadData() {
        
        var index : Int = 0
        let data = Loader.fetch()
        let rawLines = data.split(whereSeparator: \.isNewline)
        
        lines = rawLines.map { rawLine in
            
            let typeOfQuestion = String(rawLine.split(separator: textSeparator)[0])
            let question = String(rawLine.split(separator: textSeparator)[1])
            let answer   = String(rawLine.split(separator: textSeparator)[2])
            
            let elementOfLMViewModel = LMViewModel(index,typeOfQuestion,question,answer)
            
            index = index + 1
            
            return elementOfLMViewModel
        }
    }
    
    func getAllData() ->[LMViewModel] {
        return lines
    }
    
    func countOfLines()->Int {
        return lines.count
    }
    
}

struct LMViewModel {
    private var model = LMModel(id:0,typeOfQuestion:"",question:"",answer:"")
    
    init(_ i:Int, _ t:String, _ q:String, _ a:String) {
        id = i
        typeOfQuestion = t
        question = q
        answer = a
    }
    
    var id : Int {
        get {
            return self.model.id
        }
        set {
            self.model.id = newValue
        }
    }
    
    var typeOfQuestion : String {
        get {
            return self.model.typeOfQuestion
        }
        set {
            self.model.typeOfQuestion = newValue
        }
    }
    
    var question : String {
        get {
            return self.model.question
        }
        set {
            self.model.question = newValue
        }
    }
    
    var answer : String {
        get {
            return self.model.answer
        }
        set {
            self.model.answer = newValue
        }
    }
}
