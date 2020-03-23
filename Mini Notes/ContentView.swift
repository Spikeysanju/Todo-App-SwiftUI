//
//  ContentView.swift
//  Mini Notes
//
//  Created by Sanju S on 23/03/20.
//  Copyright © 2020 Whizz App Studio. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Todo.getAllTodoNotes()) var todo:FetchedResults<Todo>
    @State private var newTodo = ""
    @State private var newNote = ""
    
    
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("What's next?")){
                    
                    VStack{
                        TextField("Title", text: self.$newTodo)
                        TextField("Content", text: self.$newNote)
                        Button(action: {
                            
                            let todo = Todo(context: self.managedObjectContext)
                            todo.title = self.newTodo
                            todo.note = self.newNote
                            todo.createdAt = Date()
                            
                            do{
                                try self.managedObjectContext.save()
                                
                            } catch{
                                print(error)
                    
                            }
                            
                        }){
                    
                           Text("Save note")
                               .padding()
                               .frame(width: 250, height: 50)
                               .background(Color.purple)
                               .foregroundColor(.white)
                               .font(.body)
                            .cornerRadius(12)
                        }
                        
                    }
                }.font(.headline)
                
                Section(header:Text("Todo's")){
                    
                    ForEach(self.todo){
                        items in TodoUIView(
                            title:items.title!, note:items.note!, createdAt: "\(items.createdAt!)")
                    }.onDelete{
                        
                        IndexSet in
                        
                        let deleteItem = self.todo[IndexSet.first!]
                        self.managedObjectContext.delete(deleteItem)
                        
                        do{
                            
                            try self.managedObjectContext.save()
                        } catch{
                        
                            print(error)
                        }
                    }
                
                }
            }
        
            .navigationBarTitle(Text("Todo Notes"))
            .navigationBarItems(trailing: EditButton())
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
