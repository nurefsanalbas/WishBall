//
//  LottieView.swift
//  LottieTutorial
//
//  Created by Nur Efsan Albas on 26.10.2021.
//

import Foundation
import Lottie
import SwiftUI
import UIKit

struct LottieView: UIViewRepresentable{
   
    typealias UIViewType = UIView
    var filename:String
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
     
        let view = UIView(frame: .zero)
        let animationView=AnimationView()
        animationView.animation =  Animation.named(filename)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        view.addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints=false
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ _uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
     
    }
    
    
   
}

