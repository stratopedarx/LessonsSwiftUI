//
//  Lesson19.swift
//  LessonsSwiftUI
//
//  Created by Sergey Lobanov on 20.11.2021.
//

import SwiftUI

struct DetailView: View {

    // что бы добавить кнопку back
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Text("Detail View")
        Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            Text("Back")
        }

    }
}

struct Lesson19: View {
    @State private var showingDetail = false
    
    var body: some View {
        Button {
            self.showingDetail.toggle()
        } label: {
            Text("Show detail")
        }.sheet(isPresented: $showingDetail) {
            DetailView()
        }


    }
}

struct Lesson19_Previews: PreviewProvider {
    static var previews: some View {
        Lesson19()
    }
}





/*
 // 19.2 Работа с динамическим списком
 
 
 // Для работы со списоком нам нужно сказать как swift должен идентифицировать каждый ряд в этом списке
 // Identifiable and id

 struct Dog: Identifiable {
     var id = UUID()
     var name: String
 }

 // теперь определяем структуру одного ряда списке
 struct DogRow: View {
     var dog: Dog
     
     var body: some View {
         Text(dog.name)
     }
 }


 struct DogView: View {
     var dog: Dog
     
     var body: some View {
         Text("Choosed: \(dog.name)")
     }
 }

 // определяем главную структуру
 struct Lesson19: View {
     var body: some View {
         let first = Dog(name: "Dog1")
         let second = Dog(name: "Dog2")
         let dogs = [first, second]
         
         return NavigationView {
             List(dogs) { dog in
                 NavigationLink {
                     DogView(dog: dog)
                 } label: {
                     DogRow(dog: dog)
                 }
             }.navigationTitle("Choose a dog")
         }

     }
 }
 
 
 */


/*
 
 // 19.1 NavigationLink, Sheet
 // Используется внутри NavigationView
 
 struct DetailView: View {
     var body: some View {
         Text("Detail view")
     }
 }

 struct Lesson19: View {
     var body: some View {
         NavigationView {
             VStack {
                 NavigationLink {
                     DetailView()
                 } label: {
                     Text("Show detail view")
                 }.navigationTitle("Navigation")
             }
         }
     }
 }
 
 
 */
