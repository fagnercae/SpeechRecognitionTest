//
//  ViewController.swift
//  SpeechRecognition
//
//  Created by Fagner Caetano on 27/08/20.
//

import UIKit
import InstantSearchVoiceOverlay

class ViewController: UIViewController, VoiceOverlayDelegate {
    
    

    let voiceOverlay = VoiceOverlayController()
    
    @IBOutlet var myButton: UIButton!
    @IBOutlet var myRecording: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myButton.backgroundColor = .systemRed
        myButton.setTitleColor(.white, for: .normal)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapButton() {
        voiceOverlay.delegate = self
        voiceOverlay.settings.autoStart = false
        voiceOverlay.settings.autoStop = true
        voiceOverlay.settings.autoStopTimeout = 3
        
        voiceOverlay.start(on: self) { (text, final, _) in
            if final {
                self.myRecording.text = text
            } else {
                //print("In progress: \(text)")
            }
        } errorHandler: { (error) in
            
        }

    }
    
    
    
    func recording(text: String?, final: Bool?, error: Error?) {
        
    }


}

