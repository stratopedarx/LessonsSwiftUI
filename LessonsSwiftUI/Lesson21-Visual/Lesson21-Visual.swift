//
//  Lesson21-Visual.swift
//  LessonsSwiftUI
//
//  Created by Sergey Lobanov on 29.12.2021.
//

import SwiftUI

/*
 https://youtu.be/EO5krcpOnNo
 View имеют естественную позицию внутри стака. Что бы сдвинуть можно использовать offset.
 отсчет осей x y идет в верхнего левого угла. вправо Х положительный, вниз У положительный.
 порядок модификаторов имеет значение
 .padding()  // по умолчанию идет отступ от всех сторон
 Чтобы сделать границу вокруг View используем модификатор border
 если хотим скруглить края, то используем .overlay
 если хотим обозначить границы у фигуры, то используем stroke или strokeBorder
 */

struct Lesson21_Visual: View {

    @State private var rotation = 0.0
    var body: some View {
/*
        VStack {
            Text("First")
            Text("Second")
                .offset(y: 15)
                .padding(.bottom, 20)
            Text("Third")
        }
 */

        Section {
            Group {
                ZStack(alignment: .bottomTrailing) {
                    Image("think")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Text("Think about it")
                        .padding(4)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .offset(x: -50, y: -50)
                }

                Text("Hello")
                    .font(.largeTitle)
                    .padding()  // по умолчанию идет отступ от всех сторон
                    .background(Color.orange)
                    .padding()
                    .background(Color.green)
                    .padding()
                    .background(Color.blue)
                Spacer()

                Text("Hello")
                    .padding()
    //                .border(Color.red, width: 10)

                // если хотим скруглить углы
                    .overlay(RoundedRectangle(cornerRadius: 15) // если хотим скруглить углы
                                .stroke(Color.green, lineWidth: 10)
                    )
                Spacer()

                // если хотим обозначить границы у фигуры, то используем stroke или strokeBorder
                // stroke - чертит границу так, что половина границ находится внутри Вью, а вторая вне.
                // strokeBorder - границы вписываются полностью
                Circle()
                    .stroke(Color.red, lineWidth: 10)
                Circle()
                    .strokeBorder(Color.red, lineWidth: 10)

                Circle()
                    .strokeBorder(Color.red, style: StrokeStyle(lineWidth: 50,dash: [15, 15]))
                    .frame(width: 200, height: 200)

                // как добавить тень
                Text("Hello")
                    .padding()
                    .shadow(color: .red, radius: 5, x: 10, y: 10)
                    .border(Color.red, width: 5)
                    .shadow(color: .red, radius: 5, x: 10, y: 10)

                // если хотим обрезать вью
                Button {
                    print("tapped")
                } label: {
                    Image(systemName: "cloud.fill")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.orange)
                        .clipShape(Capsule())
                }
            }

            Group {
                //  как вращать вью
                Text("Hello swift")
                    .rotationEffect(.degrees(90))
                    .rotationEffect(.radians(.pi/1))

                // сделаем слайдер
//                VStack {
//                    Slider(value: $rotation, in: 0...360, step: 1.0)
//                    Text("Slider Text")
//                        .rotationEffect(.degrees(rotation), anchor: .topLeading)
//                }

                // вращение в 3d
//                Text("Hello, World")
//                    .font(.largeTitle)
//                    .rotation3DEffect(.degrees(45), axis: (x: 1, y: 0, z: 0))

                // как масштабировать
//                Text("scaleEffect")
//                    .scaleEffect(3)
//                    .scaleEffect(x: 1, y: 5, anchor: .bottomTrailing)

                // как округлять углы
//                Text("cornerRadius")
//                    .padding()
//                    .background(Color.green)
//                    .cornerRadius(20)
//                    .opacity(0.8)  // прозрачность от 0 до 1
//                    .blur(radius: 20)  // размытость

                // как менять оттенок и насыщенность, контрастность
                Image("think")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .colorMultiply(.red)  // меняем оттенок
                    .saturation(0.5)  // насыщенность
                    .contrast(0.5)  // констраст
            }
        }
    }
}

struct Lesson21_Visual_Previews: PreviewProvider {
    static var previews: some View {
        Lesson21_Visual()
    }
}
