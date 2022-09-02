//
//  NSObject.swift
//  GeneralCellDesign
//
//  Created by Başak on 9/2/22.
//

import Foundation

extension NSObject {
    
    public static var className: String {
      return  String(describing: self)
    }
}
