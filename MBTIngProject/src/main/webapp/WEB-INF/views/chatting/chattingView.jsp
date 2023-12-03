<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gasoek+One&family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
    	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    
<style>
.wrap {
    width : 1300px;
    height : 900px;
    margin: auto;
    border: double 3px rgb(255, 149, 166);
    border-radius: 20px;
    font-family: 'IBM Plex Sans KR', sans-serif;
}
.wrapPC {
    width : 1200px;
    height : 700px;
    display: inline-block;
    display: flex;
}

#profileDiv {
    width: 400px;
    height: 900px;
    margin-left: 50px;
    background-color: #ffcece;
}

#profileDiv table {
    width: 100%;
    height: 100%;
}

#profileDiv table td{
    text-align: center;
}

#profileDiv img {
    height: 300px;
    width : 300px; 
    border-radius: 200px; 
}


/*---------------------------chatting--------------------------------*/

.chatDiv {
    width: 670px;
    height: 80%;
    border-left: 1px solid #ffffff;
    border-right: 1px solid #ffffff;

    overflow:auto;
    margin-top: 100px;
    margin-left: 100px;
}

.Right {
    text-align: right;
}
.Left {
    text-align: left;
}
.message {
  display: inline-block;
  max-width: 500px;
  border: 1px solid black;
  height: 60px;
  line-height: 55px;
  padding: 0 1rem;
  margin : 20px;
  border: 2px solid transparent;
  border-radius: 8px;
  background-color: rgb(207, 207, 207);
  color: #0d0c22;
  box-shadow: 0 0 5px rgb(233, 255, 231), 0 0 0 10px #f5f5f5eb;
  font-family: 'IBM Plex Sans KR', sans-serif;
}

.chat {
    width: 100%;
    display: inline-block;
    align-items: flex-end;
    color: black;
}

#chatInput {
    width: 670px;
    height: 200px;
    margin-left: 540px;
}

#chatInput > table {
    width: 100%;
    height: 90%;;
}

#chatInput textarea {
    resize: none;
}

.sender {
    padding-left:20px ;
    padding-right:20px ;
}

li {
 list-style-type : none;
 }
/*-------------------------전송버튼 css---------------------------------*/
#submitButton {
 align-items: center;
 background-color: #ffd8d8;
 border: 1px solid rgba(0, 0, 0, 0.1);
 border-radius: .25rem;
 box-shadow: rgba(0, 0, 0, 0.02) 0 1px 3px 0;
 box-sizing: border-box;
 color: rgba(0, 0, 0, 0.85);
 cursor: pointer;
 display: inline-flex;
 font-size: 16px;
 font-weight: 600;
 justify-content: center;
 line-height: 1.25;
 min-height: 3rem;
 padding: calc(.875rem - 1px) calc(1.5rem - 1px);
 text-decoration: none;
 transition: all 250ms;
 user-select: none;
 -webkit-user-select: none;
 touch-action: manipulation;
 vertical-align: baseline;
 width: auto;
}

#submitButton:hover,
#submitButton:focus {
 border-color: rgba(0, 0, 0, 0.15);
 box-shadow: rgba(0, 0, 0, 0.1) 0 4px 12px;
 color: rgba(0, 0, 0, 0.65);
}

#submitButton:hover {
 transform: translateY(-1px);
}

#submitButton:active {
 background-color: #F0F0F1;
 border-color: rgba(0, 0, 0, 0.15);
 box-shadow: rgba(0, 0, 0, 0.06) 0 2px 4px;
 color: rgba(0, 0, 0, 0.65);
 transform: translateY(0);
}

/*----------------------------사용자 화면 --------------------------*/
  .card-image > img{
        border: 1px solid black;
        width : 200px;
        height: 200px;
  }
</style>
</head>
<body>

