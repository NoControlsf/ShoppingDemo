//JS判断客户端是手机还是PC
////true为PC端，false为手机端
function is_pc() {
	var userAgentInfo = navigator.userAgent;
	var Agents = ["Android", "iPhone",
	    "SymbianOS", "Windows Phone",
	    "iPad", "iPod"];
	var flag = true;
	for (var v = 0; v < Agents.length; v++) {
		if (userAgentInfo.indexOf(Agents[v]) > 0) {
			flag = false;
			break;
		}
	}
	return flag;
}
