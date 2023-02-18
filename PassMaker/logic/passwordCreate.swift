//
//  passwordCreate.swift
//  PassMaker
//
//  Created by Paul van Woensel on 2/18/23.
//

import Foundation

let alphabet = "abcdefghijklmnopqrstuvwxyz"
let upper = alphabet.uppercased()
let numbers = "123456789"
let punctuations = "!@#$%^&*()-_=+{}[];:'\"<>,.?"

func createPasswordWith(length: Int, hasNumber: Bool = true, hasPunctuation: Bool = true, hasUpper: Bool = true ) -> String {
    let combination: String = alphabet + (hasNumber ? numbers : "") + (hasUpper ? upper : "") + (hasPunctuation ? punctuations : "")
    
    let result = (1...length).map{ _ in combination.randomElement()! }
    return String(result)
}
