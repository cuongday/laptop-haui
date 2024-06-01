package com.ndc.laptopvn.service;

import com.ndc.laptopvn.domain.DTO.RegisterDTO;
import com.ndc.laptopvn.domain.User;
import com.ndc.laptopvn.domain.Role;
import com.ndc.laptopvn.repository.*;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final ForgotPasswordRepository forgotPasswordRepository;
    private final OrderRepository orderRepository;
    private final ProductRepository productRepository;

    public Page<User> getAllUser(Pageable pageable) {
        return this.userRepository.findAll(pageable);
    }

    public List<User> getListUser() {
        return this.userRepository.findAll();
    }

    public List<User> getAllUserByEmail(String email) {
        return this.userRepository.findOneByEmail(email);
    }

    public User getUserById(long id) {
        return this.userRepository.findFirstById(id);
    }

    public void deleteAUser(long id){
        this.forgotPasswordRepository.deleteByUserId(id);
        this.userRepository.deleteById(id);
    }

    public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

    public User handleSaveUser(User user) {
        User savedUser = this.userRepository.save(user);
        return savedUser;
    }

    public User registerDTOtoUser(RegisterDTO registerDTO) {
        User user = new User();
        user.setFullName(registerDTO.getFirstName() + " " + registerDTO.getLastName());
        user.setEmail(registerDTO.getEmail());
        user.setPassword(registerDTO.getPassword());
        return user;
    }

    public boolean existsByEmail(String email) {
        return this.userRepository.existsByEmail(email);
    }

    public User getUserByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    public long countUsers() {
        return this.userRepository.count();
    }
    public long countOrders() {
        return this.orderRepository.count();
    }

    public long countProducts() {
        return this.productRepository.count();
    }

    public void updatePassword(String email, String password) {
        this.userRepository.updatePassword(email, password);
    }
}
