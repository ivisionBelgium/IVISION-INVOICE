//
//  CLIENTSDETAILview.swift
//  INVOICES
//
//  Created by Koen Sas, Ivision Interactive Video & Media, http://www.ivision.be, koen@ivision.be on 26/09/2022.
//

import SwiftUI
import Firebase

struct CLIENTSDETAILview: View {
    
    @ObservedObject var vModel = ViewModel()
    

    @State var varClientName = ""
    @State var varClientContact = ""
    @State var varClientStreet = ""
    @State var varClientStreetNr = ""
    @State var varClientPostalCode = ""
    @State var varClientCity = ""
    @State var varClientCountry = ""
    @State var varClientEmail = ""
    @State var varClientRemarks = ""
    @State var varClientVAT = ""
    
   
    var body: some View {
        
        // in groepen onder de 10 anders error
        
        ZStack{
        VStack{
            
            Image("BG_IV_CAMS")
                .resizable()
                .scaledToFit()
            
            Group{
                
                
                TextField("txtclientName", text:  $varClientName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 350, height: 30, alignment: .center)
                
                TextField("txtclientContact", text: $varClientContact)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 350, height: 30, alignment: .center)
                TextField("txtClientStreet", text: $varClientStreet)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 350, height: 30, alignment: .center)
                TextField("txtClientStreetNr", text: $varClientStreetNr)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 350, height: 30, alignment: .center)
                TextField("txtClientPostalCode", text: $varClientPostalCode)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 350, height: 30, alignment: .center)
                
            }
            Group{
                TextField("txtClientCity", text: $varClientCity)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 350, height: 30, alignment: .center)
                TextField("txtClientCountry", text: $varClientCountry)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 350, height: 30, alignment: .center)
                TextField("txtClientEmail", text: $varClientEmail)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 350, height: 30, alignment: .center)
                TextField("txtClientRemarks", text: $varClientRemarks)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 350, height: 30, alignment: .center)
                TextField("txtClientVAT", text: $varClientVAT)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 350, height: 30, alignment: .center)
                
            }
        
                
                Button {
                    vModel.addData(txtClientName: varClientName,
                                   txtClientContact: varClientContact,
                                   txtClientStreet: varClientStreet,
                                   txtClientStreetNr: varClientStreetNr,
                                   txtClientPostalCode: varClientPostalCode,
                                   txtClientCity: varClientCity,
                                   txtClientCountry: varClientCountry,
                                   txtClientEmail: varClientEmail,
                                   txtClientRemarks: varClientRemarks,
                                   txtClientVAT: varClientVAT)
                    
                    
                    
                    
                    
                    
                } label: {
                    Text("Update client")
                }
                
                
        }
            
        }
    }
    
    
    
    init(){
        
        vModel.getData()
    }
        
    }




    

struct CLIENTSDETAILview_Previews: PreviewProvider {
    static var previews: some View {
        CLIENTSDETAILview()
    }
}
