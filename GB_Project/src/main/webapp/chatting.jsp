<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://asset.talkplus.io/talkplus-js-0.2.16.js"></script>
</head>
<body>
	<script>
	const client = new TalkPlus.Client({appId: 'YOUR_APP_ID'});
	this.loginAnonymous({
	      userId: 'user-123',
	      username: 'user-123',
	      profileImageUrl: '',
	    })
	      .then((data) => console.log(data))
	      .catch((err) => console.error(err));
	      
	// async/await
	try {
	    await client.loginAnonymous({
	        userId: 'user-123',
	        username: 'user-123',
	        profileImageUrl: '',
	    });
	} catch (err) {
	}


	// callback
	client.loginAnonymous({
	    userId: 'user-123', 
	    username: 'user-123',
	}, function (err, data) {
	    console.error(err);
	    console.log(data);
	});
	
	</script>
</body>
</html>