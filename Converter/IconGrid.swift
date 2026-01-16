//
//  IconGrid.swift
//  Converter
//
//  Created by Deniz Alp on 22.12.2025.
//

import SwiftUI

struct IconGrid: View {
    @Binding var currency: Currency
    
    var body: some View {
        
        //Currency icons
        LazyVGrid(columns: [GridItem(), GridItem()]) {
            ForEach(Currency.allCases) { currency in
                if self.currency == currency{
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                        .shadow(color: .black, radius: 10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(lineWidth: 3)
                                .opacity(0.5)
                        }
                } else {
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                        .onTapGesture {
                            self.currency = currency
                        }
                    
                }
                
            }
        }
        
    }
}

#Preview {
    @Previewable @State var currency: Currency = .athenaCoin
    
    IconGrid(currency: $currency)
}
