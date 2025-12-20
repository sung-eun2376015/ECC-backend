package com.example.springbootTest.api;

import com.example.springbootTest.dto.CommentDto;
import com.example.springbootTest.entity.Comment;
import com.example.springbootTest.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class CommentApiController {
    @Autowired
    private CommentService commentService;

    //1.댓글 조회
    @GetMapping("/api/articles/{articleId}/comments")
    public ResponseEntity<List<CommentDto>> comments(@PathVariable("articleId") Long articleId){
        List<CommentDto> dtos=commentService.comments(articleId);
        return ResponseEntity.status(HttpStatus.OK).body(dtos);
    }

    //2.댓글 생성
    @PostMapping("/api/articles/{articleId}/comments")
    public ResponseEntity<CommentDto> create(@PathVariable("articleId") Long articleId,
                                             @RequestBody CommentDto dto){
        //서비스에 시키기
        CommentDto createdDto=commentService.create(articleId,dto);
        //결과 응답
        return ResponseEntity.status(HttpStatus.OK).body(createdDto);
    }

    //3.댓글 수정
    @PostMapping("/api/comments/{id}")
    public ResponseEntity<CommentDto> update(@PathVariable("id") Long id,@RequestBody CommentDto dto){
        //서비스에 시키기
        CommentDto updatedDto=commentService.update(id,dto);
        //결과 반환
        return ResponseEntity.status(HttpStatus.OK).body(updatedDto);
    }
    //4.댓글 삭제
    @DeleteMapping("/api/comments/{id}")
    public ResponseEntity<CommentDto> delete(@PathVariable("id") Long id){
        //서비스에 시키기
        CommentDto deleteDto=commentService.delete(id);
        //결과 응답
        return ResponseEntity.status(HttpStatus.OK).body(deleteDto);
    }

}
