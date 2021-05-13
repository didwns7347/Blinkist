package com.markany.blinkist.controller;

import java.io.IOException;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.markany.blinkist.service.KakaoService;
import com.markany.blinkist.service.NaverLoginService;
import com.markany.blinkist.service.UserService;
import com.markany.blinkist.vo.UserVo;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private NaverLoginService naverLoginService;

	@Autowired
	UserService userService;

	// 카카오톡 로그인 연동
	@RequestMapping("/kakaoLogin")
	public String home(@RequestParam(value = "code", required = false) String code, HttpServletRequest request,
			Model model) throws Exception {

		KakaoService service = new KakaoService();
		String access_Token = service.getAccessToken(code);
		HashMap<String, Object> userInfo = service.getUserInfo(access_Token);

		// 사용자가 입력한 email가져오기
		String email = (String) userInfo.get("email");

		// user table에 헤당 이메일이 있는지 확인
		UserVo user = userService.findByEmail(email);

		// 이메일이 있다면 로그인후 볼수 있는 view 보여주기
		if (user != null) {

			// session저장
			HttpSession session = request.getSession();
			session.setAttribute("authUser", email);

			return "redirect:/";

		} else { // 이메일이 없다면 회원가입시키기

			model.addAttribute("email", email);
			return "user/join";

		}
	}

	// 네이버로그인연동
	@RequestMapping("/login")
	public String login(HttpSession session, Model model) {
		String url = naverLoginService.getAuthorizationUrl(session);
		model.addAttribute("url", url);
		return "user/login";
	}

	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, ParseException {
		System.out.println("여기는 callback");

		OAuth2AccessToken oauthToken = naverLoginService.getAccessToken(session, code, state);
		// 로그인 사용자 정보를 읽어온다.
		String apiResult = naverLoginService.getUserProfile(oauthToken);
		String email = naverLoginService.getUserEmail(apiResult);
		UserVo user = userService.findByEmail(email);
		// 이메일이 있다면 로그인후 볼수 있는 view 보여주기
		if (user != null) {
			session.setAttribute("authUser", email);
			return "redirect:/";

		} else { // 이메일이 없다면 회원가입시키기

			model.addAttribute("email", email);
			return "user/join";

		}

	}
}