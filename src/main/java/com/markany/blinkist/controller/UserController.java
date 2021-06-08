package com.markany.blinkist.controller;

import java.io.IOException;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.markany.blinkist.service.HilightService;
import com.markany.blinkist.service.KakaoService;
import com.markany.blinkist.service.LibraryService;
import com.markany.blinkist.service.NaverLoginService;
import com.markany.blinkist.service.UserService;
import com.markany.blinkist.vo.Grade;
import com.markany.blinkist.vo.Payment_method;
import com.markany.blinkist.vo.UserVo;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private NaverLoginService naverLoginService;

	@Autowired
	UserService userService;

	@Autowired
	private HilightService hilightService;

	@Autowired
	private LibraryService libraryService;

	// 카카오톡 로그인 연동
	@RequestMapping("/kakaoLogin")
	public String home(@RequestParam(value = "code", required = false) String code, HttpServletRequest request,
			Model model, RedirectAttributes rttr, HttpSession session) throws Exception {

		KakaoService service = new KakaoService();
		String access_Token = service.getAccessToken(code);
		HashMap<String, Object> userInfo = service.getUserInfo(access_Token);

		// 사용자가 입력한 email가져오기
		String email = (String) userInfo.get("email");

		// user table에 헤당 이메일이 있는지 확인
		UserVo user = userService.findByEmail(email);

		// 이메일이 있다면 로그인후 볼수 있는 view 보여주기
		if (user != null) {

			session.setAttribute("authUser", email);

			rttr.addFlashAttribute("Success", "안녕하세요. Blinkist에 오신걸환영합니다.");

			// premium가입날이 지났는지 확인
			// 1. premium을 가입했는지 확인한다.
			if (user.getPrimium_date() != null) {// premium을 가입했다면

				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

				try {

					Date Primium_date = sdf.parse(user.getPrimium_date());
					Date finish_date = sdf.parse(user.getFinish_date());

					if (Primium_date.before(finish_date)) {// primium_date가 만료일을 지났다면

						// 2.팝업창을 띄우기위한 데이터를 하나보내준다.
						rttr.addFlashAttribute("passes", "passes");

						// 3. 회원의 등급과 premium_date날짜를 바꿔준다.
						UserVo uservo = new UserVo();

						uservo.setEmail(email);
						uservo.setGrade(Grade.basic);
						uservo.setPrimium_date(null);

						userService.PassPrimium(uservo);

					}
				} catch (Exception e) {

					e.printStackTrace();

				}

				return "redirect:/";

			} else {// premium가입을 안했다면

				return "redirect:/";

			}

		} else { // 이메일이 없다면 회원가입시키기

			model.addAttribute("email", email);

			return "user/join";

		}
	}

	// 네이버로그인연동페이지
	@RequestMapping("/login")
	public String login(HttpSession session, Model model) {

		String url = naverLoginService.getAuthorizationUrl(session);
		model.addAttribute("url", url);
		return "user/login";

	}

	// 네이버연동처리
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session,
			RedirectAttributes rttr) throws IOException, ParseException {

		OAuth2AccessToken oauthToken = naverLoginService.getAccessToken(session, code, state);

		// 로그인 사용자 정보를 읽어온다.
		String apiResult = naverLoginService.getUserProfile(oauthToken);

		// 사용자가 입력한 email가져오기
		String email = naverLoginService.getUserEmail(apiResult);

		// user table에 헤당 이메일이 있는지 확인
		UserVo user = userService.findByEmail(email);

		// 이메일이 있다면 로그인후 볼수 있는 view 보여주기
		if (user != null) {

			session.setAttribute("authUser", email);

			rttr.addFlashAttribute("Success", "안녕하세요. Blinkist에 오신걸환영합니다.");

			// premium가입날이 지났는지 확인
			// 1. premium을 가입했는지 확인한다.
			if (user.getPrimium_date() != null) {// premium을 가입했다면

				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

				try {

					Date Primium_date = sdf.parse(user.getPrimium_date());
					Date finish_date = sdf.parse(user.getFinish_date());

					if (Primium_date.before(finish_date)) {// primium_date가 만료일을 지났다면

						// 2.팝업창을 띄우기위한 데이터를 하나보내준다.
						model.addAttribute("passes", "passes");

						// 3. 회원의 등급과 premium_date날짜를 바꿔준다.
						UserVo uservo = new UserVo();

						uservo.setEmail(email);
						uservo.setGrade(Grade.basic);
						uservo.setPrimium_date(null);

						userService.PassPrimium(uservo);

					}
				} catch (Exception e) {

					e.printStackTrace();

				}

				return "redirect:/";

			} else {// premium가입을 안했다면

				return "redirect:/";

			}

		} else { // 이메일이 없다면 회원가입시키기

			model.addAttribute("email", email);

			return "user/join";

		}
	}

	// 회원가입
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(UserVo uservo, HttpSession session, RedirectAttributes rttr) {
		System.out.println("dkdkdkdkdkdkdkdkkdkdkdkdk");
		// 회원가입
		userService.insert(uservo);

		rttr.addFlashAttribute("Success", "회원가입을 하였습니다.");

		return "redirect:/";
	}

	// 스프링 시큐리티로 회원가입폼으로 보내기
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "user/join";
	}

	// api 사용하시 않고 사티으 내부에서 회원가입
	@RequestMapping(value = "/injoin", method = RequestMethod.GET)
	public String inJoin() {
		return "user/injoin";
	}
	
	
	//프리미엄가입
	@RequestMapping(value = "/upgradepremium", method = RequestMethod.GET)
	public String getupgradepremium(Principal principal, Model model) {
		
		String email = principal.getName();
		
		model.addAttribute("email", email);
		
		return "user/upgradepremium";
		
	}

	// 회원정보수정GET
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String getUpdate(Principal principal, Model model) {
		// 세션에 저장된 회원의 이메일정보가져오기
		String email = principal.getName();
		System.out.println("email=" + email + "\nPrinciple=" + principal.toString());
		// 이메일을 토대로 회원의 정보가져오기
		UserVo uservo = userService.selectbyUser(email);

		model.addAttribute("uservo", uservo);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		try {
			System.out.println(uservo.getFinish_date());
			
			if((uservo.getFinish_date()!=null)){
			Date startDate = sdf.parse(uservo.getFinish_date());// 구독끝나는날짜
			Date EndDate = new Date();// 현재날짜

			// 구독끝나는날짜-현재날짜 /(24*60*60*1000)
			long diffDay = (startDate.getTime() - EndDate.getTime()) / (24 * 60 * 60 * 1000);

			if (uservo.getGrade().equals(Grade.monthP)) {// 월구독자라면

				model.addAttribute("refund", diffDay * 530);

			} else if (uservo.getGrade().equals(Grade.yearP)) {// 연간구독자라면

				model.addAttribute("refund", diffDay * 270);

			}
		}} catch (Exception e) {

			e.printStackTrace();

		}

		return "user/update";

	}

	// 회원정보수정POST
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String postUpdate(Principal authUser, Model model, HttpServletRequest request, RedirectAttributes rttr) {

		// 회원의 이메일 가져오기
		String email = authUser.getName();

		// 기존의 비밀번호가져오기
		String oldpassword = (String) request.getParameter("oldpassword");

		// 새로운 비밀번호가져오기
		String newpassword = (String) request.getParameter("newpassword");

		boolean result = userService.updatePw(email, oldpassword, newpassword);

		if (result) {

			rttr.addFlashAttribute("Success", "회원정보를 수정하였습니다.");
			return "redirect:/";

		} else {

			rttr.addFlashAttribute("Error", "기존비밀번호를 잘못입력하셨습니다. 확인해주세요.");
			return "redirect:/";

		}
	}

	// 회원등급수정
	@ResponseBody // Ajax사용을 위해 @ResponseBody 선언
	@RequestMapping(value = "/updateGrade", method = RequestMethod.POST)
	public void updateGrade(@RequestParam(value = "email") String email, @RequestParam(value = "grade") String grade,
			@RequestParam(value = "payment_method") String payment_method) {

		UserVo uservo = new UserVo();
		uservo.setEmail(email);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();

		// 등급나누기
		if (grade.equals("basic")) {

			uservo.setGrade(Grade.basic);

		} else if (grade.equals("monthP")) {

			uservo.setGrade(Grade.monthP);
			uservo.setPrimium_date(sdf.format(cal.getTime()));

			cal.add(Calendar.MONTH, 1);

			uservo.setFinish_date(sdf.format(cal.getTime()));

		} else if (grade.equals("yearP")) {

			uservo.setGrade(Grade.yearP);
			uservo.setPrimium_date(sdf.format(cal.getTime()));

			cal.add(Calendar.YEAR, 1);

			uservo.setFinish_date(sdf.format(cal.getTime()));

		}

		// 결제수단
		if (payment_method.equals("카카오페이")) {

			uservo.setPayment_method(Payment_method.카카오페이);

		} else if (payment_method.equals("페이코")) {

			uservo.setPayment_method(Payment_method.페이코);

		}

		userService.updategrade(uservo);

	}

	// 구독취소
	@ResponseBody // Ajax사용을 위해 @ResponseBody 선언
	@RequestMapping(value = "/primiumDelete", method = RequestMethod.POST)
	public String primiumDelete(Principal authUser) {

		// 회원의 이메일 가져오기
		String email = authUser.getName();

		UserVo uservo = new UserVo();

		uservo.setEmail(email);
		uservo.setGrade(Grade.basic);

		userService.updategrade(uservo);
				
		return "/blinkist/logout";

	}

	

	// 회원탈퇴
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String postDelete(HttpSession session, Model model, RedirectAttributes rttr) {

		// 회원의 이메일 가져오기
		String email = (String) session.getAttribute("authUser");

		// 이메일을 토대로 회원정보가져오기
		UserVo userVo = userService.findByEmail(email);

		// hilight모두삭제
		hilightService.deleteAllHilight(userVo.getUser_no());

		// library모두삭제
		libraryService.deleteAllLibrary(userVo.getUser_no());

		// 회원탈퇴
		userService.deleteUser(email);

		session.removeAttribute("authUser");

		rttr.addFlashAttribute("Success", "회원탈퇴하였습니다.");

		return "redirect:/";

	}
}