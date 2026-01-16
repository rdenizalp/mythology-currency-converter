//
//  ContentView.swift
//  Converter
//
//  Created by Deniz Alp on 12.12.2025.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    @State var leftCurrency: Currency = .athenaCoin
    @State var rightCurrency: Currency = .demeterCoin
    
    let currencyTip = CurrencyTip()
    
    var body: some View {
        
        ZStack{
            
            // Background Image
            Image(.background1)
                .resizable()
                .ignoresSafeArea()
                .opacity(0.67)
            
            
            
            VStack{
                
                //Goddess Image
                Image(.goddess)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .padding()
                
                //Currency exchange text
                Text("CURRENCY EXCHANGE")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .padding(.bottom)
                
                //Conversion Section
                HStack {
                    // Left Conversion Section
                    CurrencySection(
                        currency: leftCurrency,
                        amount: $leftAmount,
                        isLeft: true,
                        onTap: {
                            showSelectCurrency.toggle()
                            currencyTip.invalidate(reason: .actionPerformed)
                        },
                        isFocused: $leftTyping
                    )
                    .popoverTip(currencyTip, arrowEdge: .bottom)
                    
                    // Equal sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    // Right Conversion Section
                    CurrencySection(
                        currency: rightCurrency,
                        amount: $rightAmount,
                        isLeft: false,
                        onTap: {
                            showSelectCurrency.toggle()
                            currencyTip.invalidate(reason: .actionPerformed)
                        },
                        isFocused: $rightTyping
                    )
                }
                    .padding()
                    .background(.cyan.opacity(0.3))
                    .clipShape(.capsule)
                    .keyboardType(.decimalPad)
                    
                    Spacer()
                    
                    // Info button
                    HStack {
                        Spacer()
                        
                        Button{
                            showExchangeInfo.toggle()
                        } label: {
                            Image(systemName: "info.circle.fill")
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                            
                            
                        }
                        .padding(.trailing)
                        
                        .onChange(of: leftAmount) {
                            if leftTyping {
                                rightAmount =
                                leftCurrency
                                    .convert(leftAmount, to: rightCurrency)
                            }
                        }
                        .task {
                            try? Tips.configure()
                        }
                        
                        .onChange(of: rightAmount) {
                            if rightTyping {
                                leftAmount =
                                rightCurrency.convert(rightAmount, to: leftCurrency)
                            }
                        }
                        
                        .onChange(of: leftCurrency){
                            rightAmount =
                            leftCurrency
                                .convert(leftAmount, to: rightCurrency)
                            }
                        
                        .onChange(of: rightCurrency){
                            leftAmount =
                            rightCurrency.convert(rightAmount, to: leftCurrency)
                            }
                        
                        .sheet(isPresented: $showExchangeInfo){
                            ExchangeInfo()
                        }
                        
                        .sheet(isPresented: $showSelectCurrency) {
                            SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
                        }
                    }
                    
                }
                // .border(.blue)
                
            }
            
            
        }
    }


#Preview {
    ContentView()
}
