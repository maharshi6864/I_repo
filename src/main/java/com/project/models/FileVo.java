package com.project.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "doc_tbh")
public class FileVo {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id")

  private int id;

  private String name;

  @ManyToOne
  @JoinColumn(name = "docId")
  private FileVo docId;

  @ManyToOne
  @JoinColumn(name = "loginId")
  private LoginVo userId;

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public FileVo getDocId() {
    return docId;
  }

  public void setDocId(FileVo docId) {
    this.docId = docId;
  }

  public LoginVo getUserId() {
    return userId;
  }

  public void setUserId(LoginVo userId) {
    this.userId = userId;
  }

}
