//
//  CycleTime6ViewController.swift
//  SHC Cycle Time
//
//  Created by Mac on 7/18/19.
//  Copyright © 2019 Mac Project PC. All rights reserved.
//

import UIKit
import SwiftChart

class CycleTime6ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        showLineChart()
    }
    
    func showLineChart() {
        
        
        //        let screenWidth = UIScreen.main.bounds.width
        //        let chart = Chart(frame: CGRect(x: 10, y: 10, width: screenWidth - 20, height: (screenWidth - 20) / 2))
        
        //        let series = ChartSeries([cycleTimes[cycleTimes.count-4].realCT, cycleTimes[cycleTimes.count-3].realCT, cycleTimes[cycleTimes.count-2].realCT, cycleTimes[cycleTimes.count-1].realCT])
        //        if (cycleTimes.count < 4) {
        //            warningLabel.text = "Not enough data to show chart"
        //        }
        //        else {
//        var ct4 = tempRealCT[0]
//        var ct3 = tempRealCT[1]
//        var ct2 = tempRealCT[2]
//        var ct1 = tempRealCT[3]
//        var series = ChartSeries([ct4,ct3,ct2,ct1])
        chart.xLabelsSkipLast = false
        chart.yLabels = [0.0,2.0,4.0,6.0,10.0,20.0]
        chart.yLabelsOnRightSide = false
        
        let series = ChartSeries([5,8,6,6])
        series.color = ChartColors.greenColor()
        
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
