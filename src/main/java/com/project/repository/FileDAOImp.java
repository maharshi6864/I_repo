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

@Repository
public class FileDAOImp implements FileDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<FileVo> getFileObjectsInitially(String username) {
		List<FileVo> fileVoList = new ArrayList<FileVo>();
		try {
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("from FileVo where name = '" + username + "'");
			fileVoList = (List<FileVo>) query.list();
		} catch (Exception e) {
			System.out.println(e);
		}
		return fileVoList;
	}

	@Override
	public List<FileVo> getHomeFolderOfUser(String username) {
		List<FileVo> fileVoList = new ArrayList<FileVo>();
		try {
			Session session = sessionFactory.getCurrentSession();
			Query query = session
					.createQuery("from FileVo where name = '" + username + "' and username ='" + username + "'");
			fileVoList = (List<FileVo>) query.list();
		} catch (Exception e) {
			System.out.println(e);
		}
		return fileVoList;
	}

	@Override
	public List<FileVo> getFileObjectsForCurrentUser(String username, int folderId) {
		List<FileVo> fileVoList = new ArrayList<FileVo>();
		try {
			Session session = sessionFactory.getCurrentSession();
			org.hibernate.Query query = session
					.createQuery("from FileVo where username = '" + username + "' and docId = " + folderId);
			fileVoList = (List<FileVo>) query.list();
		} catch (Exception e) {
			System.out.println(e);
		}
		return fileVoList;
	}

	@Override
	public List<FileVo> checkForDuplicateFolder(String username, String folderName, int parentFolderId) {
		List<FileVo> fileVoList = new ArrayList<>();
		try {
			Session session = sessionFactory.getCurrentSession();
			org.hibernate.Query query;

			query = session.createQuery("from FileVo where username='" + username + "' and  name='" + folderName
					+ "' and docId = " + parentFolderId);

			fileVoList = (List<FileVo>) query.list();

		} catch (Exception e) {
			System.out.println(e);
		}

		return fileVoList;

	}

	@Override
	public void saveFolder(FileVo fileVo) {
		try {
			Session session = this.sessionFactory.getCurrentSession();
			session.saveOrUpdate(fileVo);
		} catch (HibernateException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<FileVo> getParentFolder(int folderId) {
		List<FileVo> fileVoList = new ArrayList<FileVo>();
		try {
			Session session = sessionFactory.getCurrentSession();
			org.hibernate.Query query = session.createQuery("from FileVo where id = " + folderId);
			fileVoList = (List<FileVo>) query.list();
		} catch (Exception e) {
			System.out.println(e);
		}
		return fileVoList;
	}
}
