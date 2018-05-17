使用責任鏈模式(Chain of Responsibility) 實作 ManageAttributedString



=============
![alt tag](http://i.imgur.com/le5K6ZA.png) 

Usage
=============
### append "Hello" string

    NSMutableAttributedString *mutableString = [NSMutableAttributedString new];
    mutableString.append(@"Hello");

#### append "Hello" string, fontName HelveticaNeue, size 10
    UIFont *helveticaNeue10 = [UIFont fontWithName:@"HelveticaNeue" size:10];
    NSMutableAttributedString *mutableString = [NSMutableAttributedString new];
    mutableString.append(@"Hello".font(helveticaNeue10));

#### append "Hello One" and "Hello Two"
    NSMutableAttributedString *mutableString = [NSMutableAttributedString new];
    mutableString.append(@"Hello One"));
    mutableString.append(@"Hello Two"));
  
    //the same below
    NSMutableAttributedString *mutableString = [NSMutableAttributedString new];
    mutableString.append(@"Hello One").append(@"Hello Two");

#### scope
    // clear previous mutableString
    // mutableString.clear() = mutableString setString:@"" 
    mutableString.clear()
    .append(@"Label2  ")
    .append(@"Yooooooo  ".color([UIColor redColor]))
    .append(@"Nooooooo");
  ![alt tag](http://i.imgur.com/22ztLfa.png) 
  
    mutableString.clear()
    .append(@"Label2  ")
    .append(@"Yooooooo  ").color([UIColor redColor])
    .append(@"Nooooooo");
  ![alt tag](http://i.imgur.com/eZTBFGI.png) 
  
    mutableString.clear()
    .append(@"Label3  ")
    .append(@"Yooooooo  ")
    .append(@"Nooooooo")
    .color([UIColor redColor]);
  ![alt tag](http://i.imgur.com/4AHWlHC.png) 
