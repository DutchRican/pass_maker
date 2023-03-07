//
//  TogglesView.swift
//  PassMaker
//
//  Created by Paul van Woensel on 3/7/23.
//

import SwiftUI

struct TogglesView: View {
    @Binding var isUpper: Bool
    @Binding var isNumbers: Bool
    @Binding var isPunctuation: Bool
    @Binding var pLength: Float
    
    var body: some View {
        VStack(alignment: .leading) {
            Toggle("Use uppercase letters", isOn: $isUpper)
            Toggle("Use numbers", isOn: $isNumbers)
            Toggle("Use special characters", isOn: $isPunctuation)
            VStack(alignment: .leading) {
                Slider(
                    value: $pLength,
                    in: 4...32
                )
                Text("Password length: \(Int(pLength)) characters")
                
            }
            .padding(.top, 20)
            Spacer().frame(height: 20)
        }
    }
}

struct TogglesView_Previews: PreviewProvider {
    static var previews: some View {
        TogglesView(isUpper: .constant(true), isNumbers: .constant(false), isPunctuation: .constant(true), pLength: .constant(8.0))
    }
}
