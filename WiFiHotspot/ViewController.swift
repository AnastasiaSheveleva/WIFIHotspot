//
//  ViewController.swift
//  WiFiHotspot
//
//  Created by Анастасия on 11.01.2018.
//  Copyright © 2018 Anastasia. All rights reserved.
//

import UIKit
import NetworkExtension

class ViewController: UIViewController {

    @IBOutlet weak var inputField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func connectAction(_ sender: Any) {
        let hotspotConfig = NEHotspotConfiguration(ssid: inputField.text!, passphrase: "AFAF123456", isWEP: false)
        
        NEHotspotConfigurationManager.shared.apply(hotspotConfig) {[unowned self] (error) in
            
            if let error = error {
                //self.showError(error: error)
            }
            else {
                self.showSuccess()
            }
        }
    }
    
    @IBAction func disconnectAction(_ sender: Any) {
        NEHotspotConfigurationManager.shared.removeConfiguration(forSSID: inputField.text!)
    }
    
    private func showError(error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: "Darn", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    private func showSuccess() {
        let alert = UIAlertController(title: "", message: "Connected", preferredStyle: .alert)
        let action = UIAlertAction(title: "Cool", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }


}

