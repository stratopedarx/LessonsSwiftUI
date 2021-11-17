//
//  ContentView.swift
//  LessonsSwiftUI
//
//  Created by Sergey Lobanov on 15.11.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false

    var body: some View {
        Button {
            showingAlert = true
        } label: {
            Text("Show action sheet")
        }
        .actionSheet(isPresented: $showingAlert) {
            ActionSheet(title: Text("title"),
                        message: Text("message"),
                        buttons: [.default(Text("OK")),
                                  .cancel(),
                                  .destructive(Text("delete"))])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/*
 // 16.2 Action sheet
 
 struct ContentView: View {
     @State private var showingAlert = false

     var body: some View {
         Button {
             showingAlert = true
         } label: {
             Text("Show action sheet")
         }
         .actionSheet(isPresented: $showingAlert) {
             ActionSheet(title: Text("title"),
                         message: Text("message"),
                         buttons: [.default(Text("OK")),
                                   .cancel(),
                                   .destructive(Text("delete"))])
         }
     }
 }

 
 */


/*
 // 16.1 Alerts. Action sheet.
 
 struct ContentView: View {
     @State private var showingAlert1 = false
     @State private var showingAlert2 = false
     
     // https://www.hackingwithswift.com/quick-start/swiftui/how-to-show-an-alert
     var body: some View {
         HStack {
             Button {
                 showingAlert1 = true
             } label: {
                 Text("Show Alert 1")
             }
             .alert(isPresented: $showingAlert1) {
                 Alert(title: Text("title1"),
                       message: Text("message1"),
                       dismissButton: .cancel()
                 )
             }
             
             Button {
                 showingAlert2 = true
             } label: {
                 Text("Show Alert 2")
             }
             .alert(isPresented: $showingAlert2) {
                 Alert(title: Text("title2"),
                       message: Text("message2"),
                       dismissButton: .cancel()
                 )
             }
         }
     }
 }
 
 */


/*
 // 15 - Form. Это контейнер
 
 struct ContentView: View {
     @State private var colors = ["red", "green", "blue"]
     @State private var selectedColor = 0
     @State private var additionalSettings = false  // для toggle
     
     
     var body: some View {
         NavigationView {
             Form {
                 Section(header: Text("Colors")) {
                     Picker(selection: $selectedColor) {
                         ForEach(0..<colors.count) {
                             Text(colors[$0])
                         }
                     } label: {
                         Text("Select a color")
                     }
                 .pickerStyle(.segmented)
                 }
                 
                 Toggle(isOn: $additionalSettings) {
                     Text("Settings")
                 }
                 Button {
                     print("action")
                 } label: {
                     Text("Save changes")
                 }
                 .disabled(!additionalSettings)
             }
             .navigationTitle("Settings")
         }
     }
 }

 
 */


/*
 // 14.2 Group
 VStack может включать в себя только 10 вью.
 Group нужен только для группировки
 
 struct ContentView: View {
     
     
     var body: some View {
         VStack {
             Group {
                 Text("Hello")
                 Text("Hello")
                 Text("Hello")
                 Text("Hello")
                 Text("Hello")
                 Text("Hello")
                 Text("Hello")
                 Text("Hello")
                 Text("Hello")
                 Text("Hello")
             }
         }
     }
 }
 
 */


/*
 // 14.1 TabView
 
 struct ContentView: View {
     
     @State private var selectedView = 1
     
     var body: some View {
         TabView(selection: $selectedView) {
             Text("First view")
                 .tabItem {
                     Image(systemName: "1.circle")
                     Text("First")
                 }
                 .tag(1)
             
             Text("Second view")
                 .tabItem {
                     Image(systemName: "2.circle")
                     Text("Second")
                 }
                 .tag(2)
         }
     }
 }
 
 */



/*
 // 13.2 NavigationView работа со списком
 The .id(: \.self) part is required so that SwiftUI can identify each element in the array uniquely
 – it means that if you add or remove an item, SwiftUI knows exactly which one.
 https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-views-in-a-loop-using-foreach
 
 struct ContentView: View {
     
     @State private var users = ["A", "B", "C", "D"]
     
     var body: some View {
         NavigationView {
             List {
                 ForEach(users, id: \.self) { user in
                     Text(user)
                 }
                 .onDelete(perform: delete)
                 .onMove(perform: move)
             }
             
             .toolbar {
                 ToolbarItem(placement: .navigationBarTrailing) {
                     EditButton()
                 }
             }
         }
     }
     
     func delete(at offsets: IndexSet) {
         users.remove(atOffsets: offsets)
     }
     
     func move(from fromOffsets: IndexSet, to toOffset: Int) {
         users.move(fromOffsets: fromOffsets, toOffset: toOffset)
     }
     
 }
 
 
 */


/*
 // 13.1 NavigationView
 // это контейнер, в который помещаются другие вью.
 
 struct ContentView: View {
     
     var body: some View {
         NavigationView {
             Text("Swift")
                 .navigationTitle("Welcome")
                 .navigationBarTitleDisplayMode(.inline)
                 .toolbar {
                     ToolbarItem(placement: .navigationBarTrailing) {
                         HStack {
                             Button {
                                 print("help")
                             } label: {
                                 Text("Help")
                             }
                             
                             Button {
                                 print("about")
                             } label: {
                                 Text("About")
                             }
                         }
                     }
                 }
         }
     }
 }
 */

/*
 
 // 12.2 List. Как делать секции. Section
 
 struct ContentView: View {
     
     var body: some View {
         List {
             Section {
                 TaskRow()
                 TaskRow()
                 TaskRow()
             } header: {
                 Text("Important tasks")
             }
             
             Section {
                 TaskRow()
                 TaskRow()
             } header: {
                 Text("Done tasks")
             }
             .listRowBackground(Color.yellow)
         }
         .listStyle(GroupedListStyle())
     }
 }
 */


/*
 // 12.1 List. Можно отобразить статические или динамические ячейки табличного представления
 
 struct MusicRow: View {
     var name: String
     
     var body: some View {
         Text("music: \(name)")
     }
 }

 // свифт должен уметь определять какая структура перед ним.
 // подписываем под протокол Identifiable
 // что бы назначить уникальный идентификатор: var if = UUID()
 struct Restaurant: Identifiable {
     var id = UUID()
     var name: String
 }

 // определим структуру каждой строчки в нашем списке
 struct RestaurantRow: View {
     var restaurant: Restaurant
     var body: some View {
         Text("Come and eat at \(restaurant.name)")
     }
 }


 struct ContentView: View {
     
     var body: some View {
         // 1. static cells
         /*
         List {
             MusicRow(name: "Rock")
             MusicRow(name: "Rap")
             MusicRow(name: "Classic")
         }
          */
         
         // 2. dynamic
         let first = Restaurant(name: "first")
         let second = Restaurant(name: "second")
         let third = Restaurant(name: "third")
         
         var restaurants = [first, second, third]
         
         return List(restaurants) { restaurant in
             RestaurantRow(restaurant: restaurant)
         }
     }
 }
 
 
