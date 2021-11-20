//
//  PracticeContentView.swift
//  LessonsSwiftUI
//
//  Created by Sergey Lobanov on 20.11.2021.
//

import SwiftUI

// одна затрана
struct ExpenseItem: Identifiable, Codable {
    let id = UUID()
    let name: String  // имя может повторяться, поэтому надо уникальный идентификатор
    let type: String
    let amount: Int
}

// класс в котором хранится массив затрат
class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "items")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ExpenseItem].self, from: items) {
                self.items = decoded
                return
            }
        }
    }
}

struct PracticeContentView: View {
    
    @State private var showingAddExpense = false
    @ObservedObject var expenses = Expenses()

    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                            Text(item.type)
                        }
                        Spacer()
                        Text("\(item.amount)")
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Мои расходы")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.showingAddExpense = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $showingAddExpense) {
                        AddView(expenses: expenses)
                    }
                }
            }
        }
    }
    
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct PracticeContentView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeContentView()
    }
}
