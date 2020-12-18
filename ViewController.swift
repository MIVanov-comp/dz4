//
//  ViewController.swift
//  dz4
//
//  Created by Apple iMac 27 on 08.12.2020.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


class SecondViewController: UIViewController{
   
    @IBOutlet weak var myLabel: UILabel!
    
    @IBAction func letsOpenThisPage(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "123") as! OpenNewPage
        vc.newText = myLabel.text!
        navigationController?.pushViewController(vc, animated: true)
   
    }
    
    
}



class OpenNewPage: UIViewController{

    @IBOutlet weak var mynewLabel: UILabel!
    var newText: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        UIView.transition(with: mynewLabel, duration: 0.25, options: .transitionCrossDissolve, animations: nil, completion: nil)
        updateText(newText: newText)
     
    }
    
    func updateText(newText: String){
        self.mynewLabel.text = newText
    }
}


class AnimationController:
    UIViewController{
    
    @IBOutlet weak var viewForAnimate: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func animateThis(_ sender: Any) {
        let start = viewForAnimate.center
        
        UIView.animateKeyframes(withDuration: 1.3, delay: 0, options: .calculationModeLinear){
            [self] in
            
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.3){
                viewForAnimate.center = CGPoint(x: start.x-100, y: start.y)
                
            }
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.3 ){
                viewForAnimate.center = CGPoint(x: start.x-100, y: start.y+100)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.3 ){
                viewForAnimate.center = CGPoint(x: start.x, y: start.y+100)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.9, relativeDuration: 0.3 ){
                viewForAnimate.center = start
            }
        
        }
    
        
    }
    
}
class AnimationsonViews: UIViewController{
    var leftPoint: CGFloat = 0
    var changedColor: Bool = false
    
    @IBOutlet weak var leftViewConstraint: NSLayoutConstraint!
    @IBOutlet var changeColorTap: UITapGestureRecognizer!
    @IBOutlet weak var changingView: UIView!
    @IBOutlet weak var lastView: UIView!
    @IBOutlet weak var firsttheView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet var tapControl: UITapGestureRecognizer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leftPoint = leftViewConstraint.constant
    }
    @IBAction func tapOnFirst(sender: UITapGestureRecognizer){
        UIView.transition(from: lastView, to: mainView, duration: 1, options: .transitionCurlUp, completion: nil)
    }
    
    @IBAction func tapToChange(_ sender: Any) {
        UIView.animate(withDuration: 1.5, animations: {
            if(self.changedColor){
                self.changingView.backgroundColor = .systemGreen
                self.leftViewConstraint.constant = self.leftPoint-30
                self.changedColor = !self.changedColor
            }
            else{
                self.changingView.backgroundColor = .systemPurple
                self.leftViewConstraint.constant = self.leftPoint
                self.changedColor = !self.changedColor
                
                
            }
            UIView.animate(withDuration: 3){
                self.view.layoutIfNeeded()
            }
            
            
        })
    }
    
    
}