*/



/*
 // 11. Нажатия и жесты.
 
 struct ContentView: View {
     @State private var age = 18
     
     var body: some View {
         VStack {
             VStack {
                 Text("Tap me")
                     .onTapGesture { print("tapped") }
                 
                 Image("think")
                     .resizable()
                     .aspectRatio(contentMode: .fit)
                     .frame(width: 100, height: 100)
                     .onTapGesture(count: 2) {
                         print("Double tapped")
                     }
                 
                 Spacer()
                 Text("Apple")
             }
             .background(Color.gray)
             .contentShape(Rectangle())  // для того, что бы в любом месте можно было нажать
             .onTapGesture {
                 print("hello")
             }
         }
         Spacer()
         
         Image("think")
             .resizable()
             .frame(width: 100, height: 100)
             .gesture(
                 LongPressGesture(minimumDuration: 2)
                     .onEnded{ _ in
                         print("long press")
                     }
             )
             .gesture(
                 DragGesture(minimumDistance: 50)
                     .onEnded { _ in
                         print("drag")
                     }
             )
     }
 }
 
 */


/*
 // 10. Stepper
 
 struct ContentView: View {
     @State private var age = 18
     
     var body: some View {
         VStack {
 //            Stepper("Enter you age", value: $age, in: 0...130)
             Stepper("Enter you age") {
                 age += 2
             } onDecrement: {
                 age -= 2
             }
             Text("Your age is \(age)")
         }
         .padding()
     }
 }
 
 */


/*
 // 9. Picker
 
 struct ContentView: View {
     
     // Property wrapper
     var color = ["black", "white", "red", "green"]
     @State private var selectedColor = 0
     
     var body: some View {
         VStack {
             Picker(selection: $selectedColor) {
                 ForEach(0..<color.count) {
                     Text(color[$0])
                 }
             } label: {
                 Text("Choose")
             }
             .pickerStyle(.inline)
             
             Text("You selected: \(color[selectedColor])")
         }
     }
 }
 
 */


/*
 // 8. Slider
 struct ContentView: View {
     
     // Property wrapper
     @State private var celsious: Double = 0
     
     var body: some View {
         VStack {
             Slider(value: $celsious, in: -100...100, step: 0.1)
             Text("\(celsious) celsius is \(celsious * 9 / 5 + 32) Fahrenheit")
         }
     }
 }
 */


