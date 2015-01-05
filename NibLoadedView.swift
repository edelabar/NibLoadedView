//
//  NibLoadedView.swift
//  Budget Sync
//
//  Created by Eric DeLabar on 8/2/14.
//  Copyright (c) 2014 Eric DeLabar. All rights reserved.
//

import UIKit

public class NibLoadedView: UIView {

    var secondRun: Bool = false
    
    public override func awakeAfterUsingCoder(aDecoder: NSCoder) -> AnyObject? {
        var isStoryboardPlaceholder: Bool = (self.subviews.count == 0);
        if (isStoryboardPlaceholder) {
            
            if let nibLoadedVersion: NibLoadedView = self.loadFromNib() {
                
                // pass properties through
                nibLoadedVersion.frame = self.frame;
                nibLoadedVersion.alpha = self.alpha;
                nibLoadedVersion.hidden = self.hidden;
                
                // make compatible with auto layout
                self.setTranslatesAutoresizingMaskIntoConstraints(false)
                nibLoadedVersion.setTranslatesAutoresizingMaskIntoConstraints(false)
                
                return nibLoadedVersion;
                
            }
        }
        return self;
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib();
        
        if (self.secondRun) {
            self.postNibLoadCallback();
        } else {
            self.secondRun = true;
        }
    }
    
    public func loadFromNib() -> NibLoadedView? {
        let classType = self.dynamicType;
        let packageAndNibName = nameOfClass(classType) as NSString;
        
        let range = packageAndNibName.rangeOfString(".", options: .BackwardsSearch)
        let nibName = packageAndNibName.substringFromIndex(range.location + 1)
        let elements = NSBundle(forClass:self.dynamicType).loadNibNamed(nibName, owner: nil, options: nil)
        
        for anObject in elements {
            if (anObject.isKindOfClass(self.dynamicType)) {
                return anObject as? NibLoadedView;
            }
        }
        
        return nil;
    }
    
    public func postNibLoadCallback() {
        
    }
    
    public override func prepareForInterfaceBuilder() {
        if let nibView = self.loadFromNib() {
            nibView.frame = self.bounds
            self.addSubview(nibView)
            self.setNeedsLayout()
        }
    }

}
