//
//  CurrencySection.swift
//  Converter
//
//  Created by Deniz Alp on 14.01.2026.
//

import SwiftUI
import TipKit

struct CurrencySection: View {
    let currency: Currency
    @Binding var amount: String
    let isLeft: Bool
    let onTap: () -> Void
    
    @FocusState.Binding var isFocused: Bool
    
    var body: some View {
        VStack {
                 HStack {
                     if isLeft {
                         Image(currency.image)
                             .resizable()
                             .scaledToFit()
                             .frame(height: 50)

                         Text(currency.name)
                             .font(.headline)
                             .foregroundStyle(.white)
                     } else {
                         Text(currency.name)
                             .font(.headline)
                             .foregroundStyle(.white)

                         Image(currency.image)
                             .resizable()
                             .scaledToFit()
                             .frame(height: 50)
                     }
                 }
                 .padding(.bottom, -5)
                 .onTapGesture(perform: onTap)

                 TextField("Amount", text: $amount)
                     .textFieldStyle(.roundedBorder)
                     .multilineTextAlignment(.center)
                     .focused($isFocused)
             }
        
    }
    
}
