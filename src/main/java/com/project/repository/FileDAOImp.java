package com.project.repository;

import java.util.ArrayList;
import java.util.List;

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
  public List<FileVo> getFileObjectsInitially(int userId) {
    List<FileVo> fileVoList = new ArrayList<FileVo>();
    try {
      Session session = sessionFactory.getCurrentSession();
      Query query = session.createQuery("from FileVo where userId = " + userId + " and docId = NULL");
      fileVoList = (List<FileVo>) query.list();
    } catch (Exception e) {
      System.out.println(e);
    }
    return fileVoList;
  }

  @Override
  public List<FileVo> getFileObjectsForCurrentUser(int userId, int folderId) {
    List<FileVo> fileVoList = new ArrayList<FileVo>();
    try {
      Session session = sessionFactory.getCurrentSession();
      org.hibernate.Query query = session
          .createQuery("from FileVo where userId = " + userId + " and docId = " + folderId);
      fileVoList = (List<FileVo>) query.list();
    } catch (Exception e) {
      System.out.println(e);
    }
    return fileVoList;
  }

}
