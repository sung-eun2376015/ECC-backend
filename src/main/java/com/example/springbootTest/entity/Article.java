package com.example.springbootTest.entity;

import jakarta.persistence.*;
import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Entity
@Getter @Setter
public class Article {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    private String title;

    @Column
    private String content;

    public void patch(Article article) {
        if(article.title!=null){
            this.title=article.title;
        }
        if(article.content!=null){
            this.content=article.content;
        }
    }

//    public Article(Long id,	String title,String content) {
//        this.id=id;
//        this.title=title;
//        this.content=content;
//    }
//
//    @Override
//    public String toString() {
//        return "Article{" +
//                "id=" + id +
//                ", title='" + title + '\'' +
//                ", content='" + content + '\'' +
//                '}';
//    }
}
