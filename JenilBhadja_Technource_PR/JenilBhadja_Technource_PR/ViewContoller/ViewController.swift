//
//  ViewController.swift
//  JenilBhadja_Technource_PR
//
//  Created by JENIL BHADJA on 28/05/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    
    var arrBtn: [UIButton] = []
    var currentBlueButtonTag: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Jenil_Technource_PR"
        arrBtn = [btn1, btn2, btn3, btn4, btn5, btn6, btn7, btn8, btn9]
        setRandomButtonBlue()
    }
    
    @IBAction func onClickBtn(_ sender: UIButton) {
        if sender.tag == currentBlueButtonTag {
            sender.backgroundColor = .black
            if allButtonsAreBlack() {
                navigateToNextScreen()
            } else {
                setRandomButtonBlue()
            }
        }
    }
    //MARK: Helping func
    func setRandomButtonBlue() {
        let remainingButtons = arrBtn.filter { $0.backgroundColor != .black }
        if remainingButtons.isEmpty {
            return
        }
        let randomButton = remainingButtons.randomElement()!
        randomButton.backgroundColor = .blue
        currentBlueButtonTag = randomButton.tag
    }
    
    func allButtonsAreBlack() -> Bool {
        return arrBtn.allSatisfy { $0.backgroundColor == .black }
    }
    
    func navigateToNextScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let mapVC = storyboard.instantiateViewController(withIdentifier: "MapViewController") as? MapViewController {
            self.navigationController?.pushViewController(mapVC, animated: true)
        }
    }
}
