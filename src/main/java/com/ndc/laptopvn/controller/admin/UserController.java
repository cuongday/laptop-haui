package com.ndc.laptopvn.controller.admin;

import com.ndc.laptopvn.domain.User;
import com.ndc.laptopvn.service.MailService;
import com.ndc.laptopvn.service.UploadService;
import com.ndc.laptopvn.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Controller
public class UserController {

    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;
    private final MailService mailService;
    private final HttpServletRequest request;


    public UserController(UserService userService,
                          UploadService uploadService,
                          PasswordEncoder passwordEncoder,
                          MailService mailService,
                          HttpServletRequest request) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
        this.mailService = mailService;
        this.request = request;
    }

    @RequestMapping("/admin/user")
    public String getUserPage(Model model,
                              @RequestParam("page") Optional<String> OptionalPage) {
        int page = 1;
        try {
            if (OptionalPage.isPresent()) {
                page = Integer.parseInt(OptionalPage.get());
            } else {

            }
        } catch (NumberFormatException e) {

        }
        Pageable pageable = PageRequest.of(page - 1, 5);
        Page<User> users = this.userService.getAllUser(pageable);
        List<User> userList = users.getContent();
        model.addAttribute("users", userList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", users.getTotalPages());

        return "admin/user/show";
    }

    @RequestMapping("/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        model.addAttribute("newUser", new User());
        model.addAttribute("id", id);
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        return "admin/user/detail";
    }

    @GetMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping("/admin/user/create")
    public String createHomePage(Model model,
                                 @ModelAttribute("newUser") @Valid User user,
                                 BindingResult newUserbindingResult,
                                 @RequestParam("uploadAvatarFile") MultipartFile file
    ) {

        List<FieldError> errors = newUserbindingResult.getFieldErrors();
        for (FieldError error : errors ) {
            System.out.println (error.getField() + " - " + error.getDefaultMessage());
        }

        if (newUserbindingResult.hasErrors()) {
            return "admin/user/create";
        }


        String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
        String hashPassword = this.passwordEncoder.encode(user.getPassword());
        user.setPassword(hashPassword);
        user.setAvatar(avatar);
        user.setRole(this.userService.getRoleByName(user.getRole().getName()));
        user.setCreateAt(new Timestamp(System.currentTimeMillis()));
        this.userService.handleSaveUser(user);
        return "redirect:/admin/user";
    }

    @RequestMapping("/admin/user/update/{id}")
    public String getUpdateUserPage(Model model, @PathVariable long id ) {
        User currentUser = this.userService.getUserById(id);
        model.addAttribute("newUser", currentUser);
        model.addAttribute("id", id);
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String PostUpdateUser(Model model, @ModelAttribute("newUser") User user, @RequestParam("uploadAvatarFile") MultipartFile file) {
        User currentUser = this.userService.getUserById(user.getId());
        String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
        model.addAttribute("newUser", currentUser);
        if (currentUser != null) {
            currentUser.setFullName(user.getFullName());
            currentUser.setAddress(user.getAddress());
            currentUser.setPhoneNumber(user.getPhoneNumber());
            currentUser.setAvatar(avatar);
            currentUser.setRole(this.userService.getRoleByName(user.getRole().getName()));
            this.userService.handleSaveUser(currentUser);
        }
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("newUser", new User());

        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String postDeleteUser(Model model, @ModelAttribute("newUser") User user) {
        this.userService.deleteAUser(user.getId());

        return "redirect:/admin/user";
    }


}
