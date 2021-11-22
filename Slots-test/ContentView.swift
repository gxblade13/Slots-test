//
//  ContentView.swift
//  Slots-test
//
//  Created by Damiano Mauro on 22/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var credit = 1000
    @State var slot1 = 1
    @State var slot2 = 1
    @State var slot3 = 1
    
    var body: some View {

        ZStack
        {

            Rectangle()
                .foregroundColor(Color.orange)
                .ignoresSafeArea(.all)
            Rectangle()
                .foregroundColor(Color.yellow)
                .rotationEffect(Angle(degrees: 45))
                .ignoresSafeArea(.all)
            
            
            VStack
            {
                Spacer()
                Text("SwiftUI Slots!")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                    
                    
                Spacer()
                
                Text("Credit: " + String(credit)).foregroundColor(Color.white)
                
                Spacer()
                
                HStack
                {
                    //Resize altrimenti l'immagine non ci sta
                    Image("fruit\(slot1)").resizable().aspectRatio(contentMode: .fit)
                    Image("fruit\(slot2)").resizable().aspectRatio(contentMode: .fit)
                    Image("fruit\(slot3)").resizable().aspectRatio(contentMode: .fit)
                }
                
                Spacer()
                
                Button("Spin!")
                {
                    //Quando clicco devo generare tre numeri random
                    slot1 = Int.random(in: 1...3)
                    slot2 = Int.random(in: 1...3)
                    slot3 = Int.random(in: 1...3)
                    
                    //Se ci sono tutti e tre i numeri uguali allora incremento il credito, altrimenti dimiuisco
                    if (slot1 == slot2 && slot2 == slot3)
                    {
                        credit += 25
                        
                    }
                    else{
                        credit -= 5
                    }
                    
                }.foregroundColor(Color.white).padding(.all).background(Color.red)
                    .cornerRadius(35)
                    .font(.system(size: 18, weight: .bold, design: .default))
                
                
                Spacer()
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