<br><br><br><br>
    <div class="wrap">
        <div class="wrapPC">
            <div id="profileDiv">
               
                 <table > 
                    <tr>
                        <td colspan="3" style="height: 300px; padding-top: 100px; "><img src="https://thumb.mtstarnews.com/06/2023/03/2023033020282257826_1.jpg/dims/optimize"> </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 10px;"><p style="font-size: 60px;">임유나</p></td>
                    </tr>
                    <tr>
                        <td colspan="3"></td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 10px;" ><p style="font-size : 30px;">intj</p></td>
                    </tr>
                    <tr>
                        <td colspan="3"></td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 10px;"><p>클라이밍 좋아해요 ㅎㅎ 운동! </p></td>
                    </tr>
                    <tr>
                        <td colspan="3"></td>
                    </tr>
                    <tr>
                        <td colspan="3"></td>
                    </tr>
                    <tr>
                        <td colspan="3">유나에 대한 후기 남기기</td>
                    </tr>
                    <tr>
                        <td colspan="3"></td>
                    </tr>
                    <tr>
                        <td><div><button id="submitButton" onclick="">차단하기</button></div></td>
                        <td><div><button id="submitButton" onclick="">신고하기</button></div></td>
                        <td> <div><button id="submitButton" onclick="disconnect();">채팅 종료</button></div></td>
                    </tr>
                 </table>
            </div>
			<!-- 
            <div class="chatDiv">
            		<div class="sender">
                      <span></span>
                    </div>
			         <div class="chat ">
			               <p class="message"></p>
			         </div>
             </div>
              -->
	        <div class="chatDiv">
	        <ul>
	            <li>
	                <div class="sender">
	                    <div></div>
	                </div>
	                <div class="chat">
	                    <p></p>
	                </div>
	            </li>
	        </ul>
	    	</div>
        </div>
        <div id="chatInput" >
            <table>
                <tr>
                    <td colspan="2" style="height: 30px;"><img style="width : 40px; height: 30px;"  src="https://cdn-icons-png.flaticon.com/128/6350/6350285.png"></img>></td>
                </tr>
                <tr>
                    <td>
                        <textarea style="width: 100%; height: 90%;" placeholder="메시지를 입력해주세요" name="message" id="message"></textarea>
                    </td>
                    <td style="width: 15%;"><button id="submitButton" style="width: 100%; height: 90%;" onclick="sendMessage();" >전송</button></td>
                </tr>
            </table>
        </div>
    </div>
         
  <script>
  
    let roomNo = "${requestScope.roomNo}";
    //console.log(roomNo);
    
    let socket;
	//연결 실행 시 실행될 함수

	$(function(){
		let url = "ws://localhost:8081/mbting/chat.do";
			
		socket = new WebSocket(url);
		
		//연결 성공 시 실행할 함수 onopen 
		socket.onopen = function() {
			 const data = {
	                    "roomNo" : roomNo,
	                    "name"   : "${ loginMember.userName }",
	                    "email"  : "${ loginMember.email }",
	                  "message"  : "ENTER-CHAT"
	            };
	            let jsonData = JSON.stringify(data);
	             socket.send(jsonData);
		};
		
		//연결 종료 시 실행할 함수 onclose
		socket.onclose = function() {
			console.log("서버와 연결이 종료");
		};
		
		//연결 오류 발생 시 실행할 함수
		socket.onerror = function() {
			console.log("서버 오류남");
		};
		
		socket.onmessage = function(e) {
		
			let div = $("<div>" + e.data + "</div");
			
			console.log(div);
			
			$("#message_wrap1").append(div);
		};

	});

	
	//연결 종료 시 실행될 함수 
	function disconnect() {
		socket.close();
        location.href="http://localhost:8081/mbting";
	};
	
	
	//메세지를 전송하는 함수
	function sendMessage() {
		
		let message = $("#message").val();
		//console.log(message);
		
		if(message.trim() !== "") {
				//입력한 메세지가 있을 경우에만 전송하겠다는 뜻. 
				//websocket 객체의 send 메소드를 호출
				
				const data = {
                "roomNo" : roomNo,
                "name" : "${ sessionScope.loginMember.userName }",
                "email" : "${ sessionScope.loginMember.email }",
                "message"   : message 
            	};
				//console.log(data);
				CheckLR(data);
		
				let jsonData = JSON.stringify(data);
        
       		 	socket.send(jsonData);
        
				$("#message").val("");//초기화 효과
			}
		
	}
	
	
	
	// * 2-1 추가 된 것이 내가 보낸 것인지, 상대방이 보낸 것인지 확인하기
    function CheckLR(data) {
        // email이 loginSession의 email과 다르면 왼쪽, 같으면 오른쪽
        const LR = (data.email != "${ sessionScope.loginMember.email }") ? "Left" : "Right";
         // 메세지 추가
        //console.log(LR);
        appendMessageTag(LR, data.email, data.message, data.name);
    }
	
    // * 3 메세지 태그 append
    function appendMessageTag(LR_className, email, message, name) {
         
        const chatLi = createMessageTag(LR_className, email, message, name);
     
        //console.log(chatLi);
        $('div.chatDiv').append(chatLi);
     
        // 스크롤바 아래 고정
        $('div.chatDiv').scrollTop($('div.chatDiv').prop('scrollHeight'));
    }
    
 	// * 4 메세지 태그 생성
    function createMessageTag(LR_className, email, message, name) {
     
 		//console.log(LR_className +email+message +name);
         // 형식 가져오기
         let chatLi = $("div.chatDiv ul li").clone();

         
         console.log(chatLi);
         
         chatLi.find('.chat').addClass(LR_className);              	// left : right 클래스 추가
         // find() : chatLi의 하위 요소 찾기
         chatLi.find('.sender div').text(name);      	// 이름 추가
         chatLi.find('.chat p').text(message); 			// 메세지 추가
         chatLi.find('.chat p').addClass("message");
         chatLi.find('.sender div').addClass(LR_className);
         
         console.log(chatLi);
         return chatLi;
    };
	</script>   


</body>
</html>