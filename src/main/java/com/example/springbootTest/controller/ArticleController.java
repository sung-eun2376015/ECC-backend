package com.example.springbootTest.controller;

import com.example.springbootTest.dto.ArticleForm;
import com.example.springbootTest.entity.Article;
import com.example.springbootTest.repository.ArticleRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Controller
public class ArticleController {

    @Autowired
    private ArticleRepository articleRepository;

    @GetMapping("/articles/new")
    public String newArticleForm(){
        return "articles/new";
    }

    @PostMapping("/articles/create")
    public String createArticle(ArticleForm form){
        //System.out.println(form.toString());
        log.info(form.toString());

        //entity를 생성하고 dto를 엔티티로 받기
        Article article=form.toEntity();
        //System.out.println(article.toString());
        log.info(article.toString());

        //CrudRepository를 상속받은 리포지토리를 통해 엔티티를 저장
        Article saved=articleRepository.save(article);
        //System.out.println(saved.toString());
        log.info(saved.toString());

        return "redirect:/articles/"+ saved.getId();
    }

    @GetMapping("/articles/{id}")
    public String show(@PathVariable("id") Long id, Model model){
        //id를 조회해 데이터 가져오기
        Article articleEntity=articleRepository.findById(id).orElse(null);

        model.addAttribute("article",articleEntity);

        return "articles/show";
    }

    @GetMapping("/articles")
    public String index(Model model){
        // 모든 데이터 가져오기
        ArrayList<Article> articleEntityList=articleRepository.findAll();

        model.addAttribute("articleList",articleEntityList);

        return "articles/index";
    }

    @GetMapping("/articles/{id}/edit")
    public String edit(@PathVariable("id") Long id,Model model){

        Article articleEntity=articleRepository.findById(id).orElse(null);

        model.addAttribute("article",articleEntity);

        return "articles/edit";
    }

    @PostMapping("/articles/update")
    public String update(ArticleForm form){
        //Article 엔티티로 변환
        Article articleEntity=form.toEntity();
        log.info(articleEntity.toString());

        //디비에서 가져와서 원래 있는 값인지 확인하고 업데이트
        Article target=articleRepository.findById(articleEntity.getId()).orElse(null);
        if(target!=null){
            articleRepository.save(articleEntity);
        }
        return "redirect:/articles/"+ articleEntity.getId();
    }

    @GetMapping("/articles/{id}/delete")
    public String delete(@PathVariable("id") Long id, RedirectAttributes rttr){
        Article target= articleRepository.findById(id).orElse(null);
        log.info(target.toString());

        if(target != null){
            articleRepository.delete(target);
            rttr.addFlashAttribute("msg","삭제됐습니다!");
        }

        return "redirect:/articles";
    }

}
