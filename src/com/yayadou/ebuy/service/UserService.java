package com.yayadou.ebuy.service;

import java.util.Map;
import com.yayadou.ebuy.dto.User;

/**
 * UserService�ӿ�
 * @author Administrator
 */
public interface UserService {
	
	//ͨ���û�id����������û�
	public User getUserByUserIdAndByPassword(User u);
	
	//����û�
	public int insertUser(User user);
	
	//�����û�
	public int activeUser(Map<String,String> map);
	
	//����û���֪���ظ�
	public boolean getUserByUserId(String userId);
	
	//ͨ���û���������ͽ�ɫ�����ѯ�û�������¼��-��̨
	public User getUserByUserIdAndPwdAndRole(User u);
}
