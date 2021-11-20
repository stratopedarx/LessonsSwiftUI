//
//  Lesson20View.swift
//  LessonsSwiftUI
//
//  Created by Sergey Lobanov on 20.11.2021.
//

import SwiftUI

// Codable - архивировать и разархивировать данные
struct User20: Codable {
    var firstName: String
    var lastName: String
}

// JSON encoder - его задача взять данные, которые подписаны под протокол Codable
// и отправить их назад в формате JSON


struct Lesson20View: View {
    @State private var user = User20(firstName: "Sergey", lastName: "Lobanov")
    
    var body: some View {
        Button {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "userData")
            }
            
        } label: {
            Text("Save")
        }
        Spacer()
        
        Button {
            let decoder = JSONDecoder()
            let data = UserDefaults.standard.object(forKey: "userData") as! Data
            if let userData = try? decoder.decode(User20.self, from: data) {
                print(userData)
            }
        } label: {
            Text("Get")
        }


    }
}

struct Lesson20View_Previews: PreviewProvider {
    static var previews: some View {
        Lesson20View()
    }
}

/*
 // работа со структурами
 
 
 
 
 */


/*
 // храним небольшие настройки
 
 struct Lesson20View: View {
     @State private var tapCount = UserDefaults.standard.integer(forKey: "tap")
     
     var body: some View {
         Button {
             tapCount += 1
             UserDefaults.standard.set(tapCount, forKey: "tap")
         } label: {
             Text("Tap count: \(tapCount)")
         }

     }
 }
 
 */
