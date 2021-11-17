//
//  TipsApp.swift
//  LessonsSwiftUI
//
//  Created by Sergey Lobanov on 16.11.2021.
//

import SwiftUI

struct TipsApp: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 0

    let tipPercentages = [0, 5, 10, 15, 20]

    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }

    var body: some View {
        NavigationView {
            Form {
    
                Section {
                    TextField("Amount", text: $checkAmount)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }

                Section(header: Text("Сколько чаевых вы хотите оставить?")) {
                    Picker("Tip persentage", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Text("\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("Калькулятор чаевых",
                                displayMode: .inline)
        }
    }
}

struct TipsApp_Previews: PreviewProvider {
    static var previews: some View {
        TipsApp()
    }
}
