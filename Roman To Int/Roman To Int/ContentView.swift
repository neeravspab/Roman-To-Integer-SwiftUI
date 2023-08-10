//
//  ContentView.swift
//  Roman To Int
//
//  Created by niravkumar patel on 6/16/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var romanTextfield: String = ""
    @State private var isAlertShow = false
    @State private var integerNumber: Int? = nil
    @ObservedObject private var viewmodel = ContentViewViewModel()
    
    var body: some View {
        ZStack {
            
            Color(.systemGray5)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack {
                    Group {
                        Text("Roman To Integer")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding()
                        
                        Text("Intruction")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.top,50)
                        Text("Please Enter Valid Roman Numeral In The Range [1, 3999]")
                            .multilineTextAlignment(.center)
                            .padding(.bottom)
                    }
                }
                
                VStack {
                    Spacer()
                    TextField("Enter Roman Number", text: $romanTextfield)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.alphabet)
                        .submitLabel(.go)
                        .onSubmit {
                            findNumberfromRoman()
                        }
                        .alert("Please Enter Valid Roman latter", isPresented: $isAlertShow, actions: {
                            Button("OK", action: {})
                        })
                    
                    Button {
                        findNumberfromRoman()
                    } label: {
                        VStack {
                            Text("Submit")
                                .font(.title2)
                                .foregroundColor(Color(.systemBackground))
                                .frame(width: 300, height: 40)
                        }
                        .background(Color(.label))
                        .cornerRadius(10)
                        .padding(.top)
                    }
                    
                    Button {
                        romanTextfield = ""
                    } label: {
                        
                        VStack {
                            Text("Clear Text")
                                .font(.title2)
                                .foregroundColor(Color(.systemBackground))
                                .frame(width: 300, height: 40)
                        }
                        .background(Color(.label))
                        .cornerRadius(10)
                        .padding(.top, 8)
                    }
                    Spacer()
                    if romanTextfield.isEmpty || integerNumber == nil {
                        Text("")
                    } else {
                        Text("Integer number is \(integerNumber ?? 0)")
                            .font(.headline)
                    }
                }
            }
            .padding()
        }
    }
    
    func findNumberfromRoman() {
        if !romanTextfield.isEmpty && viewmodel.error.isEmpty {
            isAlertShow = false
            integerNumber = viewmodel.convertRomanToInteger(romanTextfield.uppercased())
        } else {
            isAlertShow = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
