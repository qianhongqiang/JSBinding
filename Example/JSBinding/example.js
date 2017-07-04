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

var inputTextView = UITextView()
inputTextView.setFrame(CGRect(52,14,screenBound.width - 36 * 2 - 38 - 9 * 2 - 10,19))
inputBar.addSubview(inputTextView)

var sendButton = UIButton()
sendButton.setFrame(CGRect(screenBound.width - 50,14,40,19))
sendButton.setTitleForState("发送",0)
sendButton.setTitleColorForState(UIColor(0,0,0,1),0)
inputBar.addSubview(sendButton)

var data = ["hellookdasskahdhksahdjhsakjhdkjsahdjksahkjdhsamxzbchasjkjdmsnxbjhzcjvdmcnxmbcxzmncmxzbcnadsjkhsahdjksad","world","test","dshdjshd"]

function viewDidLoad()
{
    selfView().addSubview(table)
    
    selfView().addSubview(inputBar)
    
    addObserverForName("UIKeyboardWillShowNotification",function(noti)
                       {
                       var keyBoardHeight = noti.userInfo().UIKeyboardFrameEndUserInfoKey.CGRectValue().height
                       UIViewClass.jsb_animateWithDurationAnimations(1,function()
                                                              {
                                                              inputBar.setFrame(CGRect(0,screenBound.height - 46 - keyBoardHeight,screenBound.width,46))
                                                              table.setFrame(CGRect(0,0,screenBound.width,screenBound.height - 46 - keyBoardHeight));
                                                              })
                       })
    addObserverForName("UIKeyboardWillHideNotification",function(noti)
                       {
                       var keyBoardHeight = noti.userInfo().UIKeyboardFrameEndUserInfoKey.CGRectValue().height
                       UIViewClass.jsb_animateWithDurationAnimations(function()
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
    var height = sizeWithFontMaxSize(data[indexPath.row()],UIFont(14),CGSize(200,1000)).height
    return height > 60 ? height : 60
}

function tableView_cellForRowAtIndexPath(tableView,indexPath)
{
    var cell = tableView.dequeueReusableCellWithIdentifier("idf")
    if (!cell) {
        cell = UITableViewCell(0,"idf")
        
        var titleLabel = UILabel()
        titleLabel.setNumberOfLines(0)
        titleLabel.setFont(UIFont(14))
        cell.addSubview(titleLabel)
        cell.setPropertyForKey(titleLabel,"titleLableKey")
        
        var userImageView = UIImageView()
        userImageView.setFrame(CGRect(20,0,44,44))
        
        cell.addSubview(userImageView)
        cell.setPropertyForKey(userImageView,"userImageKey")
    }
    
    var titleLabel = cell.getPropertyForKey("titleLableKey")
    titleLabel.setText(data[indexPath.row()])
    titleLabel.setFrame(CGRect(70,0,200,sizeWithFontMaxSize(data[indexPath.row()],UIFont(14),CGSize(200,1000)).height))
    
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
        inputTextView.setText("")
    }
    return true
}

function scrollViewWillBeginDragging(scrollView)
{
    textView.resignFirstResponder()
}

function onTouchUpInside(sender)
{
    data.push(inputTextView.text())
    table.reloadData()
    
    scrollToBottomAnimated(true)
    inputTextView.setText("")
}
