//
//  SelectCurrency.swift
//  Converter
//
//  Created by Deniz Alp on 22.12.2025.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var topCurrency: Currency
    @Binding var bottomCurrency: Currency
    
    var body: some View {
        ZStack{
            //Background Image
            Image(.background2)
                .resizable()
                .ignoresSafeArea()
                .opacity(0.67)
            
            VStack{
                //Text
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                //Currency icons
               IconGrid(currency: $topCurrency)
                
                //Text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                    .padding(.top)
                
                //Currency icons
                IconGrid(currency: $bottomCurrency)
                
                //Done button
                Button("Done"){
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .yellow, by: 0.6))
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
                
            }
            .padding()
            .multilineTextAlignment(.center)
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    @Previewable @State var topCurrency: Currency = .hermesCoin
    @Previewable @State var bottomCurrency: Currency = .dionysosCoin
    
    SelectCurrency(topCurrency: $topCurrency,
                   bottomCurrency: $bottomCurrency)
}
