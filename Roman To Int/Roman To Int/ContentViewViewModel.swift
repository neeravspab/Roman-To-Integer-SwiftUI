//
//  ContentViewViewModel.swift
//  Roman To Int
//
//  Created by niravkumar patel on 6/16/23.
//

import Foundation

class ContentViewViewModel: ObservableObject {
    
    @Published var error = ""
    /// Pass Roman string value
    
    func convertRomanToInteger(_ s: String) -> Int? {
        
        let arrRomanvalues:[String:Int] = ["I": 1,
                                           "V":5,
                                           "X":10,
                                           "L":50,
                                           "C":100,
                                           "D":500,
                                           "M":1000]
        /// Convert to Array of String
        let arrStrings:[String]? = s.map { String($0) }
        var arrIntvalues:[Int] = []
        var finalResultValue = 0
        var nextvaluetaken = false
        
        let containsIntegers = arrStrings?.contains { element in
            Int(element) != nil
        }
        
        guard let containsIntegers = containsIntegers else { return nil}
        
        if containsIntegers {
            print("The array contains integer values.")
            error = "Input contains integer values."
            return nil
        } else {
            print("The array does not contain integer values.")
            
            guard let arryOfRomanValues = arrStrings else { return nil }
            
            for i in 0..<arryOfRomanValues.count {
                
                /// Get the first value from array of String...
                /// Find that First number from Array of Roman dictionary.
                let f = arryOfRomanValues[i]
                guard let firstValue:Int = arrRomanvalues[f]  else { return nil }
                
                /// Check the next value from array
                /// If nextvalue is greater than array of count then take that value...
                /// Find the next value from Roman array
                
                if (i+1) < arryOfRomanValues.count  {
                    
                    let next = arryOfRomanValues[i+1]
                    guard let nextValue:Int = arrRomanvalues[next]  else { return nil }
                    
                    /// If first value id greater than nextvalue then minus it
                    if firstValue < nextValue {  // EX. IX(1,10) -> (1<10)
                        arrIntvalues.append(nextValue-firstValue) // EX. (10-1) -> add 9
                        nextvaluetaken = true
                    }
                    /// If not then add that value in array
                    else {
                        if nextvaluetaken == true {
                            nextvaluetaken = false
                        }  else {
                            arrIntvalues.append(firstValue) // Add value in array
                        }
                    }
                }
                /// If it's last value in array
                /// If it's alredt taken then  it will skip...
                else {
                    if nextvaluetaken == true {
                        nextvaluetaken = false
                    }  else {
                        arrIntvalues.append(firstValue)
                    }
                }
            }
            /// Sum all integer value from array
            for i in arrIntvalues {
                finalResultValue += i
            }
            
            return finalResultValue
        }
    }
}
