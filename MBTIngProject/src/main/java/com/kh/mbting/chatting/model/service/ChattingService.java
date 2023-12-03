package com.kh.mbting.chatting.model.service;

import java.util.List;

import com.kh.mbting.chatting.model.vo.ChatMessage;
import com.kh.mbting.chatting.model.vo.ChatRoom;


public interface ChattingService {

	  /**
     * DB에 채팅 방이 있는지 확인
     * @param room
     * @return
     */
    ChatRoom searchChatRoom(ChatRoom room);
	
	  /**
     * 채팅 방 DB 저장
     * @param room
     * @return
     */
    int createChat(ChatRoom room);
    
    /**
     * 채팅 방 리스트 출력
     * @param userEmail
     * @return
     */
    List<ChatRoom> chatRoomList(String userEmail);
 
    /**
     * 메인화면 처럼 아예 처음 보는 사람한테 채팅을 보내기 위함
     * @param userEmail
     * @return
     */
    ChatRoom chatRoom(ChatRoom room);
    
    /**
     * 방 번호를 선택하는 메소드
     * @param roomId
     * @return
     */
    ChatRoom selectChatRoom(String roomId);
    
    /**
     * 채팅 메세지 DB 저장
     * @param chatMessage
     * @return 
     */
    int insertMessage(ChatMessage chatMessage);
}
