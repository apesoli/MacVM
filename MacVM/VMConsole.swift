//
//  VMConsole.swift
//  MacVM
//
//  Created by alfredo on Dec 15, 2021.
//

import Cocoa
import SwiftTerm

class VMConsole: NSViewController, TerminalViewDelegate {
    private var terminalView: TerminalView!

    private var readPipe: Pipe?
    private var writePipe: Pipe?

    override func loadView() {
        view = NSView()
    }

    deinit {
        readPipe?.fileHandleForReading.readabilityHandler = nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        terminalView = TerminalView()
        terminalView.translatesAutoresizingMaskIntoConstraints = false
        terminalView.terminalDelegate = self
        view.addSubview(terminalView)

        // Let the child view run to the edges of its parent
        NSLayoutConstraint.activate([
            terminalView.topAnchor.constraint(equalTo: view.topAnchor),
            terminalView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            terminalView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            terminalView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    func configure(with readPipe: Pipe, writePipe: Pipe) {
        self.readPipe = readPipe
        self.writePipe = writePipe

        readPipe.fileHandleForReading.readabilityHandler = { [weak self] pipe in
            let data = pipe.availableData
            if let strongSelf = self {
                DispatchQueue.main.sync {
                    strongSelf.terminalView.feed(byteArray: [UInt8](data)[...])
                }
            }
        }
    }

    func hostCurrentDirectoryUpdate(source: TerminalView, directory: String?) {

    }

    func sizeChanged(source: TerminalView, newCols: Int, newRows: Int) {

    }
    
    func setTerminalTitle(source: TerminalView, title: String) {

    }

    func send(source: TerminalView, data: ArraySlice<UInt8>) {
        writePipe?.fileHandleForWriting.write(Data(data))
        terminalView.feed(byteArray: [UInt8](data)[...])
    }

    func scrolled(source: TerminalView, position: Double) {

    }
}
