//
//  Lesson23-CustomTabBar.swift
//  LessonsSwiftUI
//
//  Created by Sergey Lobanov on 29.12.2021.
//

import SwiftUI

// https://youtu.be/pqOGcvGrpWI
struct Lesson23_CustomTabBar: View {

    @State private var selected = 0

    var body: some View {
        VStack {
            Spacer()

            ZStack {
                HStack {
                    Button {
                        // кнопка подсвечивается при нажатии
                        selected = 0
                    } label: {
                        Image(systemName: "house")
                    }
                    .foregroundColor(selected == 0 ? .black : .gray)

                    Spacer(minLength: 12)

                    Button {
                        selected = 1
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
                    .foregroundColor(selected == 1 ? .black : .gray)

                    Spacer().frame(width: 120)

                    Button {
                        selected = 2
                    } label: {
                        Image(systemName: "person")
                    }
                    .foregroundColor(selected == 2 ? .black : .gray)

                    Spacer(minLength: 12)

                    Button {
                        selected = 3
                    } label: {
                        Image(systemName: "contextualmenu.and.cursorarrow")
                    }
                    .foregroundColor(selected == 3 ? .black : .gray)
                }
                .padding()
                .padding(.horizontal, 22)
                .background(CurvedShape())

                Button {
                } label: {
                    Image(systemName: "heart")
                        .renderingMode(.original)  // что бы SwiftUI воспринимал нашу исходную картинку, а не делал из нее кнпоку (не будет окрашивать в синий цвет)
                        .padding()

                }
                .background(Color.yellow)
                .clipShape(Circle())
                .offset(y: -32)
                .shadow(radius: 5)
            }
        }
        .background(Color.orange.edgesIgnoringSafeArea(.all))
    }
}

struct CurvedShape: View {
    var body: some View {
        Path { path in
            // делаем приямогульник
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 0))  // горизонтальная линия
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 55))
            path.addArc(center: CGPoint(x: UIScreen.main.bounds.width / 2, y: 55),
                        radius: 30,
                        startAngle: .zero,
                        endAngle: .init(degrees: 180),
                        clockwise: true)
            path.addLine(to: CGPoint(x: 0, y: 55))
        }
        .fill(Color.white)
        .rotationEffect(.degrees(180))
    }
}

struct Lesson23_CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        Lesson23_CustomTabBar()
    }
}
