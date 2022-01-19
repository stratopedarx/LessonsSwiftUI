//
//  Lesson24-RegistrationPage.swift
//  LessonsSwiftUI
//
//  Created by Sergey Lobanov on 18.01.2022.
//

import SwiftUI

struct Lesson24_RegistrationPage: View {
    @State var index = 0

    var body: some View {
        GeometryReader { _ in
            VStack {
                Image("nike")
                    .resizable()
                    .frame(width: 70, height: 70)

                ZStack {
//                    SignUp(index: self.$index)
//                        .zIndex(Double(self.index))  // для того что бы менять порядок вью
                    Login(index: self.$index)
                }

                HStack(spacing: 15) {
                    Rectangle()
                        .fill(Color("Color1"))
                        .frame(height: 1)

                    Text("OR")

                    Rectangle()
                        .fill(Color("Color1"))
                        .frame(height: 1)
                }
                .padding(.horizontal, 30)
                .padding(.top, 50)

                HStack(spacing: 25) {
                    Button {
                    } label: {
                        Image("apple").bottomImageModifier()
                    }

                    Button {
                    } label: {
                        Image("fb").bottomImageModifier()

                    }

                    Button {
                    } label: {
                        Image("twitter").bottomImageModifier()

                    }
                }
                .padding(.top, 30)
            }
            .padding(.vertical)
        }
        .background(Color("Color")
                        .edgesIgnoringSafeArea(.all))
        .preferredColorScheme(.dark)
    }
}

struct CShapeLeft: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: rect.width, y: 100))  // задаем начальную точку. rect.width - ширина прямоугольник
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))  // добавляем линию. rect.height - вся высота
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
        }
    }
}

struct CShapeRight: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 100))  // задаем начальную точку. rect.width - ширина прямоугольник
            path.addLine(to: CGPoint(x: 0, y: rect.height))  // добавляем линию. rect.height - вся высота
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
        }
    }
}

struct Login: View {
    @State var email: String = ""
    @State var password: String = ""
    @Binding var index: Int

    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                HStack {
                    VStack(spacing: 10) {
                        Text("Login")
                            .foregroundColor(self.index == 0  ? .white : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                        Capsule()
                            .fill(self.index == 0 ? Color.blue : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                    Spacer()
                }
                .padding(.top, 30)

                // email
                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "envelop.fill")
                            .foregroundColor(Color("Color1"))
                        TextField("Email Address", text: self.$email)
                    }

                    Divider()
                        .background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)

                // password
                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("Color1"))
                        SecureField("Password", text: self.$password)
                    }

                    Divider()
                        .background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)

                HStack {
                    Spacer(minLength: 0)
                    Button {
                    } label: {
                        Text("Forget Password?")
                            .foregroundColor(Color.white.opacity(0.6))
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
            }
            .padding()
            .padding(.bottom, 65)
            .background(Color("Color2"))
            .clipShape(CShapeLeft())
            .contentShape(CShapeLeft())
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                self.index = 0
            }
            .cornerRadius(35)
            .padding(.horizontal, 20)

            Button {
            } label: {
                Text("LOGIN")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color("Color1"))
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
            }
            .offset(y: 25)  // смещение кнопки
//            opacity(self.index == 0 ? 1 : 0)
        }
    }
}

struct SignUp: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var rePassword: String = ""
    @Binding var index: Int

    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                HStack {
                    Spacer(minLength: 0)
                    VStack(spacing: 10) {
                        Text("SignUp")
                            .foregroundColor(self.index == 1 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.bold)

                        Capsule()
                            .fill(self.index == 1 ? Color.blue: Color.clear)
                            .frame(width: 100, height: 5)

                    }
                }
                .padding(.top, 30)

                // email
                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "envelop.fill")
                            .foregroundColor(Color("Color1"))
                        TextField("Email Address", text: self.$email)
                    }

                    Divider()
                        .background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)

                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("Color1"))
                        SecureField("Password", text: self.$password)
                    }
                    Divider()
                        .background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)

                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("Color1"))
                        SecureField("Password", text: self.$rePassword)
                    }
                    Divider()
                        .background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
            }
            .padding()
            .padding(.bottom, 65)
            .background(Color("Color2"))
            .clipShape(CShapeRight())
            .contentShape(CShapeRight())
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                self.index = 1
            }
            .cornerRadius(35)

            Button {

            } label: {
                Text("SIGNUP")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color("Color1"))
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: -5)
            }
            .offset(y: 25)
            .opacity(self.index == 1 ? 1 : 0)
        }
    }
}


extension Image {
    func bottomImageModifier() -> some View {
        self
            .resizable()
            .renderingMode(.original)  // что бы не воспринимал как кнопку и не окрашивал в синий цвет
            .frame(width: 50, height: 50)
            .clipShape(Circle())
    }
}
