//
//  CustomView.swift
//
//  Code generated using QuartzCode 1.55.0 on 3/10/17.
//  AppsCreationTech
//

import UIKit

@IBDesignable
class CustomView: UIView, CAAnimationDelegate {
    
    var updateLayerValueForCompletedAnimation : Bool = false
    var animationAdded : Bool = false
    var completionBlocks : Dictionary<CAAnimation, (Bool) -> Void> = [:]
    var layers : Dictionary<String, AnyObject> = [:]
    
    
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupProperties()
        setupLayers()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setupProperties()
        setupLayers()
    }
    
    var untitled1AnimProgress: CGFloat = 0{
        didSet{
            if(!self.animationAdded){
                removeAllAnimations()
                addUntitled1Animation()
                self.animationAdded = true
                layer.speed = 0
                layer.timeOffset = 0
            }
            else{
                let totalDuration : CGFloat = 2.01
                let offset = untitled1AnimProgress * totalDuration
                layer.timeOffset = CFTimeInterval(offset)
            }
        }
    }
    
    func setupProperties(){
        
    }
    
    func setupLayers(){
        let oval = CAShapeLayer()
        oval.frame = CGRect(x: 214, y: 321.25, width: 25, height: 25)
        oval.path = ovalPath().cgPath
        self.layer.addSublayer(oval)
        layers["oval"] = oval
        
        let oval2 = CAShapeLayer()
        oval2.frame = CGRect(x: 188, y: 321.25, width: 25, height: 25)
        oval2.path = oval2Path().cgPath
        self.layer.addSublayer(oval2)
        layers["oval2"] = oval2
        
        let oval3 = CAShapeLayer()
        oval3.frame = CGRect(x: 162, y: 320.75, width: 25, height: 25)
        oval3.path = oval3Path().cgPath
        self.layer.addSublayer(oval3)
        layers["oval3"] = oval3
        
        let oval4 = CAShapeLayer()
        oval4.frame = CGRect(x: 136, y: 320.75, width: 25, height: 25)
        oval4.path = oval4Path().cgPath
        self.layer.addSublayer(oval4)
        layers["oval4"] = oval4
        
        let oval5 = CAShapeLayer()
        oval5.frame = CGRect(x: 110, y: 320.75, width: 25, height: 25)
        oval5.path = oval5Path().cgPath
        self.layer.addSublayer(oval5)
        layers["oval5"] = oval5
        
        let oval6 = CAShapeLayer()
        oval6.frame = CGRect(x: 240, y: 320.75, width: 25, height: 25)
        oval6.path = oval6Path().cgPath
        self.layer.addSublayer(oval6)
        layers["oval6"] = oval6
        
        resetLayerProperties(forLayerIdentifiers: nil)
    }
    
    func resetLayerProperties(forLayerIdentifiers layerIds: [String]!){
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        
        if layerIds == nil || layerIds.contains("oval"){
            let oval = layers["oval"] as! CAShapeLayer
            oval.fillColor   = UIColor.black.cgColor
            oval.strokeColor = UIColor.black.cgColor
        }
        if layerIds == nil || layerIds.contains("oval2"){
            let oval2 = layers["oval2"] as! CAShapeLayer
            oval2.fillColor   = UIColor.black.cgColor
            oval2.strokeColor = UIColor.black.cgColor
        }
        if layerIds == nil || layerIds.contains("oval3"){
            let oval3 = layers["oval3"] as! CAShapeLayer
            oval3.fillColor   = UIColor.black.cgColor
            oval3.strokeColor = UIColor.black.cgColor
        }
        if layerIds == nil || layerIds.contains("oval4"){
            let oval4 = layers["oval4"] as! CAShapeLayer
            oval4.fillColor   = UIColor.black.cgColor
            oval4.strokeColor = UIColor.black.cgColor
        }
        if layerIds == nil || layerIds.contains("oval5"){
            let oval5 = layers["oval5"] as! CAShapeLayer
            oval5.fillColor   = UIColor.black.cgColor
            oval5.strokeColor = UIColor.black.cgColor
        }
        if layerIds == nil || layerIds.contains("oval6"){
            let oval6 = layers["oval6"] as! CAShapeLayer
            oval6.fillColor   = UIColor.black.cgColor
            oval6.strokeColor = UIColor.black.cgColor
        }
        
        CATransaction.commit()
    }
    
    //MARK: - Animation Setup
    
    func addUntitled1Animation(totalDuration: CFTimeInterval = 2.007, completionBlock: ((_ finished: Bool) -> Void)? = nil){
        if completionBlock != nil{
            let completionAnim = CABasicAnimation(keyPath:"completionAnim")
            completionAnim.duration = totalDuration
            completionAnim.delegate = self
            completionAnim.setValue("Untitled1", forKey:"animId")
            completionAnim.setValue(false, forKey:"needEndAnim")
            layer.add(completionAnim, forKey:"Untitled1")
            if let anim = layer.animation(forKey: "Untitled1"){
                completionBlocks[anim] = completionBlock
            }
        }
        
        self.layer.speed = 2
        self.animationAdded = false
        
        let fillMode : String = kCAFillModeForwards
        
        ////Oval animation
        let ovalTransformAnim       = CAKeyframeAnimation(keyPath:"transform")
        ovalTransformAnim.values    = [NSValue(caTransform3D: CATransform3DIdentity),
                                       NSValue(caTransform3D: CATransform3DIdentity)]
        ovalTransformAnim.keyTimes  = [0, 1]
        ovalTransformAnim.duration  = 0.167 * totalDuration
        ovalTransformAnim.beginTime = 0.667 * totalDuration
        
        let ovalOpacityAnim       = CAKeyframeAnimation(keyPath:"opacity")
        ovalOpacityAnim.values    = [1, 0.1]
        ovalOpacityAnim.keyTimes  = [0, 1]
        ovalOpacityAnim.duration  = 0.167 * totalDuration
        ovalOpacityAnim.beginTime = 0.667 * totalDuration
        
        let ovalUntitled1Anim : CAAnimationGroup = QCMethod.group(animations: [ovalTransformAnim, ovalOpacityAnim], fillMode:fillMode)
        layers["oval"]?.add(ovalUntitled1Anim, forKey:"ovalUntitled1Anim")
        
        ////Oval2 animation
        let oval2TransformAnim       = CAKeyframeAnimation(keyPath:"transform")
        oval2TransformAnim.values    = [NSValue(caTransform3D: CATransform3DIdentity),
                                        NSValue(caTransform3D: CATransform3DIdentity)]
        oval2TransformAnim.keyTimes  = [0, 1]
        oval2TransformAnim.duration  = 0.167 * totalDuration
        oval2TransformAnim.beginTime = 0.5 * totalDuration
        
        let oval2OpacityAnim       = CAKeyframeAnimation(keyPath:"opacity")
        oval2OpacityAnim.values    = [1, 0.1]
        oval2OpacityAnim.keyTimes  = [0, 1]
        oval2OpacityAnim.duration  = 0.167 * totalDuration
        oval2OpacityAnim.beginTime = 0.5 * totalDuration
        
        let oval2Untitled1Anim : CAAnimationGroup = QCMethod.group(animations: [oval2TransformAnim, oval2OpacityAnim], fillMode:fillMode)
        layers["oval2"]?.add(oval2Untitled1Anim, forKey:"oval2Untitled1Anim")
        
        ////Oval3 animation
        let oval3TransformAnim       = CAKeyframeAnimation(keyPath:"transform")
        oval3TransformAnim.values    = [NSValue(caTransform3D: CATransform3DIdentity),
                                        NSValue(caTransform3D: CATransform3DIdentity)]
        oval3TransformAnim.keyTimes  = [0, 1]
        oval3TransformAnim.duration  = 0.167 * totalDuration
        oval3TransformAnim.beginTime = 0.334 * totalDuration
        
        let oval3OpacityAnim       = CAKeyframeAnimation(keyPath:"opacity")
        oval3OpacityAnim.values    = [1, 0.1]
        oval3OpacityAnim.keyTimes  = [0, 1]
        oval3OpacityAnim.duration  = 0.167 * totalDuration
        oval3OpacityAnim.beginTime = 0.333 * totalDuration
        
        let oval3Untitled1Anim : CAAnimationGroup = QCMethod.group(animations: [oval3TransformAnim, oval3OpacityAnim], fillMode:fillMode)
        layers["oval3"]?.add(oval3Untitled1Anim, forKey:"oval3Untitled1Anim")
        
        ////Oval4 animation
        let oval4TransformAnim       = CAKeyframeAnimation(keyPath:"transform")
        oval4TransformAnim.values    = [NSValue(caTransform3D: CATransform3DIdentity),
                                        NSValue(caTransform3D: CATransform3DIdentity)]
        oval4TransformAnim.keyTimes  = [0, 1]
        oval4TransformAnim.duration  = 0.167 * totalDuration
        oval4TransformAnim.beginTime = 0.167 * totalDuration
        
        let oval4OpacityAnim       = CAKeyframeAnimation(keyPath:"opacity")
        oval4OpacityAnim.values    = [1, 0.1]
        oval4OpacityAnim.keyTimes  = [0, 1]
        oval4OpacityAnim.duration  = 0.167 * totalDuration
        oval4OpacityAnim.beginTime = 0.167 * totalDuration
        
        let oval4Untitled1Anim : CAAnimationGroup = QCMethod.group(animations: [oval4TransformAnim, oval4OpacityAnim], fillMode:fillMode)
        layers["oval4"]?.add(oval4Untitled1Anim, forKey:"oval4Untitled1Anim")
        
        ////Oval5 animation
        let oval5TransformAnim      = CAKeyframeAnimation(keyPath:"transform")
        oval5TransformAnim.values   = [NSValue(caTransform3D: CATransform3DIdentity),
                                       NSValue(caTransform3D: CATransform3DIdentity)]
        oval5TransformAnim.keyTimes = [0, 1]
        oval5TransformAnim.duration = 0.167 * totalDuration
        
        let oval5OpacityAnim      = CAKeyframeAnimation(keyPath:"opacity")
        oval5OpacityAnim.values   = [1, 0.1]
        oval5OpacityAnim.keyTimes = [0, 1]
        oval5OpacityAnim.duration = 0.167 * totalDuration
        
        let oval5Untitled1Anim : CAAnimationGroup = QCMethod.group(animations: [oval5TransformAnim, oval5OpacityAnim], fillMode:fillMode)
        layers["oval5"]?.add(oval5Untitled1Anim, forKey:"oval5Untitled1Anim")
        
        ////Oval6 animation
        let oval6TransformAnim       = CAKeyframeAnimation(keyPath:"transform")
        oval6TransformAnim.values    = [NSValue(caTransform3D: CATransform3DIdentity),
                                        NSValue(caTransform3D: CATransform3DIdentity)]
        oval6TransformAnim.keyTimes  = [0, 1]
        oval6TransformAnim.duration  = 0.167 * totalDuration
        oval6TransformAnim.beginTime = 0.833 * totalDuration
        
        let oval6OpacityAnim       = CAKeyframeAnimation(keyPath:"opacity")
        oval6OpacityAnim.values    = [1, 0.1]
        oval6OpacityAnim.keyTimes  = [0, 1]
        oval6OpacityAnim.duration  = 0.167 * totalDuration
        oval6OpacityAnim.beginTime = 0.833 * totalDuration
        
        let oval6Untitled1Anim : CAAnimationGroup = QCMethod.group(animations: [oval6TransformAnim, oval6OpacityAnim], fillMode:fillMode)
        layers["oval6"]?.add(oval6Untitled1Anim, forKey:"oval6Untitled1Anim")
    }
    
    //MARK: - Animation Cleanup
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool){
        if let completionBlock = completionBlocks[anim]{
            completionBlocks.removeValue(forKey: anim)
            if (flag && updateLayerValueForCompletedAnimation) || anim.value(forKey: "needEndAnim") as! Bool{
                updateLayerValues(forAnimationId: anim.value(forKey: "animId") as! String)
                removeAnimations(forAnimationId: anim.value(forKey: "animId") as! String)
            }
            completionBlock(flag)
        }
    }
    
    func updateLayerValues(forAnimationId identifier: String){
        if identifier == "Untitled1"{
            QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["oval"] as! CALayer).animation(forKey: "ovalUntitled1Anim"), theLayer:(layers["oval"] as! CALayer))
            QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["oval2"] as! CALayer).animation(forKey: "oval2Untitled1Anim"), theLayer:(layers["oval2"] as! CALayer))
            QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["oval3"] as! CALayer).animation(forKey: "oval3Untitled1Anim"), theLayer:(layers["oval3"] as! CALayer))
            QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["oval4"] as! CALayer).animation(forKey: "oval4Untitled1Anim"), theLayer:(layers["oval4"] as! CALayer))
            QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["oval5"] as! CALayer).animation(forKey: "oval5Untitled1Anim"), theLayer:(layers["oval5"] as! CALayer))
            QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["oval6"] as! CALayer).animation(forKey: "oval6Untitled1Anim"), theLayer:(layers["oval6"] as! CALayer))
        }
    }
    
    func removeAnimations(forAnimationId identifier: String){
        if identifier == "Untitled1"{
            (layers["oval"] as! CALayer).removeAnimation(forKey: "ovalUntitled1Anim")
            (layers["oval2"] as! CALayer).removeAnimation(forKey: "oval2Untitled1Anim")
            (layers["oval3"] as! CALayer).removeAnimation(forKey: "oval3Untitled1Anim")
            (layers["oval4"] as! CALayer).removeAnimation(forKey: "oval4Untitled1Anim")
            (layers["oval5"] as! CALayer).removeAnimation(forKey: "oval5Untitled1Anim")
            (layers["oval6"] as! CALayer).removeAnimation(forKey: "oval6Untitled1Anim")
        }
        self.layer.speed = 2
    }
    
    func removeAllAnimations(){
        for layer in layers.values{
            (layer as! CALayer).removeAllAnimations()
        }
        self.layer.speed = 1
    }
    
    //MARK: - Bezier Path
    
    func ovalPath() -> UIBezierPath{
        let ovalPath = UIBezierPath(ovalIn:CGRect(x: 0, y: 0, width: 25, height: 25))
        return ovalPath
    }
    
    func oval2Path() -> UIBezierPath{
        let oval2Path = UIBezierPath(ovalIn:CGRect(x: 0, y: 0, width: 25, height: 25))
        return oval2Path
    }
    
    func oval3Path() -> UIBezierPath{
        let oval3Path = UIBezierPath(ovalIn:CGRect(x: 0, y: 0, width: 25, height: 25))
        return oval3Path
    }
    
    func oval4Path() -> UIBezierPath{
        let oval4Path = UIBezierPath(ovalIn:CGRect(x: 0, y: 0, width: 25, height: 25))
        return oval4Path
    }
    
    func oval5Path() -> UIBezierPath{
        let oval5Path = UIBezierPath(ovalIn:CGRect(x: 0, y: 0, width: 25, height: 25))
        return oval5Path
    }
    
    func oval6Path() -> UIBezierPath{
        let oval6Path = UIBezierPath(ovalIn:CGRect(x: 0, y: 0, width: 25, height: 25))
        return oval6Path
    }
    
    
}
