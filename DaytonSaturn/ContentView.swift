//
//  ContentView.swift
//  DaytonSaturn
//
//  Created by Paul Casiero on 10/25/26.
//

import SwiftUI

struct ContentView: View {
    @State private var b1 = ""
    
    var body: some View {
        HStack {
            Text("DaytonSaturn")
            
            Button("test") {
                writeSchedule("English 3", "Algebra 2", "Chemistry", "Lunch 1", "Spanish 2", "Spanish 2", "Health Education 3", "AP Computer Science Principles", "CDay.txt");
            }
            
            Button("test2") {
                print(readSchedule("CDay.txt"));
            }
            
            VStack {
                TextField("Block 1: ", text: $b1)
            }
            .padding()
        }
        
    }
}

#Preview {
    ContentView()
}
