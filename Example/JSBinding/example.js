var screenBound = ScreenBounds()
var table = UITableViewWithRect(CGRect(0,0,screenBound.width,screenBound.height - 46))

var inputBar = UIView()
inputBar.setFrame(CGRect(0,screenBound.height - 46,screenBound.width,46))

var seprator = UIView()
seprator.setFrame(CGRect(0,0,screenBound.width,0.5))
seprator.setBackgroundColor(UIColor(0.6,0.6,0.6,1))
inputBar.addSubview(seprator)

var backgroundImageView = UIImageView()
backgroundImageView.setFrame(CGRect(47,9,screenBound.width - 36 * 2 - 38 - 9 * 2,29))
backgroundImageView.setImage(UIImageNamed("icon_input_text_bg").resizableImageWithJSBCapInsetsResizingMode(UIEdgeInsets(15,80,15,80),1))
inputBar.addSubview(backgroundImageView)

var textView = UITextView()
textView.setFrame(CGRect(52,14,screenBound.width - 36 * 2 - 38 - 9 * 2 - 10,19))
inputBar.addSubview(textView)

var data = ["hello","world","test","dshdjshd"]

function viewDidLoad()
{
    selfView().addSubview(table)
    
    selfView().addSubview(inputBar)
    
    addObserverForName("UIKeyboardWillShowNotification",function(noti)
                       {
                       var keyBoardHeight = noti.userInfo().UIKeyboardFrameEndUserInfoKey.CGRectValue().height
                       animateWithDuration(function()
                                           {
                                           inputBar.setFrame(CGRect(0,screenBound.height - 46 - keyBoardHeight,screenBound.width,46))
                                           table.setFrame(CGRect(0,0,screenBound.width,screenBound.height - 46 - keyBoardHeight));
                                           });
                       })
    addObserverForName("UIKeyboardWillHideNotification",function(noti)
                       {
                       var keyBoardHeight = noti.userInfo().UIKeyboardFrameEndUserInfoKey.CGRectValue().height
                       animateWithDuration(function()
                                           {
                                           inputBar.setFrame(CGRect(0,screenBound.height - 46,screenBound.width,46))
                                           table.setFrame(CGRect(0,0,screenBound.width,screenBound.height - 46));
                                           });
                       })
}

function viewDidAppear(animated)
{
    
}

function tableView_numberOfRowsInSection(tableView,section)
{
    return data.length
}

function tableView_heightForRowAtIndexPath(tableView,indexPath)
{
    return 80
}

function tableView_cellForRowAtIndexPath(tableView,indexPath)
{
    var cell = tableView.dequeueReusableCellWithIdentifier("idf")
    if (!cell) {
        cell = UITableViewCell(0,"idf")
        
        var titleLabel = UILabel()
        titleLabel.setFrame(CGRect(70,0,200,44))
        cell.addSubview(titleLabel)
        cell.setPropertyForKey(titleLabel,"titleLableKey")
        
        var userImageView = UIImageView()
        userImageView.setFrame(CGRect(20,0,44,44))
        
        cell.addSubview(userImageView)
        cell.setPropertyForKey(userImageView,"userImageKey")
    }
    
    var titleLabel = cell.getPropertyForKey("titleLableKey")
    titleLabel.setText(data[indexPath.row()])
    titleLabel.setBackgroundColor(UIColor(0.3,0.7,0.9,1))
    
    var userImageView = cell.getPropertyForKey("userImageKey")
    userImageView.setImage(UIImageNamed("comment_recommend"))
    
    return cell
}

function scrollToBottomAnimated(animated)
{
    var rows = table.numberOfRowsInSection(0)
    if(rows > 0) {
        table.scrollToRowAtIndexPathAtScrollPositionAnimated(NSIndexPath(rows - 1,0),3,1)
    }
}

function textViewDidBeginEditing(textView)
{
    log("textViewDidBeginEditing")
}

function textView_shouldChangeTextInRange_replacementText(c_textView,range,text)
{
    if(text === "\n") {
        data.push(c_textView.text())
        table.reloadData()
        
        scrollToBottomAnimated(true)
        c_textView.setText("")
    }
    return true
}

function scrollViewWillBeginDragging(scrollView)
{
    textView.resignFirstResponder()
}

function onTouchUpInside(sender)
{
    if(button == sender) {
        animateWithDuration(function()
                            {
                            textView.setFrame(CGRect(200,250,200,50))
                            });
    }else {
        log("not button")
    }
}
