waxClass{"QTLLeftViewController", UIViewController}


function touchItem(self, strTitle)
	print("-----touchItem------1")
	if(strTitle)then
		if(toobjc(strTitle):isEqualToString("我的发表"))then
			UIApplication:sharedApplication():delegate():pushViewOnCenterView(nil)
			print("-----touchItem------2")
			return;
		end
		print("-----touchItem------3")
		self:ORIGtouchItem(strTitle)
	end
end