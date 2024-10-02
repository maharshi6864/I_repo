package com.project.repository;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.models.FileVo;
import com.project.models.LoginVo;
import com.project.models.UserVo;

@Repository
public class UserDAOImp implements UserDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<UserVo> getUserByLoginId(int loginId) {
		List<UserVo> userVoList = new ArrayList<UserVo>();
		try {
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("from UserVo where loginId" + loginId);
			userVoList = (List<UserVo>) query.list();
		} catch (Exception e) {
			System.out.println(e);
		}
		return userVoList;
	}
	
	@Override
	public List<UserVo> getAllUsers() {
		List<UserVo> ls = null;
		try {
			Session session = this.sessionFactory.getCurrentSession();
			Query q = session.createQuery("from UserVo");
			ls = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ls;
	}

	@Override
	public List<UserVo> getUserById(int id) {
		List<UserVo> ls = null;
		try {
			Session session = this.sessionFactory.getCurrentSession();
			Query q = session.createQuery("from UserVo where id ="+ id);
			ls = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ls;
	}

	@Override
	public void saveUser(UserVo uservo) {
		try {
			Session session = this.sessionFactory.getCurrentSession();
			session.saveOrUpdate(uservo);
		} catch (HibernateException e) {
			e.printStackTrace();
		}
	}
}
