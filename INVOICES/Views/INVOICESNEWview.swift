//
//  INVOICESNEWview.swift
//  INVOICES
//
//  Created by Koen Sas on 27/09/2022.
//

import SwiftUI
import Firebase

struct INVOICESNEWview: View {
    var body: some View {
        
        VStack(alignment: .leading){
            
            Text("INSERT NEW INVOICE").font(.title).foregroundColor(.green)
            Spacer()
            
            
            
            Button("Back to INVOICES list") {
                
                
                
            }
            
        }
        
        
    }
}

struct INVOICESNEWview_Previews: PreviewProvider {
    static var previews: some View {
        INVOICESNEWview()
    }
}
