/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package asm4.dtoes;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author CaoThu
 */
public class PostsDTO implements Serializable{
    int id;
    String username;
    String title;
    String topic;
    String post;
    String name;
    boolean publish;
    Date date; 

    public PostsDTO() {
    }

    public PostsDTO(int id, String title, String topic, String post, boolean publish) {
        this.id = id;
        this.title = title;
        this.topic = topic;
        this.post = post;
        this.publish = publish;
    }

    

    public PostsDTO(int id, String username, String title, String topic, String post, String name, boolean publish, Date date) {
        this.id = id;
        this.username = username;
        this.title = title;
        this.topic = topic;
        this.post = post;
        this.name = name;
        this.publish = publish;
        this.date = date;
    }

    public PostsDTO(int id, String username, String title, String topic, String name, boolean publish, Date date) {
        this.id = id;
        this.username = username;
        this.title = title;
        this.topic = topic;
        this.name = name;
        this.publish = publish;
        this.date = date;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post;
    }

    public boolean isPublish() {
        return publish;
    }

    public void setPublish(boolean publish) {
        this.publish = publish;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
    
}
