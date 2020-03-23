//
//  Todo.swift
//  Mini Notes
//
//  Created by Sanju S on 23/03/20.
//  Copyright © 2020 Whizz App Studio. All rights reserved.
//

import Foundation
import CoreData

public class Todo:NSManagedObject, Identifiable{
    
    @NSManaged public var createdAt:Date?
    @NSManaged public var title:String?
    @NSManaged public var note:String?
}


extension Todo{
    
    static func getAllTodoNotes() -> NSFetchRequest<Todo>{
        
        let request:NSFetchRequest<Todo> = Todo.fetchRequest() as! NSFetchRequest<Todo>
        
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
        
    }
    
}

