//
//  ContentView.swift
//  LottieTutorial
//
//  Created by Nur Efsan Albas on 26.10.2021.
//

import SwiftUI


struct ContentView: View {
    var spinBall=SpinBall()
    @State var ball:String=""
    var body: some View {
        GeometryReader { bounds in
            ZStack {
                Image("sky").resizable()
                VStack{
                    Text("Make a wish and press the ball,\n It will give you the answer")
                        .foregroundColor(.white)
                        .font(.custom("ChalkDuster", size: bounds.size.width > 375 ? 21 : 18))  .shadow(color: .blue, radius: 10, x: 0, y: 20)
                        .padding()
                    
                    Button(action:{
                        ball=spinBall.Spin()
                        
                    } ,label: {
                        LottieView(filename:"70217-magic-ball")
                            .frame(width: 500, height: 500, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    })
                    
                    Text(ball)
                    
                        .italic()
                        .foregroundColor(.white)
                        .font(.custom("ChalkDuster", size: 19))
                        .shadow(color: .purple, radius: 10, x: 0, y: 20)
                        .padding()
                      
                    
                    
                }
                .frame(width: bounds.size.width)
            }
            .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
