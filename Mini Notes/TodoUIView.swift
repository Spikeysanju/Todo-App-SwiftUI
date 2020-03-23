//
//  TodoUIView.swift
//  Mini Notes
//
//  Created by Sanju S on 23/03/20.
//  Copyright © 2020 Whizz App Studio. All rights reserved.
//

import SwiftUI

struct TodoUIView: View {
    var title:String = ""
    var note:String = ""
    var createdAt:String = ""

    
    var body: some View {

        HStack{
            VStack(alignment: .leading){
                
                Text(title).font(.headline)
                Text(note).font(.body)
                Text(createdAt).font(.caption)
                
            }
        }
        
    }
}

struct TodoUIView_Previews: PreviewProvider {
    static var previews: some View {
        TodoUIView(title: "Spikey on Xcode",  note: "Hello this is my first swift UI project for roam", createdAt: "Today")
    }
}
