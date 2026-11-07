//
//  corefuncs.swift
//  DaytonSaturn
//
//  Created by Paul Casiero on 10/28/26.
//


import Foundation
import UserNotifications

//writes a schedule to a file
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

//reads a schedule from a file and returns it as a list
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

//requests permission from user for notifications
func requestPermission() {
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
        if granted {
            print("Permission granted")
        } else if let error = error {
            print("Error: \(error.localizedDescription)")
        }
    }
}

// sends out a notification
func sendNotification(_ title: String, _ body: String) {
    let content = UNMutableNotificationContent()
    content.title = title
    content.body = body
    content.sound = UNNotificationSound.default
    
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

    let id = UUID().uuidString
    let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)

    UNUserNotificationCenter.current().add(request) { error in
        if let error = error {
            print("Failed to schedule notification: \(error.localizedDescription)")
        } else {
            print("Notification scheduled successfully!")
        }
    }
    
}

// checks if user has granted notification permissions
func checkNotificationPermission() async -> UNAuthorizationStatus {
    let settings = await UNUserNotificationCenter.current().notificationSettings()
    return settings.authorizationStatus
}

func setCalendarNotification(_ day: Int, _ month: Int, _ year: Int, _ hour: Int, _ minute: Int, _ title: String, _ body: String) {
    var dateComponents = DateComponents()
    dateComponents.year = year
    dateComponents.month = month
    dateComponents.day = day
    dateComponents.hour = hour
    dateComponents.minute = minute

    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
    
    let content = UNMutableNotificationContent()
    content.title = title
    content.body = body
    content.sound = .default
    
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
    UNUserNotificationCenter.current().add(request)
    
}
