<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>MakeItUsable! - Login</title>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/star-rating/jquery.js"/></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/star-rating/jquery.MetaData.js"/></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/star-rating/jquery.form.js"/></script>

<script type="text/javascript">
	
	function Node(value) {
	    this.value = value;
	    this.children = new Array();
	    this.parent = null;
	    this.color = null;
	
	    this.setParentNode = function(node) {
	        this.parent = node;
	    }
	
	    this.getParentNode = function() {
	        return this.parent;
	    }
		
	    
	    this.setColor = function(color){
	    	this.color = color;	
	    }
	    
	    this.getColor = function(color){
	    	return this.color;
	    }
	    
	    this.addChild = function(output) {
	    	alert("add childs starting!");
	    	$.each(output, function(i, item){
	  			var newNode = new Node(item);
	  			newNode.setParentNode(this);
	  			//this.children[this.children.length] = newNode;
	  			children.push(newNode);
	  			});
	    	alert("add childs complete!");
	        //node.setParentNode(this);
	        //this.children[this.children.length] = node;
	    }
	
	    this.getFirstChildren = function() {
	        return this.children[0];
	    }
	    
	    this.getChildren = function() {
	    	alert("getting childs!" + this.children.lenght);
	    	return children;
	    }
	
	    this.removeChildren = function() {
	        this.children = [];
	    }
	}

	function getLinks(keyWord, myfunction)
	{
		var keyWordUrl = "http://en.wikipedia.org/w/api.php?action=parse&prop=links&format=json&page=" + keyWord; 
		var mainArray = [];
		$.ajax({
			  dataType: "json",
			  asynch: false,
			  url: keyWordUrl + "&callback=?",
		 }).done(function (data) {
			// alert("Document is ready!");
			  jsonString = JSON.stringify(data);
			  //var obj = $.parseJSON(jsonString);
			  var json = $.parseJSON(jsonString);
			  var parsed = JSON.parse(jsonString, function(k, v) {
				    if (k === "*") 
				        this.a = v;
				    else
				        return v;
				});
			  
			  //document.getElementById("fname").innerHTML=JSON.stringify(parsed);
			  var t = json.parse.links[1].ns;
			  var array = [];
			  var stringTest= "";
			  $.each(parsed.parse.links, function(i, item) {
				  if(item.ns == 0)
					  {
				    array.push(item.a);
					  }
				});
			  myfunction(array);
		});
	}
	
	function checkPhrase(keyWordPage, keyWordSearch, myfunction)
	{
		//alert("at page" + keyWordPage +"checking for " + keyWordSearch );
		var keyWordUrl = "http://en.wikipedia.org/w/api.php?action=query&prop=revisions&rvprop=content&format=json&titles=" + keyWordPage; 
		$.ajax({
			  dataType: "json",
			  asynch: false,
			  url: keyWordUrl + "&callback=?",
		 }).done(function (data) {
			 jsonString = JSON.stringify(data);
			 if (jsonString.indexOf(keyWordSearch) >= 0)
				 myfunction(true);
			 else
				 myfunction(false);
		 });
	}
		
	$(document).ready(function(){
		// textBox1 and textBox2
		count = 0;
		var root;
		root = new Node("Information_visualization"); // value from first text box
		alert("root node created!" );
		// phrase --> value from second textbox
		
		buildTree(root, "geospatial data", count);
	});
	
	function setColorOfParents(Node)
	{
		var currentNode = Node;
		while(currentNode != root)
			{
				currentNode.setColor(true);
				currentNode = currentNode.getParentNode(); 
			}
	}
	
	function buildTree(root, phraseText, count)
	{
		if(count == 9)
			{
			return;
			}
		else
		{
			alert("getting links for " + root.value);
			getLinks(root.value, function(output){
	  			//$.each(output, function(i, item){
	  			//	var newNode = new Node(item);
	  				root.addChild(output);
	  				//checkPhrase(newNode.value, phraseText, function(output){
	  				//	if(output){
	  				//		setColorOfParents(newNode);
	  		//			}
	  				//});
	  				
				///});
			});  // get links for the first text box values and create childs
			
			var childrens = root.getChildren();
			$.each(childrens, function(i, item) {
				alert("Tree Building for" + item.value);
				buildTree(item, phraseText, count+1);
			});
		}
	}
	
   </script>
</head>
<p>
First Name: <span id="fname"></span><br> 
Last Name: <span id="lname"></span><br> 
test: <span id="test"></span><br> 
</p> 
</body>
</html>