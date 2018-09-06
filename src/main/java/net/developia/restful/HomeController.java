package net.developia.restful;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.developia.restful.user.UserVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {
		
		UserVO userInfo = new UserVO();
		userInfo.setUsr_no(1);
		userInfo.setUsr_name("신해철");
		userInfo.setUsr_id("next");
		userInfo.setUsr_level(1);
		userInfo.setUsr_status(0);
		
		session.setAttribute("userInfo", userInfo); 
		return "redirect:board/100/1/";
		//return "redirect:user/";
		
		
		
/*		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		//model.addAttribute("serverTime", formattedDate );
*/		
		//return "redirect:user/";
		
		
		//return "home";
	}
	
}
