//
//  Lesson22-Animation.swift
//  LessonsSwiftUI
//
//  Created by Sergey Lobanov on 29.12.2021.
//

import SwiftUI

// https://youtu.be/uzDKfK00cwc
struct Lesson22_Animation: View {

    // CGFloat - Core graphics применяется для графики
    @State private var scale: CGFloat = 1

    @State private var angel: Double = 0
    @State private var borderTickness: CGFloat = 1

    @State private var angel2: Double = 0

    var body: some View {
        Section {
            // масштабирование
            Button {
                self.scale += 1
            } label: {
                Text("Scale animation")
                    .scaleEffect(scale)
                    .animation(.easeInOut(duration: 2))
            }


            // поворот
            Button {
                self.angel += 45
                self.borderTickness += 1
            } label: {
                Text("Angel and border animation")
                    .padding()
                    .border(Color.red, width: borderTickness)
                    .rotationEffect(.degrees(angel))
                    .animation(.easeIn)
            }

            // пружина
            Button {
                self.angel2 += 45
            } label: {
                Text("Пружина")
                    .padding()
                    .rotationEffect(.degrees(angel2))
//                    .animation(.spring())
                    .animation(.interpolatingSpring(mass: 1, stiffness: 1,
                                                    damping: 3, initialVelocity: 20))
            }

        }
    }
}


// 1) неявная анимация. добавляем анимацию к байндинг свойству. Это implicit animations
// 2) явная анимация. Это когда не прикрепляем модификацтю к вью,
// а просим анимировать конкретное изменение. withAnimation
struct Lesson22_1: View {
    @State private var showingWelcome = false
    @State private var opacity = 1.0
    @State private var rotation = 0.0
    @State private var scale: CGFloat = 1.0

    var body: some View {
        VStack {
            Toggle(isOn: $showingWelcome.animation(.easeIn(duration: 2))) {
                Text("Toggle")
            }

            if showingWelcome {
                Text("Hello")
            }

            // withAnimation
            Button {
                withAnimation(.linear(duration: 3)) {
                    self.opacity -= 0.4
                }
            } label: {
                Text("Opacity")
                    .padding()
                    .opacity(opacity)
            }

            // анимация делается с задержкой
            Rectangle()
                .fill(Color.green)
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(rotation))
                .animation(Animation.easeInOut(duration: 3).delay(2))
                .onTapGesture {
                    self.rotation += 360
                }

            Spacer()
            // анимация делается при появлении onAppear
            Rectangle()
                .fill(Color.yellow)
                .frame(width: 100, height: 100)
                .scaleEffect(scale)
                .onAppear {
                    let baseAnimation = Animation.easeIn(duration: 2)
                    let repeated = baseAnimation.repeatForever(autoreverses: true)
                    return withAnimation(repeated) {
                        self.scale += 0.5
                    }
                }
        }
    }
}

struct Lesson22_Animation_Previews: PreviewProvider {
    static var previews: some View {
        Lesson22_1()
    }
}
