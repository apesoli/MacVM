//
//  VMView.swift
//  MacVM
//
//  Created by Khaos Tian on 6/28/21.
//

import SwiftUI

struct VMView: View {
    
    @ObservedObject var document: VMDocument
    var fileURL: URL?
    
    /// - Tag: ToggleAction
    var body: some View {
        Group {
            if let fileURL = fileURL {
                if document.content.installed {
                    VMUIView(virtualMachine: document.vmInstance?.virtualMachine)
                } else {
                    VMInstallView(
                        fileURL: fileURL,
                        document: document,
                        state: document.vmInstallationState
                    )
                }
            } else {
                VMInstallView(
                    fileURL: fileURL,
                    document: document,
                    state: document.vmInstallationState
                )
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .toolbar {
            ToolbarItem {
                Button("S", action: {
                    if document.serialOutput {
                        document.serialOutput = false
                    } else {
                        document.serialOutput = true
                    }
                }).foregroundColor(!document.serialOutput ? Color(red: 1.0, green: 0.0, blue: 0.0) : Color(red: 0.0, green: 1.0, blue: 0.0))
                .buttonStyle(BorderlessButtonStyle())
                .disabled(document.isRunning)
            }

            ToolbarItem {
                Button("D", action: {
                    if document.debugStub {
                        document.debugStub = false
                    } else {
                        document.debugStub = true
                    }
                }).foregroundColor(!document.debugStub ? Color(red: 1.0, green: 0.0, blue: 0.0) : Color(red: 0.0, green: 1.0, blue: 0.0))
                .buttonStyle(BorderlessButtonStyle())
                .disabled(document.isRunning)
            }

            ToolbarItem {
                Button("R", action: {
                    guard let fileURL = fileURL else {
                        return
                    }

                    if document.isRunning {
                        document.vmInstance?.stop()
                    } else {
                        document.createVMInstance(with: fileURL)
                        document.vmInstance?.startRecovery()
                    }
                })
                .buttonStyle(BorderedButtonStyle())
                .disabled(document.isRunning)
            }

            ToolbarItem {
                Button(action: {
                    if document.isRunning && !document.isPaused {
                        document.vmInstance?.pause()
                    } else if document.isRunning && document.isPaused {
                        document.vmInstance?.resume()
                    }
                }) {
                    Image(systemName: !document.isPaused ? "pause.circle" : "play.circle")
                        .font(.system(size: 24, weight: .regular, design: .rounded))
                }
                .buttonStyle(BorderlessButtonStyle())
                .disabled(!document.isRunning)
            }

            ToolbarItem {
                Button(action: {
                    guard let fileURL = fileURL else {
                        return
                    }
                    
                    if document.isRunning {
                        document.vmInstance?.stop()
                    } else {
                        document.createVMInstance(with: fileURL)
                        document.vmInstance?.start()
                    }
                }) {
                    Image(systemName: document.isRunning ? "stop.circle" : "play.circle")
                        .font(.system(size: 24, weight: .regular, design: .rounded))
                }
                .buttonStyle(BorderlessButtonStyle())
                .disabled(!document.content.installed)
            }
        }
    }
}
