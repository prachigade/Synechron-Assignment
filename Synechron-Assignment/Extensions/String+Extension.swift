//
//  String+Extension.swift
//  Synechron-Assignment
//
//  Created by Prachi Gade on 13/07/23.
//

import Foundation

extension String {
    func validateEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return predicate.evaluate(with: self)
    }
    
    func validatePassword() -> Bool {
        return (self.count > 7 && self.count < 16)
    }
}
