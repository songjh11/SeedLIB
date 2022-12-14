package com.seed.lib.policy;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/policy/*")
public class PolicyController {
	
	@GetMapping("siteMap")
	public String getSiteMap()throws Exception{
		return "policy/siteMap";
	}
	
	@GetMapping("personal")
	public String getPersonalPolicy()throws Exception{
		return "policy/personal";
	}
	
	@GetMapping("email")
	public String getEmailPolicy()throws Exception{
		return "policy/email";
	}

}
