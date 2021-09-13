package com.green.sunny.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.multipart.MultipartFile;


import com.google.gson.JsonObject;
import com.green.sunny.board.BoardService;
import com.green.sunny.board_comment.BoardCommentService;
import com.green.sunny.dto.BoardVO;
import com.green.sunny.dto.MemberVO;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	@Autowired
	private BoardCommentService boardCommentService;
	
	@RequestMapping(value="/moveBoard", method = RequestMethod.GET)
	public String moveBoard() {
        return "board/board";
	} 
	
	//전체 글 조회
	@ResponseBody 
	@RequestMapping(value="/getBoard", method = RequestMethod.GET)
	public Map<String, Object> selectBoard(HttpServletResponse response) throws IOException {
	
		//원래 로직
//		List<Map<String,Object>> resultMap = new ArrayList<Map<String,Object>>();
//		resultMap = boardService.selectBoardList();
		
		//데이터테이블 api를 사용하기 위한 수정
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", boardService.selectBoardList());
		
		return map;
	}
	
	@RequestMapping(value="/getBoardDetail", method = RequestMethod.GET)
	public String moveBoard(@RequestParam(value="bseq") int bseq, Model model, BoardVO vo) {
		//System.out.println("bseq:"+bseq);
		Map<String, Object> map = new HashMap<String, Object>();

	    vo.setCount(boardService.selectCount(bseq));
		boardService.plusCount(vo);
		
		map = boardService.selectBoardDetail(bseq);
		map.put("bseq", bseq);
		model.addAttribute("map", map);
		
		
        return "board/board_detail";
	} 
	
	@RequestMapping(value="/openBoardList.do", method = RequestMethod.GET)
	public String moveBackBoard() {

		return "board/board";
	} 
	
	@RequestMapping(value="/openBoardDelete.do", method = RequestMethod.GET)
	public String DeleteBoard(int bseq, @RequestParam Map<String,Object> param) {
		
		//댓글삭제
		boardCommentService.deleteAllComment(bseq);
		//사진삭제
		boardService.deleteBoardPicture(bseq);
		//보드삭제
		boardService.deleteBoard(bseq);
		
		return "board/board";
	} 
	
	@RequestMapping(value="/BoardWrite", method = RequestMethod.GET)
	public String BoardWrite() {

		return "board/board_write";
	} 
	
	@RequestMapping(value="/BoardUpdate", method = RequestMethod.GET)
	public String BoardUpdate(int bseq, Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map = boardService.selectBoardDetail(bseq);
		map.put("bseq", bseq);
		model.addAttribute("map", map);
		
		return "board/board_update";
	} 
	
	@RequestMapping(value="/write_save", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> BoardWriteForm(@RequestParam Map<String,Object> param, HttpSession session ,@RequestParam(value="files[]") @Nullable List<String> files) {
		
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		Map<String,Object> resultMap = new HashMap<String, Object>();
		param.put("id", loginUser.getId());
		
		try {
			//글 등록
			boardService.insertBoardInfo(param);
			//bSeq 구하기
			int bseq = boardService.seletcBSeq();
			param.put("bseq", bseq);
			//파일 등록
			for(String fileName : files) {
				param.put("fileName", fileName);
				boardService.insertFile(param);
			}
			resultMap.put("msg", "등록 성공하였습니다.");
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("msg", "등록 실패하였습니다.");
		}
		
		return resultMap;
	} 
	
	@RequestMapping(value="/write_update", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> BoardUpdateForm(@RequestParam Map<String,Object> param, HttpSession session ,@RequestParam(value="files[]") @Nullable List<String> files) {
		
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		param.put("id", loginUser.getId());
		
		try {
			//글 등록
			boardService.updateBoardInfo(param);
			
			
			//파일 등록
			for(String fileName : files) {
				param.put("fileName", fileName);
				boardService.insertFile(param);
			}
			resultMap.put("msg", "등록 성공하였습니다.");
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("msg", "등록 실패하였습니다.");
		}
		
		return resultMap;
	} 
	
	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		
		JsonObject jsonObject = new JsonObject();
		
		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot+"WEB-INF/resources/images/";
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		//String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
//		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + originalFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장

			jsonObject.addProperty("url", "images/"+originalFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		
		return a;
	}
}	
