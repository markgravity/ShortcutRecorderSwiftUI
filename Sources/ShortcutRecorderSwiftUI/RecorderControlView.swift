//
//  RecorderControlView.swift
//
//
//  Created by MarkG on 13/6/24.
//

import SwiftUI
import ShortcutRecorder

public struct RecorderControl: NSViewRepresentable {

    @Binding var keyEquivalent: String

    public init(keyEquivalent: Binding<String>) {
        _keyEquivalent = keyEquivalent
    }

    public func makeCoordinator() -> Coordinator {
        .init(keyEquivalent: $keyEquivalent)
    }

    public func makeNSView(context: Context) -> ShortcutRecorder.RecorderControl {
        let recorder = ShortcutRecorder.RecorderControl(frame: .zero)
        recorder.delegate = context.coordinator
        recorder.objectValue = Shortcut(keyEquivalent: keyEquivalent)

        return recorder
    }

    public func updateNSView(_ nsView: ShortcutRecorder.RecorderControl, context: Context) {
        nsView.objectValue = .init(keyEquivalent: keyEquivalent)
    }

    public class Coordinator: NSObject, RecorderControlDelegate {

        let keyEquivalent: Binding<String>

        init(keyEquivalent: Binding<String>) {
            self.keyEquivalent = keyEquivalent
        }

        public func recorderControlDidEndRecording(_ aControl: ShortcutRecorder.RecorderControl) {
            guard let keyEquivalent = aControl.objectValue?.description
            else { return }
            self.keyEquivalent.wrappedValue = keyEquivalent
        }
    }
}
