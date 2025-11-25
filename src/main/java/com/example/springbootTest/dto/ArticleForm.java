package com.example.springbootTest.dto;

import com.example.springbootTest.entity.Article;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.Getter;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter @Setter
public class ArticleForm {
    private Long id;
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

        return new Article(id,title,content);
    }
}
