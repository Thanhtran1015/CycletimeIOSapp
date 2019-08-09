//
//  CycleTime5ViewController.swift
//  SHC Cycle Time
//
//  Created by Mac on 7/18/19.
//  Copyright © 2019 Mac Project PC. All rights reserved.
//

import UIKit
import SwiftChart

class CycleTime5ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var timer: Timer!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(showLineChart), userInfo: nil, repeats: true)
    }
    
    
    @objc func showLineChart() {
        
        chart.yLabels = [0.0,5.0,10.0,20.0,50.0]
        chart.yLabelsOnRightSide = false
        chart.xLabels = [0,1,2,3,4,5,6,7,8,9]
        chart.xLabelsSkipLast = false
        chart.xLabelsFormatter = { cycleTime.cTCollection[Int(round($1))].c }
        chart.xLabelsOrientation = .vertical
    
        var i = 0
        while (i < 10) {
            print(cycleTime.cTCollection[i].d)
            i = i + 1
        }
      
        
        let series = ChartSeries([cycleTime.cTCollection[0].d,cycleTime.cTCollection[1].d,cycleTime.cTCollection[2].d,cycleTime.cTCollection[3].d,cycleTime.cTCollection[4].d,cycleTime.cTCollection[5].d,cycleTime.cTCollection[6].d,cycleTime.cTCollection[7].d,cycleTime.cTCollection[8].d,cycleTime.cTCollection[9].d])
        // ,ct6,ct7,ct8,ct9,ct10
        series.color = ChartColors.blueColor()
        
        //let series = ChartSeries([0,1,2,-3,2,-4,6])
        chart.removeAllSeries()
        chart.add(series)
        //        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    @IBOutlet weak var chart: Chart!
    
}
