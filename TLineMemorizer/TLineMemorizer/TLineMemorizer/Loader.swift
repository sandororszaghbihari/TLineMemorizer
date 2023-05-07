//
//  Loader.swift
//  TLineMemorizer
//
//  Created by Orszagh Sandor on 2022. 08. 22..
//

import Foundation
class Loader {

    static func fetch()->String {
        
        let file = "memorized.txt"
        var result = "File Error"

        let path = Bundle.main.resourcePath!
        var dirUrl = URL(fileURLWithPath: path)
        dirUrl.appendPathComponent(file)
        
        print("Beolvasando File: \(dirUrl)")
        
        do {
            result = try String(contentsOf: dirUrl, encoding: .utf8)
        }
        catch {
            print("Error")
        }

        return result
    }
    
    
    static func fetch(fileName: String)->String {
        
        let file = fileName
        var result = "File Error"

        let path = Bundle.main.resourcePath!
        var dirUrl = URL(fileURLWithPath: path)
        dirUrl.appendPathComponent(file)
        
        print("Beolvasando File: \(dirUrl)")
        
        do {
            result = try String(contentsOf: dirUrl, encoding: .utf8)
        }
        catch {
            print("Error")
        }

        return result
    }
    
    

    
}
