//
//  Utiles.swift
//  SampleToDoDemo
//
//  Created by asmita.borawake on 06/08/18.
//  Copyright © 2018 asmita.borawake. All rights reserved.
//

import Foundation
import UIKit

//MARK : date function
func dateFromString(date:String) -> Date?{
    let dateFormater = DateFormatter()
    dateFormater.dateFormat = "yyyy-MM-dd"
    return dateFormater.date(from: date)
}


func stringFromDate(date:Date) -> String{
    let dateFromater = DateFormatter()
    dateFromater.dateFormat = "yyyy-MM-dd"
    return dateFromater.string(from: date)
}


//MARK : helper function
func messageLbl(messageLbl : UILabel, frame : CGRect, text : String, textColor : UIColor, numberOfLines : Int, textAlignment : NSTextAlignment, font : UIFont){
    messageLbl.frame = frame
    messageLbl.text = text
    messageLbl.textColor = textColor
    messageLbl.numberOfLines = numberOfLines
    messageLbl.textAlignment = textAlignment
    messageLbl.font = font
    messageLbl.sizeToFit()
    
    
}
