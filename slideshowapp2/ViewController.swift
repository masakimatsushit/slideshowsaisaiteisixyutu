//
//  ViewController.swift
//  slideshowapp2
//
//  Created by matsushitamasaki on 2021/09/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBAction func tap(_ sender: Any) {
        performSegue(withIdentifier: "toNext", sender: nil)
                if timer != nil{
                timer.invalidate()
                }
    }
    override func prepare(for segue:UIStoryboardSegue, sender: Any?) {
                let zoom:zoomViewController = segue.destination as! zoomViewController
            zoom.img = imageArray[nowIndex]!
          }
        
        
        var nowIndex:Int = 0
        
        var timer:Timer!
    
    let imageArray = [UIImage(named: "623C2F9E-DC51-43C4-B541-C92715A66BDD_4_5005_c.jpeg"),UIImage(named: "A4D8FCA6-4D27-4862-AE84-5855CD306280_4_5005_c.jpeg"),UIImage(named: "D607841F-5DA3-4C42-A26E-9DD395672F18.jpeg")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        img.image = imageArray[0]
    }

    @IBOutlet weak var Next: UIButton!
    
    @IBOutlet weak var Back: UIButton!
    
    @IBAction func naxt(_ sender: Any) {
        if nowIndex == 2 {
                  nowIndex = 0
              }else{
                  nowIndex += 1
              }
              img.image = imageArray[nowIndex]
    }
    
    @IBAction func back(_ sender: Any) {
        if nowIndex == 0 {
                    nowIndex = 2
                }else{
                    nowIndex -= 1
                }
                img.image = imageArray[nowIndex]
    }
    @IBAction func slideShowButton(_ sender: Any) {
        if timer == nil {
                   timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
                   Next.isEnabled = false
                   Back.isEnabled = false
                   startButton.setTitle("停止", for: .normal)
               }else{
                   timer.invalidate()
                   
                   timer = nil
                   Next.isEnabled = true
                   Back.isEnabled = true
                   startButton.setTitle("再生", for: .normal)
               }
    }
    @objc func changeImage(){
            
            if nowIndex == imageArray.count - 1  {
                nowIndex = 0
            }else{
                nowIndex += 1
            }
            img.image = imageArray[nowIndex]
        }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue){
        if timer != nil{
                    timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
                Next.isEnabled = false
                Back.isEnabled = false
        }
    }
}

