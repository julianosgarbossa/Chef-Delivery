//
//  HomeView.swift
//  ChefDelivery
//
//  Created by Juliano Sgarbossa on 09/07/25.
//

import SwiftUI

struct LoginView: View {
    
    @State private var isAnimated: Bool = false
    @State private var imageOffset: CGSize = .zero
    @State private var buttonOffSet: CGFloat = 0
    @Binding var didPassIntro: Bool
    let buttonHeight: CGFloat = 80
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .foregroundStyle(Color("ColorRed"))
                    .frame(width: isAnimated ? 200 : 0)
                    .position(CGPoint(x: isAnimated ? 50 : -50, y: isAnimated ? 100 : -100))
                    .blur(radius: 60)
                    .opacity(isAnimated ? 0.5 : 0)
                
                Circle()
                    .foregroundStyle(Color("ColorRedDark"))
                    .frame(width: isAnimated ? 200 : 0)
                    .position(CGPoint(x: isAnimated ? geometry.size.width - 50 : geometry.size.width + 50, y: isAnimated ? geometry.size.height - 50 : geometry.size.height + 50))
                    .blur(radius: 60)
                    .opacity(isAnimated ? 0.5: 0)
                
                VStack {
                    Text("Chef Delivery")
                        .font(.system(size: 48))
                        .fontWeight(.heavy)
                        .foregroundStyle(Color("ColorRed"))
                        .opacity(isAnimated ? 1 : 0)
                        .offset(y: isAnimated ? 0 : -40)
                    
                    Text("Peça as suas comidas no conforto da sua casa.")
                        .font(.title2)
                        .padding()
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.black.opacity(0.7))
                        .opacity(isAnimated ? 1: 0)
                        .offset(y: isAnimated ? 0 : -40)
                    
                    
                    Image("homeImage")
                        .resizable()
                        .scaledToFit()
                        .shadow(radius: 60)
                        .padding(isAnimated ? 32 : 92)
                        .opacity(isAnimated ? 1 : 0)
                        .offset(imageOffset)
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        imageOffset = gesture.translation
                                    }
                                })
                                .onEnded({ _ in
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        imageOffset = .zero
                                    }
                                })
                        )
                    
                    ZStack() {
                        Capsule()
                            .fill(Color("ColorRed")).opacity(0.2)
                        
                        Capsule()
                            .fill(Color("ColorRed")).opacity(0.2)
                            .padding(8)
                        
                        Text("Descubra mais")
                            .font(.title2)
                            .bold()
                            .foregroundStyle(Color("ColorRedDark"))
                            .offset(x: 20)
                        
                        HStack {
                            Capsule()
                                .fill(Color("ColorRed"))
                                .frame(width: buttonOffSet + buttonHeight)
                            Spacer()
                        }
                        
                        HStack {
                            ZStack {
                                Circle()
                                    .fill(Color("ColorRed"))
                                
                                Circle()
                                    .fill(Color("ColorRedDark"))
                                    .padding(8)
                                
                                Image(systemName: "chevron.right.2")
                                    .font(.system(size: 24))
                                    .bold()
                                    .foregroundStyle(Color.white)
                            }
                            
                            Spacer()
                        }
                        .offset(x: buttonOffSet)
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    if gesture.translation.width >= 0 && buttonOffSet <= (geometry.size.width - 60) - buttonHeight {
                                        withAnimation(.easeInOut(duration: 0.25)) {
                                            buttonOffSet = gesture.translation.width
                                        }
                                    }
                                })
                                .onEnded ({ _ in
                                    if buttonOffSet > (geometry.size.width - 60) / 2 {
                                        withAnimation(.easeInOut(duration: 0.25)) {
                                            buttonOffSet = (geometry.size.width - 60) - 80
                                            didPassIntro = true
                                        }
                                    } else {
                                        withAnimation(.easeInOut(duration: 0.25)) {
                                            buttonOffSet = 0
                                        }
                                    }
                                })
                            )
                    }
                    .frame(width: geometry.size.width - 60, height: buttonHeight)
                    .opacity(isAnimated ? 1 : 0)
                    .offset(y: isAnimated ? 0 : 100)
                }
                .onAppear {
                    withAnimation(.easeInOut(duration: 1.5)) {
                        isAnimated = true
                    }
                }
            }
        }
    }
}

#Preview {
    LoginView(didPassIntro: .constant(true))
}
