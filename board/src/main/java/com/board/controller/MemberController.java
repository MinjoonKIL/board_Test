package com.board.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.domain.MemberVO;
import com.board.service.MemberService;

@Controller
@RequestMapping("/board/*")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Inject
	private MemberService service;

	// 게시물 작성
	@RequestMapping(value = "/loginform", method = RequestMethod.GET)
	public void getForm() throws Exception {

	}

	// 게시물 작성
	@RequestMapping(value = "/loginform", method = RequestMethod.POST)
	public String loginform(MemberVO vo) throws Exception {
		service.loginform(vo);

		return "redirect:/board/list";
	}

	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpServletRequest req, Model model, RedirectAttributes rttr) throws Exception {

		logger.info("login");
		HttpSession session = req.getSession();

		MemberVO login = service.login(vo);

		if (login == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		} else {
			session.setAttribute("member", login);
		}

		return "redirect:/";
	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		logger.info("get logout");

		session.invalidate();

		return "redirect:/";
	}

}
