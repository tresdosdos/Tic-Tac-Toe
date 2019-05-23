//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Viachaslau on 5/23/19.
//  Copyright © 2019 tresdosdos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var playAgain: UIButton!
    
    var playerTurn = 1 // Cross
    var state = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var combinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var isActive = true
    
    @IBAction func action(_ sender: AnyObject) {
        if (state[sender.tag - 1] != 0 || isActive == false) {
            return
        }
        
        state[sender.tag - 1] = playerTurn
        
        if (playerTurn == 1) {
            sender.setImage(UIImage(named: "Cross.png"), for: UIControl.State())
            playerTurn = 2
        } else {
            sender.setImage(UIImage(named: "Nought.png"), for: UIControl.State())
            playerTurn = 1
        }
        
        for comb in combinations {
            if (state[comb[0]] != 0 && state[comb[0]] == state[comb[1]] && state[comb[1]] == state[comb[2]]) {
                isActive = false
                
                if (state[comb[0]] == 1) {
                    label.text = "Cross won"
                } else {
                    label.text = "Null won"
                }
                
                label.isHidden = false
                playAgain.isHidden = false
            }
        }
        
        isActive = false
        
        for i in state {
            if (i == 0) {
                isActive = true
                break
            }
        }
        
        if (isActive == false) {
            label.text = "Draw"
            label.isHidden = false
            playAgain.isHidden = false
        }
    }
    @IBAction func again(_ sender: Any) {
        isActive = true
        state = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        playerTurn = 1
        playAgain.isHidden = true
        label.isHidden = true
        
        for i in 1...9 {
            var button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

