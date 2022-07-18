	// 아이디 입력창 띄우기
	function checkId() {
		var memid = document.frm.memid.value;
		
		if(memid == "") {
			alert("먼저 아이디를 입력하세요.");
			document.frm.memid.focus();
		} else {
			// 브라우저창 열기
			window.open("checkId.do?memid="+memid, "", "width=450 height=250 left=700 top=500")
		}
	}

	// 회원가입 입력검사
	function check(){
		var frm = document.frm;
	    if(frm.pw.value != frm.repw.value){
	    	alert("비밀번호를 재확인하세요");
	    	return false;
		} else {
	    	if(cnt > 0) {
	    		frm.submit();
	    	} else {
	    		alert("ID 중복검사가 필요합니다.");
	    		return false;
	    	}
		}      
	}