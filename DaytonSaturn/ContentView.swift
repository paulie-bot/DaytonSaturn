//
//  ContentView.swift
//  DaytonSaturn
//
//  Created by Paul Casiero on 10/25/26.
//

import SwiftUI

struct ContentView: View {
    @State private var b1 = ""
    @State private var b2 = ""
    @State private var b3 = ""
    @State private var l1 = ""
    @State private var l2 = ""
    @State private var l3 = ""
    @State private var b5 = ""
    @State private var b6 = ""
    
    @State private var selectedOption = "A"
    
    let options = ["A", "B", "C", "D"]
    @State private var schedule = ["", "", "", "", "", "", "", ""]
    var body: some View {
        ZStack {
            Text("DaytonSaturn Prototype")
                .position(x:180, y:20)
                .font(.largeTitle)
                .onAppear {
                    requestPermission()
                }
            
            Button("Write Schedule") {
                if selectedOption == "A" {
                    writeSchedule(b1, b2, b3, l1, l2, l3, b5, b6, "ADay.txt");
                }
                else if selectedOption == "B" {
                    writeSchedule(b1, b2, b3, l1, l2, l3, b5, b6, "BDay.txt");
                }
                else if selectedOption == "C" {
                    writeSchedule(b1, b2, b3, l1, l2, l3, b5, b6, "CDay.txt");
                }
                else if selectedOption == "D" {
                    writeSchedule(b1, b2, b3, l1, l2, l3, b5, b6, "DDay.txt");
                }
                
            }
            .background(Color.white)
            .position(x: 80, y: 300)
            
            
            Button("Read Schedule") {
                if selectedOption == "A" {
                     schedule = readSchedule("ADay.txt")
                     print(readSchedule("ADay.txt"));
                }
                else if selectedOption == "B" {
                    schedule = readSchedule("BDay.txt")
                    print(readSchedule("BDay.txt"));
                }
                else if selectedOption == "C" {
                    schedule = readSchedule("CDay.txt")
                    print(readSchedule("CDay.txt"));
                }
                else if selectedOption == "D" {
                    schedule = readSchedule("DDay.txt")
                    print(readSchedule("DDay.txt"));
                }
            }
            .background(Color.white)
            
            Button("Send Notification") {
                sendNotification("Test", "Test")
            }
            .background(Color.white)
            .position(x: 100, y: 600)
            
            TextField("Block 1: ", text: $b1)
                .background(Color.white)
                .frame(width: 150)
                .position(x:80, y:70)
                
            TextField("Block 2: ", text: $b2)
                .background(Color.white)
                .frame(width: 150)
                .position(x: 80, y: 95)
            
            TextField("Block 3: ", text: $b3)
                .background(Color.white)
                .frame(width: 150)
                .position(x: 80, y: 120)
            
            TextField("Lunch 1/Class: ", text: $l1)
                .background(Color.white)
                .frame(width: 150)
                .position(x: 80, y: 145)
            
            TextField("Lunch 2/Class: ", text: $l2)
                .background(Color.white)
                .frame(width: 150)
                .position(x: 80, y: 170)
            
            TextField("Lunch 3/Class: ", text: $l3)
                .background(Color.white)
                .frame(width: 150)
                .position(x: 80, y: 195)
            
            TextField("Block 5: ", text: $b5)
                .background(Color.white)
                .frame(width: 150)
                .position(x: 80, y: 220)
            
            TextField("Block 6: ", text: $b6)
                .background(Color.white)
                .frame(width: 150)
                .position(x: 80, y: 245)
            
            Picker("Pick a Day", selection: $selectedOption) {
                ForEach(options, id: \.self) { option in
                    Text(option)
                }
            }
            .pickerStyle(.menu)
            .tint(.black)
            .position(x:80, y: 270)
            
            Text("Block 1: \(schedule[0])")
                .position(x: 1000, y: 70)
            
            Text("Block 2: \(schedule[1])")
                .position(x: 1000, y: 100)
            
            Text("Block 3: \(schedule[2])")
                .position(x: 1000, y: 130)
            
            Text("Lunch 1/Class: \(schedule[3])")
                .position(x: 1000, y: 160)
            
            Text("Lunch 2/Class: \(schedule[4])")
                .position(x: 1000, y: 190)
            
            Text("Lunch 3/Class: \(schedule[5])")
                .position(x: 1000, y: 220)
            
            Text("Block 5: \(schedule[6])")
                .position(x: 1000, y: 250)
            
            Text("Block 6: \(schedule[7])")
                .position(x: 1000, y: 280)
        }
        .background(Color.cyan)
        .offset(y: 0)
    }
}

#Preview {
    ContentView()
}
