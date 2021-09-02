package com.green.sunny.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.green.sunny.board.BoardService;
import com.green.sunny.dto.BoardVO;
import com.green.sunny.dto.MemberVO;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="/moveBoard", method = RequestMethod.GET)
	public String moveBoard() {
        return "board/board";
	} 
	
	//전체 글 조회
	@ResponseBody // ajax이므로
	@RequestMapping(value="/getBoard", method = RequestMethod.GET)
	public Map<String, Object> selectBoard(HttpServletResponse response) throws IOException {
		System.out.println("getBoard");
		//원래 로직
//		List<Map<String,Object>> resultMap = new ArrayList<Map<String,Object>>();
//		resultMap = boardService.selectBoardList();
		
		//데이터테이블 api를 사용하기 위한 수정
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", boardService.selectBoardList());
		System.out.println("map:"+map);
		return map;
	}
	
	@RequestMapping(value="/getBoardDetail", method = RequestMethod.GET)
	public String moveBoard(@RequestParam(value="bseq") int bseq, Model model, BoardVO vo) {
		//System.out.println("bseq:"+bseq);
		Map<String, Object> map = new HashMap<String, Object>();

	    vo.setCount(boardService.selectCount(bseq));
		boardService.plusCount(vo);
		
		map = boardService.selectBoardDetail(bseq);
		model.addAttribute("map", map);
		
		
        return "board/board_detail";
	} 
	
	@RequestMapping(value="/openBoardList.do", method = RequestMethod.GET)
	public String moveBackBoard() {

		return "board/board";
	} 
	
	@RequestMapping(value="/openBoardDelete.do", method = RequestMethod.GET)
	public String DeleteBoard(int bseq) {
		//System.out.println("bseq=" +bseq);
		
		boardService.deleteBoard(bseq);
		
		return "board/board";
	} 
	
	@RequestMapping(value="/BoardWrite", method = RequestMethod.GET)
	public String BoardWrite() {

		return "board/board_write";
	} 
	
	@RequestMapping(value="/write_save", method = RequestMethod.POST)
	@ResponseBody
	public boolean BoardWriteForm(@RequestParam Map<String,Object> param, HttpSession session) {
		System.out.println("param=" +param);
		
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		param.put("id", loginUser.getId());
		
		return boardService.insertBoardInfo(param) == 1 ? true : false;
	} 
	
	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		System.out.println("huj");
		JsonObject jsonObject = new JsonObject();
		
        /*
		 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		 */
		
		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot+"resources/images/";
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".jpg"));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			// /summernote/resources/fileupload/
			jsonObject.addProperty("url", "/resources/images/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
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
