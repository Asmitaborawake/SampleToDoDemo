//
//  ToDoItemModelView.swift
//  SampleToDoDemo
//
//  Created by asmita.borawake on 06/08/18.
//  Copyright © 2018 asmita.borawake. All rights reserved.
//

import Foundation

class ToDoItemModelView : NSObject{
    var id : String
    var image : String
    var title : String
    var date : Date
    
    init(id: String , image: String, title: String, date: Date) {
        self.id = id
        self.image = image
        self.title = title
        self.date = date
    }
    
}
