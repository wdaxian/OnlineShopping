var time=4;
function getTime() {
	window.setTimeout("getTime()",1000);
	time=time-1;
	document.getElementById("Second").innerHTML=time;
}