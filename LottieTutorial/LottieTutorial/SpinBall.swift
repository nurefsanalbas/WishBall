//
//  SpinBall.swift
//  LottieTutorial
//
//  Created by Nur Efsan Albas on 26.10.2021.
//

import Foundation
class SpinBall{

    func Spin()->String{

        let answers = ["Of course", "No...", "Yes...","Maybe Later...","It will be...","It won't happen anytime soon...", "Will happen soon...", "Be hopeful about it...","Unfortunately No...","Your dreams come true...","Nothing is impossible","Your thoughts will be true...","No doubt...","Certainly...","Sure...","Without doubt...","I'm sorry, not...","Doubtless","You have to wait for this..."]
        
        let randomAnswers = answers.randomElement()!
        
        return randomAnswers

    }
}
