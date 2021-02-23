//
//  SettingsView.swift
//  Todo App
//
//  Created by SLYTH on 22/02/21.
//

import SwiftUI

struct SettingsView: View {
  
  @Environment(\.presentationMode) var presentationMode
  @EnvironmentObject var iconSettings: IconNames
  
  var body: some View {
    NavigationView{
      VStack(alignment: .center, spacing: 0){
        
        Form{
          
          
          Section(header: Text("Choose the App Icon")){
            Picker(selection: $iconSettings.currentIndex, label:
                    HStack{
                      ZStack{
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                          .strokeBorder(Color.primary, lineWidth: 2)
                        
                        Image(systemName: "paintbrush")
                          .font(.system(size: 28, weight: .regular, design: .default))
                          .foregroundColor(Color.primary)
                      }
                      .frame(width: 44, height: 44)
                      
                      Text("App Icons".uppercased())
                        .fontWeight(.bold)
                        .foregroundColor(Color.primary)
                    }
                   
            ) {
              ForEach(0..<iconSettings.iconNames.count) { index in
                HStack {
                  Image(uiImage: UIImage(named: self.iconSettings.iconNames[index] ?? "Blue")
                          ?? UIImage())
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 44, height: 44)
                    .cornerRadius(8)
                  
                  Spacer().frame(width: 8)
                  
                  Text(self.iconSettings.iconNames[index] ?? "Blue")
                    .frame(alignment: .leading)
                }
                .padding(3)
              }
            }
            .onReceive([self.iconSettings.currentIndex].publisher.first()) { (value) in
              let index = self.iconSettings.iconNames.firstIndex(of: UIApplication.shared.alternateIconName) ?? 0
              if index != value {
                UIApplication.shared.setAlternateIconName(self.iconSettings.iconNames[value])
                { error in
                  if let error = error {
                    print(error.localizedDescription)
                  } else {
                    print("Success! You Have Changed The App Icon.")
                  }
                }
              }
            }
          }
          .padding(.vertical, 3)
          
          
          Section(header: Text("Follow us on Social Media")){
            
            FormRowLinkView(icon: "globe", color: Color.pink, text: "Portfolio", link: "https://portfolio-2245.web.app")
            FormRowLinkView(icon: "link", color: Color.blue, text: "Instagram", link: "https://www.instagram.com/abilmyname_/")
            FormRowLinkView(icon: "play.rectangle", color: Color.green, text: "Course", link: "https://github.com/abilmyname")
            
          }
          .padding(.vertical, 3)
          
          
          Section(header: Text("About The Application")){
            
            FormRowStaticView(icon: "gear", firstText: "Application", secondText: "Todo")
            FormRowStaticView(icon: "checkmark.seal", firstText: "Compatibility", secondText: "IPhone, IPad")
            FormRowStaticView(icon: "keyboard", firstText: "Developer", secondText: "Nabil / Great")
            FormRowStaticView(icon: "paintbrush", firstText: "Designer", secondText: "Nabil Achmad")
            FormRowStaticView(icon: "flag", firstText: "Version", secondText: "1.0.0")
            
          }
          .padding(.vertical, 3)
        }
        .listStyle(GroupedListStyle())
        .environment(\.horizontalSizeClass, .regular)
        
        Text("Copyright © Allrights reserved.\nBetter App less code")
          .multilineTextAlignment(.center)
          .font(.footnote)
          .padding(.top, 6)
          .padding(.bottom, 8)
          .foregroundColor(Color.secondary)
      }
      .navigationBarItems(trailing:
                            Button(action: {
                              self.presentationMode.wrappedValue.dismiss()
                            }){
                              Image(systemName: "xmark")
                            }
      )
      .navigationBarTitle("Settings", displayMode: .inline)
      .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
    }
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView().environmentObject(IconNames())
  }
}
