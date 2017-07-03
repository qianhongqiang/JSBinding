var screenBound = ScreenBounds()
var table = UITableViewWithRect(screenBound)

var inputBar = UIView()
inputBar.setFrame(CGRect(0,screenBound.height - 44,screenBound.width,44))
inputBar.setBackgroundColor(UIColor(0.7,0.7,0.7,1))

var textView = UITextView()
textView.setBackgroundColor(UIColor(0.5,0.2,0.8,1))
textView.setFrame(CGRect(5,5,screenBound.width - 10,34))

var button = UIButton()
button.setBackgroundColor(UIColor(1,0.2,0.1,1))
button.setFrame(CGRect(20,550,200,50))

var button2 = UIButton()
button2.setBackgroundColor(UIColor(1,0.2,0.1,1))
button2.setFrame(CGRect(20,350,200,50))

var data = ["Saab","Volvo","BMW","dshdjshd","dsdsds"]

function viewDidLoad()
{
    selfView().addSubview(table)
    
    selfView().addSubview(inputBar)
    inputBar.addSubview(textView)
    
    selfView().addSubview(button)
    selfView().addSubview(button2)
    
    addObserverForName("UIKeyboardWillShowNotification",function(noti)
                       {
                       log(noti.userInfo().UIKeyboardFrameEndUserInfoKey.CGRectValue().height)
                       var keyBoardHeight = noti.userInfo().UIKeyboardFrameEndUserInfoKey.CGRectValue().height
                       animateWithDuration(function()
                                           {
                                           inputBar.setFrame(CGRect(0,screenBound.height - 44 - keyBoardHeight,screenBound.width,44))
                                           });
                       })
    addObserverForName("UIKeyboardWillHideNotification",function(noti)
                       {
                       log(noti.userInfo().UIKeyboardFrameEndUserInfoKey.CGRectValue().height)
                       var keyBoardHeight = noti.userInfo().UIKeyboardFrameEndUserInfoKey.CGRectValue().height
                       animateWithDuration(function()
                                           {
                                           inputBar.setFrame(CGRect(0,screenBound.height - 44,screenBound.width,44))
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

function textViewDidBeginEditing(textView)
{
    log(textView)
}

function scrollViewWillBeginDragging(scrollView)
{
    log("scrollViewWillBeginDragging")
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
