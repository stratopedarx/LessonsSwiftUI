//
//  Liesson18View.swift
//  LessonsSwiftUI
//
//  Created by Sergey Lobanov on 19.11.2021.
//

import SwiftUI


// @State - работать с данными в пределах одного вью

class User: ObservableObject {
    @Published var firstName = "Ivan"
    @Published var lastName = "Petrov"
}

struct Lesson18View: View {
    
    @ObservedObject var user = User()
    @ObservedObject var userSettings = UserSettings()
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
            Spacer()
            Text("Score \(userSettings.score)")
            
            Button {
                userSettings.score += 1
            } label: {
                Text("Encrease")
            }

        }
    }
}

struct Liesson18View_Previews: PreviewProvider {
    static var previews: some View {
        Lesson18View()
    }
}

/*
 // 18.1 @ObservedObject / @Published / @EnvironmentObject
 
 // Если мы будем использовать структуру, то как мы помним, структуры копируются value type.
 // Соответственно на другом экране изменение не будет подхватываться, потому что там копия
 // Поэтому что бы изменения на одном экране затрагивали изменения на другом, необходимо использовать классы.
 struct User {
     var firstName = "Ivan"
     var lastName = "Petrov"
 }

 struct Lesson18View: View {
     
     @State private var user = User()
     
     var body: some View {
         VStack {
             Text("Your name is \(user.firstName) \(user.lastName)")
             TextField("First name", text: $user.firstName)
             TextField("Last name", text: $user.lastName)
         }
     }
 }
 
 
 */
