//
//  ContentView.swift
//  PassMaker
//
//  Created by Paul van Woensel on 2/18/23.
//

import SwiftUI

struct ContentView: View {
    @State var isUpper: Bool = true
    @State var isPunctuation: Bool = true
    @State var isNumbers: Bool = true
    @State var pLength: Float = 8.0
    @State var password: String = ""
    @State var seePassword: Bool = false
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Toggle("Use uppercase letters", isOn: $isUpper)
                Toggle("Use numbers", isOn: $isNumbers)
                Toggle("Use special characters", isOn: $isPunctuation)
                VStack {
                    Slider(
                        value: $pLength,
                        in: 4...32
                    )
                    Text("Password length: \(Int(pLength))")
                    
                }
                .padding(.top, 20)
                Spacer().frame(height: 20)
            }
            Button {
                password = createPasswordWith(length: Int(pLength), hasNumber: isNumbers, hasPunctuation: isPunctuation, hasUpper: isUpper)
            }
        label: { Text("Create new Password")}
            
            HStack {
                if password.isEmpty { EmptyView() }  else
                { Button(action: {seePassword.toggle()}) { Image(systemName: seePassword ? "eye.slash" : "eye")}}
                Spacer()
                HStack {
                    if seePassword {
                        Text( password.isEmpty ? "" : "\(password)")
                    } else {
                        Text("\(String(password.map {_ in "*"}))")
                    }
                }.padding(.trailing, 5)
                Spacer()
                
            }.frame(height: 20)
            Divider().padding(.vertical, 10)
            HStack{
                Button {
                    DispatchQueue.global().async {
                        NSPasteboard.general.clearContents()
                        NSPasteboard.general.setString(self.password, forType: .string)
                        NSPasteboard.general.string(forType: .string)
                    }
                } label: {
                    Text("Copy")
                }.disabled(password.isEmpty)
                Spacer()
                Button{
                    DispatchQueue.global().async {
                        exit(0)
                    }
                } label: {
                    Text("Quit")
                }
            }
            
        }
        .padding()
        .frame(width: 350)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
