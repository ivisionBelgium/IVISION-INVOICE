//
//  ContentView.swift
//  INVOICES
//
//  Created by Koen Sas, Ivision Interactive Video & Media, http://www.ivision.be, koen@ivision.be on 26/09/2022.
//

import SwiftUI
import Firebase



struct ContentView: View {
    
    
    // naar class ViewModel: ObservableObject
    @ObservedObject var vModel = ViewModel()
    
    @State private var showHome:Bool = false
    @State private var showClients:Bool = false
    @State private var showCallsheets:Bool = false
    @State private var showDetails:Bool = false
    @State private var showInvoices:Bool = false
    
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
    
    // Observable staat in Models/TitleTest.swift
    @ObservedObject var obsTitleFields = modTitleTransfer()
    
    var body: some View {
        VStack {
            
            // List(vModel.lst, id: \.self) id: kan hier weg omdat de ClientFields struct identifiable is
            List(vModel.lst){ item in

                HStack{
                    
                    Text(item.varClientName).foregroundColor(.green)
                    Spacer()
                    // button Update
                    Button(action: {
                        
                        vModel.updateData(ClientFieldToUpdate: item)
                    }, label: {
                        
                        Image(systemName: "pencil")
                    })
                    .buttonStyle(BorderedButtonStyle())
                    
                    // button delete
                    Button(action: {
                        vModel.deleteData(ClientFieldsToDelete: item)
                        
                    }, label: {
                        
                        Image(systemName: "minus.circle")
                        
                    })
                    .buttonStyle(BorderedButtonStyle())
                }
            }
            
            Image(systemName: "leaf.fill")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            //          Voorheen hard coding, nu de fields
//            //Text("Title")
//            Text(obsTitleFields.txtTitle)
//                .font(.title)
//            //Text("Remarks")
//            Text(obsTitleFields.txtRemark)
//
            HStack {
                Button("HOME") {
                    self.showHome.toggle()
                }.sheet(isPresented: $showHome) {
                    
                    //       dus: obsTitleFields is een object met twee text fields txtTitle en txtRemarks in HOMEview.swift en ook de andere views waarschijnlijk. txtRemark (zonder s en txtTitle zijn de published vars in //Models/TitleTest.swift
                    
                    
                    //                    HOMEview(txtTitle: self.$obsTitleFields.txtTitle, txtRemarks: self.$obsTitleFields.txtRemark)
                    
                    HOMEview()
                    
                }
                Button("CLIENTS") {
                    
                    self.showClients.toggle()
                    
                    
                }.sheet(isPresented: $showClients) {
               
                    
                    CLIENTSview()
                    
                }
                Button("INVOICES"){
                    
                    self.showInvoices.toggle()
                }.sheet(isPresented: $showInvoices){
                    
                    INVOICESview()
                    
                }
                Button("CALLSHEETS"){
                    
                    self.showCallsheets.toggle()
                    
                }.sheet(isPresented: $showCallsheets){
                    
                    CALLSHEETSview()
                    
                }
            }
            
            .padding()
        }
        
    }
    init(){
        
        vModel.getData()
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
