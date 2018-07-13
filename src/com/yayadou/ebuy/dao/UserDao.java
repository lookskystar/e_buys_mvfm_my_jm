package com.yayadou.ebuy.dao;

import java.util.Map;
import com.yayadou.ebuy.dto.User;

//UserDao�ӿ�
public interface UserDao{
	public static final String NAMESPACE_NAME = "com.yayadou.ebuy.mapper.UserMapper.";

	//ͨ���û����������ѯ�û�������¼��
	public User getUserByUserIdAndPassword(User u);
	// �����û�
	public int insertUser(User user);
	//�û��������
	public int activeUser(Map<String,String> map);
	//����û����Ƿ��ظ�
	public boolean getUserByUserId(String userId);
	//ͨ���û���������ͽ�ɫ�����ѯ�û�������¼��-��̨
	public User getUserByUserIdAndPwdAndRole(User u);
}
