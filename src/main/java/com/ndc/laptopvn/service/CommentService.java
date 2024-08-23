package com.ndc.laptopvn.service;

import com.ndc.laptopvn.domain.Comment;
import com.ndc.laptopvn.domain.Product;
import com.ndc.laptopvn.repository.CommentRepository;
import com.ndc.laptopvn.repository.ProductRepository;
import com.ndc.laptopvn.repository.UserRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class CommentService {
    private final CommentRepository commentRepository;
    private final ProductRepository productRepository;
    private final UserRepository userRepository;

    public Comment addComment(String username, Long productId, String email, String message, int rate, Long parentCommentId) {
        Product product = productRepository.findFirstById(productId);
        Comment comment = new Comment();
        comment.setMessage(message);
        comment.setUserName(username);
        comment.setEmail(email);
        comment.setProduct(product);
        comment.setRate(rate);

        if (parentCommentId != null) {
            Comment parentComment = commentRepository.findById(parentCommentId).orElse(null);
            comment.setParentComment(parentComment);
        }

        return commentRepository.save(comment);
    }

    public List<Comment> getCommentsByProduct(Long productId) {
        Product product = productRepository.findFirstById(productId);
        return commentRepository.findAllByProduct(product);
    }

    public List<String> getAllMessageByProductId(Long productId) {
        return commentRepository.findAllMessageByProductId(productId);
    }

    public List<Comment> getAllByProductId(Long productId) {
        return commentRepository.findAllByProductId(productId);
    }
}
