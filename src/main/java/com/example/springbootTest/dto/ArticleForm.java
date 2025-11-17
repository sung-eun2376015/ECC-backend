package com.example.springbootTest.dto;

import com.example.springbootTest.entity.Article;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ArticleForm {
    private String title;
    private String content;

//    public ArticleForm(String title,String content) {
//        this.title=title;
//        this.content = content;
//    }

//    @Override
//    public String toString() {
//        return "ArticleForm{" +
//                "title='" + title + '\'' +
//                ", content='" + content + '\'' +
//                '}';
//    }

    public Article toEntity(){

        return new Article(null,title,content);
    }
}
