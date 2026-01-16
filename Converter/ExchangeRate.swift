import SwiftUI

struct ExchangeRate: View {
    let leftImage: ImageResource
    let text: String
    let rightImage: ImageResource
         var body: some View{
             HStack{
                // Left Currency Image
                    Image(leftImage)
                     .resizable()
                     .scaledToFit()
                     .frame(width: 60, height:60)
                     
                     
                           
                // Exchange Rate Text
                    Text(text)
                     
                 
                           
                // Right Currency Image
                    Image(rightImage)
                     .resizable()
                     .scaledToFit()
                     .frame(width: 60, height:60)
                  
                           
                       }
    }
}

#Preview{
    ExchangeRate(leftImage: .athena, text: "1 Athena Drachma = 4 Hermes Drachmas", rightImage: .hermes)
    
}

