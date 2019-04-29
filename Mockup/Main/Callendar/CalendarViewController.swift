//
//  CalendarViewController.swift
//  Mockup
//
//  Created by Jesse Joseph on 27/04/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIStackView!
    
    @IBOutlet weak var calendarCollection: UICollectionView!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var addSchedule: UIButton!
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var personNameLabel: UILabel!
    @IBOutlet weak var sessionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var switchSegment: UISegmentedControl!
    @IBOutlet weak var scheduleView: UIView!
    
    @IBOutlet var containerView: UIView!
    
    let months = ["January","February","March","April","May","June","July","August","September","October","November","December"]
    let weekdays = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
    let dayInMonths = [31,28,31,30,31,30,31,31,30,31,30,31]
    
    var currentMonth=String()
    
    var numberOfEmptyBox = Int() //Number of empty box at the start of the current month
    var nextNumberOfEmptyBox = Int() //Number of empty box at the start of next mobnth
    var prevNumberOfEmptyBox = 0 // Number of empty boxes for the previous month
    var direction = 0 //0 if its current month, 1 if its future month, -1 if its past month
    var positionIndex = 0 //Stores above var of empty boxes
    var dayCounter = 0
    
    override func viewDidLoad() {
        calendarCollection.delegate = self
        calendarCollection.dataSource = self
        super.viewDidLoad()
        
        currentMonth = months[month]
        monthLabel.text = "\(currentMonth) \(year)"
        
        if weekday == 0{
            weekday = 7
        }
        
        getStartDateDayPosition()
        scheduleView.isHidden = true
        addSchedule.layer.cornerRadius = addSchedule.frame.height * 0.50
        
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
        self.scheduleView.addGestureRecognizer(gesture)

    }
    
    
    @objc func checkAction(sender : UITapGestureRecognizer) {
        // Do what you want
        print("scheduleView")
    }
    
    
    @IBAction func nextButtonTap(_ sender: Any) {
        switch currentMonth{
        case "December":
            month=0
            year += 1
            direction = 1
            
            getStartDateDayPosition()
            
            currentMonth = months[month]
            monthLabel.text = "\(currentMonth) \(year)"
            calendarCollection.reloadData()
            
        default:
            direction = 1
            
            getStartDateDayPosition()
            
            month += 1
            currentMonth = months[month]
            monthLabel.text = "\(currentMonth) \(year)"
            calendarCollection.reloadData()
        }
    }
    

    
    @IBAction func prevButtonTap(_ sender: Any) {
        switch currentMonth {
        case "January":
            month = 11
            year -= 1
            direction = -1
            
            getStartDateDayPosition()
            
            currentMonth = months[month]
            monthLabel.text = "\(currentMonth) \(year)"
            calendarCollection.reloadData()
            
        default:
            month -= 1
            direction = -1
            
            getStartDateDayPosition()
            
            currentMonth = months[month]
            monthLabel.text = "\(currentMonth) \(year)"
            calendarCollection.reloadData()
        }
    }
    
    func getStartDateDayPosition(){
        switch direction {
        case 0:
            numberOfEmptyBox = weekday
            dayCounter = day
            
            while dayCounter>0{
                numberOfEmptyBox -= 1
                dayCounter -= 1
                if numberOfEmptyBox == 7{
                    numberOfEmptyBox = 0
                }
            }
            
            positionIndex = numberOfEmptyBox
            
        case 1...:
            numberOfEmptyBox=(positionIndex+dayInMonths[month])%7
            positionIndex = nextNumberOfEmptyBox
            
        case -1:
            prevNumberOfEmptyBox = (7-((dayInMonths[month])-positionIndex)%7)
            if prevNumberOfEmptyBox == 7{
                prevNumberOfEmptyBox = 0
            }
            positionIndex = prevNumberOfEmptyBox
        default:
            fatalError()
        }
    }
    
    
    @IBAction func switchedSegment(_ sender: UISegmentedControl) {
        if switchSegment.selectedSegmentIndex == 0{
            scheduleView.isHidden = true
            containerView.isHidden = false
            view1.isHidden = false
            view2.isHidden = false
            calendarCollection.isHidden = false
            addSchedule.isHidden = false
            
        }else{
            scheduleView.isHidden = false
            containerView.isHidden = true
            view1.isHidden = true
            view2.isHidden = true
            calendarCollection.isHidden = true
            addSchedule.isHidden = true


        }
    }
    
}

extension CalendarViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch direction {
        case 0:
            return dayInMonths[month] + numberOfEmptyBox
        case 1...:
            return dayInMonths[month] + nextNumberOfEmptyBox
        case -1:
            return dayInMonths[month] + prevNumberOfEmptyBox
        default:
            fatalError()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "calendar", for: indexPath) as! CalendarCollectionViewCell
        cell.backgroundColor = UIColor.clear
        cell.dateLabel.textColor = UIColor.black
        
        if cell.isHidden == true{
            cell.isHidden = false
        }
        
        switch direction {
        case 0:
            cell.dateLabel.text = "\(indexPath.row + 1-numberOfEmptyBox)"
        case 1:
            cell.dateLabel.text = "\(indexPath.row + 1-nextNumberOfEmptyBox)"
        case -1:
            cell.dateLabel.text = "\(indexPath.row + 1-prevNumberOfEmptyBox)"
        default:
            fatalError()
        }
        
        if Int(cell.dateLabel.text!)!<1{
            cell.isHidden = true
        }
        
        switch indexPath.row{
        case 5,6,12,13,19,20,26,27,33,34:
            if Int(cell.dateLabel.text!)! > 0{
                cell.dateLabel.textColor = UIColor.lightGray
            }
            
        default:
            break
        }
        
        if currentMonth == months[calendar.component(.month, from: date)-1] && year == calendar.component(.year, from: date) && indexPath.row+1 == day{
            cell.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.6117647059, blue: 1, alpha: 1)
            cell.dateLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
        
        return cell
    }
    
}
