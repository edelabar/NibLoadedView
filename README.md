NibLoadedView
=============

Swift UIView subclass that loads itself from a companion NIB for widget development.

This is a Swift port of the technique covered in [An Update on Nested Nib Loading](http://blog.yangmeyer.de/blog/2012/07/09/an-update-on-nested-nib-loading/) by [Yang Meyer (@yangmeyer)](https://github.com/yangmeyer).  

If your class extends this class, you can set a UIView in a Storyboard or Nib file with your custom class and it will load a similarly named ```.xib``` file.  For example, if you build ```MyView.xib``` and ```MyView.swift```, set the custom class in Interface Builder to ```MyView.swift``` and it will load the NIB at runtime.

As a bonus, with Xcode 6, if you make your subclass ```@IBDesignable``` the view will render in Interface Builder!

For a working example, see [edelabar/AutoLayoutTester](https://github.com/edelabar/AutoLayoutTester).  There's a more in-depth article coming soon.

## Thanks

This project uses ```nameOfClass.swift``` from [indieSoftware/INSwift](https://github.com/indieSoftware/INSwift), thanks to [Sven Korset](http://www.indie-software.de/) for sharing, and of course, thanks to Yang Meyer for writing his original article.
