//
//  ExchangeInfo.swift
//  Converter
//
//  Created by Deniz Alp on 21.12.2025.
//

import SwiftUI

struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            //Background Image
            Image(.background2)
                .resizable()
                .ignoresSafeArea()
                .opacity(0.67)
            
            VStack{
                // Title Text
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(7)
                
                // Description Text
                Text("Here in Ancient Greece, we are happy to offer you a place where you can exchange all the known currencies in our world. Four coins, inspired by the goddesses and gods of Olympus, define our exchange system. Consult the guide below to learn their exchange rates.")
                    .font(.title3)
                    .padding()
                
                //Exchange rates
                ExchangeRate(leftImage: .athena, text: "1 Athena Drachma = 3 Demeter Drachmas", rightImage: .demeter)
                ExchangeRate(leftImage: .demeter, text: "1 Demeter Drachma = 3 Dionysos Drachmas", rightImage: .dionysos)
                ExchangeRate(leftImage: .dionysos, text: "1 Dionysos Drachma = 3 Hermes Drachmas", rightImage: .hermes)
                ExchangeRate(leftImage: .athena, text: "1 Athena Drachma = 27 Hermes Drachmas", rightImage: .hermes)
                //Done Button
                Button("Done"){
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .yellow, by: 0.6))
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
                
            }
            .foregroundStyle(.black)
            
                
        }
    }
}

#Preview {
    ExchangeInfo()
}
