//
//  ViewController.swift
//  tictactoe
//
//  Created by Jana on 1/28/23.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var button1: NSButton!
    @IBOutlet weak var button2: NSButton!
    @IBOutlet weak var button3: NSButton!
    
    @IBOutlet weak var button4: NSButton!
    @IBOutlet weak var button5: NSButton!
    @IBOutlet weak var button6: NSButton!
    
    @IBOutlet weak var button7: NSButton!
    @IBOutlet weak var button8: NSButton!
    @IBOutlet weak var button9: NSButton!
    
    var buttons: Array<NSButton> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        buttons = [
            button1, button2, button3, button4, button5, button6, button7, button8, button9
        ]
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    
    func winDialog(closing_text: String) -> Bool {
        let alert = NSAlert()
        alert.messageText = closing_text
        alert.alertStyle = .warning
        alert.addButton(withTitle: "Play Again")
        alert.addButton(withTitle: "Exit")
        alert.icon = nil
        return alert.runModal() == .alertFirstButtonReturn
    }
    
    func closeApp() {
        NSApplication.shared.terminate(self)
    }
    
   
    func didWin(who: String) -> Bool {
       for i in [0, 3, 6] {
           if buttons[i + 0].title == who && buttons[i + 1].title == who && buttons[i + 2].title == who {
               return true
           }
       }
       for i in [0, 1, 2] {
           if buttons[i + 0].title == who && buttons[i + 3].title == who && buttons[i + 6].title == who {
               return true
           }
       }
       if buttons[0].title == who && buttons[4].title == who && buttons[8].title == who {
           return true
       }
       if buttons[2].title == who && buttons[4].title == who && buttons[6].title == who {
           return true
       }
       return false
   }
    
    /// This function runs when a button is clicked on by the user
    /// - Parameter button: A reference to the button (i.e. button1, button2 etc) that the user clicked on
    @IBAction func onButtonClick(_ button: NSButton) {
        button.title = "X"
        button.isEnabled = false
        
        for button in buttons {
            if button.title == "" {
                button.title = "O"
                button.isEnabled = false
                break
            }
        }
        
        func playAgain() {
            for button in buttons {
                if button.title == "X" || button.title == "O" {
                    button.title = ""
                    button.isEnabled = true
                }
            }
        }
        
        if didWin(who: "X") {
            let shouldPlayAgain = winDialog(closing_text: "You won!")
            if shouldPlayAgain == false {
                closeApp()
            } else {
                playAgain()
            }
        } else if didWin(who: "O") {
            let shouldPlayAgain = winDialog(closing_text: "You lost!")
            if shouldPlayAgain == false {
                closeApp()
            } else {
                playAgain()
            }
        }
        
    }
    
}
