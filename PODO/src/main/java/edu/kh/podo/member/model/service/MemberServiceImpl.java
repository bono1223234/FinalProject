package edu.kh.podo.member.model.service;

import java.util.HashMap;

//import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import edu.kh.podo.member.model.dao.MemberDAO;
import edu.kh.podo.member.model.vo.Member;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO dao;

	@Autowired
	private BCryptPasswordEncoder bcrypt;

	private Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);

	// 濡쒓렇�씤 service 援ы쁽
	@Override
	public Member login(Member inputMember) {

		logger.info(inputMember.getMemberPw() + " / " + bcrypt.encode(inputMember.getMemberPw()));

		Member loginMember = dao.login(inputMember);

		if (loginMember != null) { 

		
			if (bcrypt.matches(inputMember.getMemberPw(), loginMember.getMemberPw())) {
			

				loginMember.setMemberPw(null); 

			} else { 
				loginMember = null;

			}
		}

		return loginMember;
	}
	
	@Override
	public Member naverLogin(Member inputMember) {

		return dao.login(inputMember);
	}

	// �쉶�썝媛��엯 service 援ы쁽
	@Override
	public int signUp(Member inputMember) {

		String encPw = bcrypt.encode(inputMember.getMemberPw());

		inputMember.setMemberPw(encPw);

		int result = dao.signUp(inputMember);

		return result;
	}

	@Override
	public int naverSignUp(Member inputMember) {
		
		int result = dao.naverSignUp(inputMember);

		return result;
	}




	

}
