//
//  Currency.swift
//  Converter
//
//  Created by Deniz Alp on 24.12.2025.
//
import SwiftUI

enum Currency: Double, CaseIterable, Identifiable {
    
    case athenaCoin = 1
    case demeterCoin = 3
    case dionysosCoin = 9
    case hermesCoin = 27
    
    var id: Currency {self}
    
    var image: ImageResource {
        switch self {
        case .athenaCoin:
                .athena
        case .demeterCoin:
                .demeter
        case .dionysosCoin:
                .dionysos
        case .hermesCoin:
                .hermes
        }
        
        
    }
        var name: String {
            switch self {
            case .athenaCoin:
                "Athena Drachma"
            case .demeterCoin:
                "Demeter Drachma"
            case .dionysosCoin:
                "Dionysos Drachma"
            case .hermesCoin:
                "Hermes Drachma"
            }
        }
    func convert(_ amountString: String, to currency: Currency) -> String{
        guard let doubleAmount = Double(amountString) else{
            return ""
        }
        let convertedAmount = (doubleAmount / self.rawValue) * currency.rawValue
        
        return String(format: "%.2f", convertedAmount)
    }
    
}
