package com.ndc.laptopvn.controller.client;

import com.ndc.laptopvn.domain.Comment;
import com.ndc.laptopvn.domain.request.CommentRequest;
import com.ndc.laptopvn.service.CommentService;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class CommentController {
    private final CommentService commentService;

    @PostMapping("/api/products/{productId}/comments")
    public ResponseEntity<Comment> addComment(@PathVariable Long productId,
                                               @RequestBody CommentRequest commentRequest) {
        Comment comment = commentService.addComment(commentRequest.getUserName(), productId, commentRequest.getEmail(), commentRequest.getMessage(), commentRequest.getRate(), commentRequest.getParentCommentId());
        return ResponseEntity.ok(comment);
    }

    @GetMapping("/products/{productId}/comments")
    public ResponseEntity<List<Comment>> getCommentsByProduct(@PathVariable Long productId) {
        List<Comment> comments = commentService.getCommentsByProduct(productId);
        return ResponseEntity.ok(comments);
    }
}