/*
 // 7. TextField SecureField
 struct ContentView: View {
     
     // Property wrapper
     @State private var name = ""
     @State private var password = ""
     
     var body: some View {
         VStack {
             TextField("Enter your name: ", text: $name)
                 .textFieldStyle(.roundedBorder)
             Text("Hello \(name)")
             
             SecureField("Enter your password: ", text: $password)
                 .textFieldStyle(.roundedBorder)
             Text("password is \(password)")
         }
     }
 }
 */


/*
 // 6. buttons
 struct ContentView: View {
     
     // Property wrapper
     @State private var showDetail = false
     
     var body: some View {
         VStack {
             Button {
                 showDetail.toggle()
             } label: {
                 Text("Show details")
             }
             .padding()
             .background(Color.green)
             .clipShape(RoundedRectangle(cornerRadius: 30))
     
             if showDetail {
                 Text("Hello from button")
                     .font(.largeTitle)
             }
         }
     }
 }
 */


/*
 // 5. State + Toggle
 struct ContentView: View {
     
     // Property wrapper
     @State private var toggle = false
     
     var body: some View {
         VStack {
             Toggle(isOn: $toggle) {
                 Text("Show hello")
             }
             .padding()
             
             if toggle {
                 Text("SHOW")
                     .font(.largeTitle)
                     .padding()
                     .background(AngularGradient(
                         gradient: Gradient(
                             colors: [.red, .green, .blue]),
                         center: .center))
                     .clipShape(Circle())
             }
         }
     }
 }
 */


/*
 // 4. Gradients
 struct ContentView: View {
     var body: some View {
         VStack {
             // LinearGradient
             Text("Hello")
                 .font(.largeTitle)
                 .padding()
                 .foregroundColor(.white)
                 .background(LinearGradient(
                     colors: [.black, .red, .white],
                     startPoint: .trailing,
                     endPoint: .leading))
             Spacer()
             
             // RadialGradient
             // AngularGradient
             let colors = Gradient(colors: [.red, .yellow, .gray, .green])
 //            let gradient = RadialGradient(
 //                gradient: colors,
 //                center: .center,
 //                startRadius: 20,
 //                endRadius: 200)
             let gradient = AngularGradient(gradient: colors, center: .center)
             
             Circle()
 //                .fill(gradient)
                 .strokeBorder(gradient, lineWidth: 30)

         }
     }
 }

 */


/*
 // 3. Images
 struct ContentView: View {
     var body: some View {
         
 //        Image("think")
 //            .resizable()
 //            .aspectRatio(contentMode: .fit)
         VStack {
             Text("Hello")
                 .foregroundColor(.white)
                 .background(
                     Image("think")
                         .resizable()
                         .frame(width: 100, height: 100)
                 )
             Spacer()
                 .frame(height: 200)

             Text("Bachground is Circle")
                 .background(
                     Circle()
                         .fill(Color.blue)
                         .frame(width: 200, height: 200)
                 )
             
             Spacer()
                 .frame(height: 200)

             Image(systemName: "cloud.sun.fill")
                 .font(.largeTitle)
                 .padding(30)
                 .background(Color.red)
                 .foregroundColor(.white)
             .clipShape(RoundedRectangle(cornerRadius: 10))
         }
 //        Capsule()
 //        Circle()
     }
 }
 */


/*
 // 2. Text
 struct ContentView: View {
     var body: some View {
         Text("Where did you go? Did you kidding? I am not sure about you")
 //            .kerning(5) // добавляет дополнительный пробел в конце.
             .tracking(5)  // не добавляет дополнительный пробел в конце
             .lineLimit(nil)
             .truncationMode(.head)
             .font(.largeTitle)
             .multilineTextAlignment(.center)
             .background(Color.red)
             .foregroundColor(.white)
             .lineSpacing(20)
     }
 }
 */


/*
 // 1. stacks
 // всё View. Одно вычисляемое свойство body должно быть. Оно возвращает View.
 struct ContentView: View {
     var body: some View {
         VStack(alignment: .center, spacing: 10) {
             Text("Hello, world!")
             Text("Hello, world2!")
             Text("Hello, world3!")
             
             Spacer()
                 .frame(height: 100)
             
             HStack {
                 Text("HStask")
                 Divider()
                 Text("HStask")
             }
             
             Spacer()
                 .frame(height: 100)
             
             ZStack {
                 Image("think")
                     .resizable()
                     .frame(width: 300, height: 300, alignment: .center)
                 Text("think \nabout it!")
                     .foregroundColor(.white)
                     .font(.title)
             }
         }
     }
 }
 */
