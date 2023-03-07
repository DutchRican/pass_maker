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
            TogglesView(isUpper: $isUpper, isNumbers: $isNumbers, isPunctuation: $isPunctuation, pLength: $pLength)
            Button {
                password = createPasswordWith(length: Int(pLength), hasNumber: isNumbers, hasPunctuation: isPunctuation, hasUpper: isUpper)
            }
        label: { Text("Create new Password")}
            
            HStack {
                if password.isEmpty { EmptyView() }  else
                {
                    HStack {
                        Button(action: {
                            password = ""
                            seePassword = false
                        }) {
                            Image(systemName: "trash").font(.caption).foregroundColor(.red)
                            
                        }
                        Button(action: {seePassword.toggle()}) { Image(systemName: seePassword ? "eye.slash" : "eye").font(.footnote)}
                    }
                }
                Spacer()
                HStack {
                    if seePassword {
                        Text( password.isEmpty ? "" : "\(password)")
                    } else {
                        Text("\(String(password.map {_ in "*"}))")
                    }
                }                .font(.system(size: 10, weight: .regular, design: .monospaced))
                
                    .padding(.trailing, 5)
                Spacer()
                
            }.frame(height: 20)
            Divider().padding(.vertical, 10)
            HStack{
                Button {
                    Task {
                        NSPasteboard.general.clearContents()
                        NSPasteboard.general.setString(self.password, forType: .string)
                        NSPasteboard.general.string(forType: .string)
                    }
                } label: {
                    Text("Copy")
                }.disabled(password.isEmpty)
                Spacer()
                Button{
                    Task {
                        exit(0)
                    }
                } label: {
                    Text("Quit")
                }
            }
        }
        .padding()
        .frame(width: 320)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
