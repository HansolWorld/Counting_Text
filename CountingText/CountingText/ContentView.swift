//
//  ContentView.swift
//  CountingText
//
//  Created by apple on 5/2/24.
//

import SwiftUI

struct ContentView: View {
    @State var text = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            TextEditor(text: $text)
                .frame(width: 280, height: 330)
                .scrollContentBackground(.hidden)
                .padding(4)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.textEditorBackground)
                        .opacity(0.3)
                }
            
            let removeSpaceText = text.replacingOccurrences(of: "\\s+", with: "", options: .regularExpression, range: nil)
            
            HStack(alignment: .center) {
                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 0) {
                        Text("공백 포함")
                        Spacer()
                        HStack(spacing: 0) {
                            Text("\(text.count)")
                                .foregroundStyle(Color.accentColor)
                                .bold()
                            Text("자")
                        }
                    }
                    
                    HStack(spacing: 0) {
                        Text("공백 제외")
                        Spacer()
                        HStack(spacing: 0) {
                            Text("\(removeSpaceText.count)")
                                .foregroundStyle(Color.accentColor)
                                .bold()
                            Text("자")
                        }
                    }
                }
                .frame(width: 100)
                
                VStack(alignment: .leading, spacing: 8) {
                    Divider()
                        .frame(width: 2, height: 10)
                        .overlay(Color.black.opacity(0.3))
                    Divider()
                        .frame(width: 2, height: 10)
                        .overlay(Color.black.opacity(0.3))
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 0) {
                        Text("\(text.count)")
                            .bold()
                        Text("byte")
                    }
                    HStack(spacing: 0) {
                        Text("\(removeSpaceText.utf8.count)")
                            .bold()
                        Text("byte")
                    }
                }
                
                Spacer()
                
                HStack {
                    Button(action: {
                        NSPasteboard.general.clearContents()
                        NSPasteboard.general.setString(self.text, forType: .string)
                    }) {
                        Image(systemName: "doc.on.doc")
                    }
                    .buttonStyle(.plain)
                    Button(action: {
                        text = ""
                    }) {
                        Image(systemName: "trash")
                    }
                    .buttonStyle(.plain)
                    Button(action: {
                        NSApplication.shared.terminate(nil)
                    }) {
                        Image(systemName: "power")
                    }
                    .buttonStyle(.plain)
                }
            }
            .font(.callout)
        }
        .foregroundStyle(Color.black)
        .padding(12)
//        .background {
//            Color.popoverBackground
//                .opacity(0.35)
//        }
    }
}

#Preview {
    ContentView()
}
