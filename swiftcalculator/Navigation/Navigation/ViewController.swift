//
//  ViewController.swift
//  Navigation
//
//  Created by 1234 on 2017. 8. 25..
//  Copyright (c) 2017년 1234. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var edit1: UITextField!

    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var btn0: UIButton!
    @IBOutlet weak var btnplus: UIButton!
    @IBOutlet weak var btnminus: UIButton!
    @IBOutlet weak var btnx: UIButton!
    @IBOutlet weak var btnclear: UIButton!
    var num1:Int = 0
    var num2:Int = 0
    var numoper:Int = 0
    var oper : Bool = false
    
   
    
    
    //각 버튼 클릭 리스너
    @IBAction func btnclick(sender: UIButton) {
        if sender == btn1{
            setText(1)
        }else if sender == btn2{
            setText(2)
        }else if sender == btn3{
            setText(3)
        }else if sender == btn4{
            setText(4)
        }else if sender == btn5{
            setText(5)
        }else if sender == btn6{
            setText(6)
        }else if sender == btn7{
            setText(7)
        }else if sender == btn8{
            setText(8)
        }else if sender == btn9{
            setText(9)
        }else if sender == btn0{
            setText(0)
        }else if sender == btnplus{
            //계산 중이면 계산 처리 아니면 값 저장
            if numoper == 0
            {
                getnum1()
            }else
            {
                setResult()
            }
            numoper = 1
            oper = true
        }else if sender == btnminus{
            //계산 중이면 계산 처리 아니면 값 저장
            if numoper == 0
            {
                getnum1()
                
            }else
            {
                setResult()
            }
            numoper = 2
            oper = true
        }else if sender == btnx{
            setResult();
        }else if sender == btnclear{
            //clear()
            var strText : String = edit1.text
            checkout(strText);
        }
    }
    func setResult(){
        //두번째 값 저장 후
        getnum2()
        //더하기 계산 일경우 계산
        if(numoper == 1){
            var sum = num1 + num2
            edit1.text = "\(sum)"
        }
        //빼기 계산
        else if(numoper == 2){
            var minus = num1 - num2
            edit1.text = "\(minus)"
        }
        //마지막 입력값 변경
        num2 = num1;
        //numoper = 0
    }
    
    func getnum1(){
        
        var text : String = edit1.text
        if let num = text.toInt(){
            num1 = num;
        }
        edit1.text = "";
        
    }
    
    func getnum2(){
        var text : String = edit1.text
        if let num = text.toInt(){
            num2 = num;
        }
       // edit1.text = "";
    }
    func checkout(var num:String) -> Bool{
        print("xxx"+num)
        return false
    }
    
    
    func sum(){
        var text : String = edit1.text
        var num : Int = 0
        if let num2 = text.toInt()
        {
            num = num2 * 10
        }
        edit1.text = "\(num)"
    }
    func setText(var num:Int){
        if oper == false
        {
            var text : String = edit1.text
            if(num == 0){
                
                if text == "" || text == "0"
                {
                    edit1.text = "0"
                }else
                {
                    edit1.text = edit1.text + "\(num)";
                }
            }else{
                if text == "0"
                {
                    edit1.text = "\(num)";
                }
                else
                {
                    edit1.text = edit1.text + "\(num)";
                }
            }
        }
        else
        {
            getnum1()
            edit1.text = "\(num)"
            oper =  false
        }
    }
    func clear(){
        oper =  false
        numoper = 0
        num1 = 0
        num2 = 0
        edit1.text = ""
    }
}

