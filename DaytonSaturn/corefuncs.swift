//
//  corefuncs.swift
//  DaytonSaturn
//
//  Created by Paul Casiero on 10/28/26.
//


import Foundation

func writeSchedule(_ b1: String,
                  _ b2: String,
                  _ b3: String,
                  _ l1: String,
                  _ l2: String,
                  _ l3: String,
                  _ b5: String,
                  _ b6: String,
                   _ fname: String) {
    
    let fileManager = FileManager.default
    
    guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
        print("Failed to find documents directory")
        return
    }
    
    let lines = [b1, b2, b3, l1, l2, l3, b5, b6]
    
    let contents = lines.joined(separator: "\n")
    let fdirectory = documentsDirectory.appendingPathComponent(fname)
    
    do {
        try contents.write(
            to: fdirectory,
            atomically: true,
            encoding: .utf8
        )
        print("File written successfully to: ", fdirectory)

    } catch {
        print("Error: \(error)")
    }
}

func readSchedule(_ fname: String) -> [String] {
    do {
        let fileManager = FileManager.default
        
        guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            print("Failed to find documents directory")
            return [];
        }
        
        let fdirectory = documentsDirectory.appendingPathComponent(fname)
        
        let contents  = try String(contentsOf: fdirectory, encoding: .utf8)
        return contents.components(separatedBy: .newlines)
    } catch {
        print("Error: \(error)")
        return []
    }
}
