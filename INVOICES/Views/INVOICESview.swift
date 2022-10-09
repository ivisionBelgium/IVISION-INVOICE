//
//  INVOICESview.swift
//  INVOICES
//
//  Created by Koen Sas, Ivision Interactive Video & Media, http://www.ivision.be, koen@ivision.be on 26/09/2022.
//

import SwiftUI

struct INVOICESview: View {
    
    @Environment(\.presentationMode) var presentationMode:Binding<PresentationMode>
    
    var body: some View {
        
        VStack(alignment: .leading){
            Text("INVOICES").font(.title).foregroundColor(.green)
            Spacer()
            
            Button("BACK"){
                
                self.presentationMode.wrappedValue.dismiss()
                
            }
        }
    }
}

struct INVOICESview_Previews: PreviewProvider {
    static var previews: some View {
        INVOICESview()
    }
}
