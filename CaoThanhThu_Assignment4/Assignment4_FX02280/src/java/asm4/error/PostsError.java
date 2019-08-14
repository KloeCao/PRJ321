/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package asm4.error;

import java.io.Serializable;

/**
 *
 * @author CaoThu
 */
public class PostsError implements Serializable{
    String titleError, topicError, postError, haveTrouble;

    public String getHaveTrouble() {
        return haveTrouble;
    }

    public void setHaveTrouble(String haveTrouble) {
        this.haveTrouble = haveTrouble;
    }

    public String getTitleError() {
        return titleError;
    }

    public void setTitleError(String titleError) {
        this.titleError = titleError;
    }

    public String getTopicError() {
        return topicError;
    }

    public void setTopicError(String topicError) {
        this.topicError = topicError;
    }

    public String getPostError() {
        return postError;
    }

    public void setPostError(String postError) {
        this.postError = postError;
    }
    
}
