//
//  UserSettings.swift
//  LessonsSwiftUI
//
//  Created by Sergey Lobanov on 20.11.2021.
//

import SwiftUI

class UserSettings: ObservableObject {
    @Published var score = 0
}

struct UserSettings_Previews: PreviewProvider {
    static var previews: some View {
        Lesson18View()
    }
}
