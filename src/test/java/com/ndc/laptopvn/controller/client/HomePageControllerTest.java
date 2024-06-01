package com.ndc.laptopvn.controller.client;

import com.ndc.laptopvn.controller.client.HomePageController;
import com.ndc.laptopvn.domain.DTO.RegisterDTO;
import com.ndc.laptopvn.domain.Role;
import com.ndc.laptopvn.domain.User;
import com.ndc.laptopvn.service.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.servlet.ModelAndView;
import static org.junit.jupiter.api.Assertions.assertEquals;

import static org.mockito.Mockito.*;

//@ExtendWith(MockitoExtension.class)
//public class HomePageControllerTest {
//
//    @Mock
//    private ProductService productService;
//
//    @Mock
//    private UserService userService;
//
//    @Mock
//    private PasswordEncoder passwordEncoder;
//
//    @Mock
//    private OrderService orderService;
//
//    @Mock
//    private BindingResult bindingResult;
//
//    @InjectMocks
//    private HomePageController homePageController;
//
//    @BeforeEach
//    void setUp() {
//        MockitoAnnotations.openMocks(this);
//        homePageController = new HomePageController(productService, userService, passwordEncoder, orderService);
//    }
//
//    @Test
//    public void testHandleRegister() {
//        RegisterDTO registerDTO = new RegisterDTO();
//        registerDTO.setFirstName("Test");
//        registerDTO.setLastName("User");
//        registerDTO.setEmail("testuser@gmail.com");
//        registerDTO.setPassword("password");
//
//        User user = new User();
//        user = userService.registerDTOtoUser(registerDTO);
//
//        when(bindingResult.hasErrors()).thenReturn(false);
//        when(userService.registerDTOtoUser(any(RegisterDTO.class))).thenReturn(new User());
//        when(passwordEncoder.encode(any())).thenReturn("encodedPassword");
//        when(userService.getRoleByName(anyString())).thenReturn(new Role());
//        when(userService.handleSaveUser(any(User.class))).thenReturn(new User());
//
//        String viewName = homePageController.handleRegister(registerDTO, bindingResult);
//
//        verify(userService, times(2)).registerDTOtoUser(any(RegisterDTO.class));
//        verify(passwordEncoder, times(1)).encode(any());
//        verify(userService, times(1)).getRoleByName(anyString());
//        verify(userService, times(1)).handleSaveUser(any(User.class));
//
//        assertEquals("redirect:/login", viewName);
//        System.out.println(viewName);
//    }
//
//
//    @Test
//    public void testHandleRegisterWithInvalidInput() {
//        RegisterDTO registerDTO = new RegisterDTO();
//        registerDTO.setFirstName("Test");
//        registerDTO.setLastName("User");
//        registerDTO.setEmail("user@gmail.com"); // Valid email
//        registerDTO.setPassword("password");
//
//        // Simulate validation errors
//        FieldError error = new FieldError("registerUser", "email", "Email is not valid");
//        when(bindingResult.hasErrors()).thenReturn(true);
//        lenient().when(bindingResult.getFieldError()).thenReturn(error);
//
//        String viewName = homePageController.handleRegister(registerDTO, bindingResult);
//
//        // Verify that no interactions with these methods occurred, as the input was invalid
//        verify(userService, times(0)).registerDTOtoUser(any(RegisterDTO.class));
//        verify(passwordEncoder, times(0)).encode(any());
//        verify(userService, times(0)).getRoleByName(anyString());
//        verify(userService, times(0)).handleSaveUser(any(User.class));
//
//        assertEquals("client/auth/register", viewName); // The user should be redirected back to the registration page
//    }
//
//
//}

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import com.ndc.laptopvn.domain.DTO.RegisterDTO;
import com.ndc.laptopvn.service.UserService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.web.servlet.MockMvc;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.httpBasic;

@ExtendWith(SpringExtension.class)
@AutoConfigureMockMvc(addFilters = false)
@WebMvcTest(HomePageController.class)
public class HomePageControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private UserService userService;

    @MockBean
    private PasswordEncoder passwordEncoder;

    @MockBean
    private ProductService productService;

    @MockBean
    private OrderService orderService;

    @MockBean
    private UploadService uploadService;
    @InjectMocks
    private HomePageController homePageController;

    @BeforeEach
    public void setup() {
        MockitoAnnotations.openMocks(this);
        homePageController = new HomePageController(productService, userService, orderService, uploadService, passwordEncoder);

    }


    @Test
    public void testHandleRegister_ValidUser_ShouldRedirectToLogin() throws Exception {
        // Define a valid user registration DTO
        RegisterDTO validRegisterDTO = new RegisterDTO();
        validRegisterDTO.setFirstName("valid");
        validRegisterDTO.setLastName("user");
        validRegisterDTO.setEmail("valid@email.com");
        validRegisterDTO.setPassword("validPassword");
        validRegisterDTO.setConfirmPassword("validPassword");

        // ... set other necessary fields


        mockMvc.perform(post("/register")
                        .param("firstName", validRegisterDTO.getFirstName())
                        .param("lastName", validRegisterDTO.getLastName())
                        .param("email", validRegisterDTO.getEmail())
                        .param("password", validRegisterDTO.getPassword())
                        .param("confirmPassword", validRegisterDTO.getConfirmPassword())
                        .with(csrf())
                        // ... set other necessary parameters
                        .sessionAttr("registerUser", validRegisterDTO))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/login"));
    }

    @Test
    public void testHandleRegister_InvalidUser_ShouldReturnRegisterView() throws Exception {
        // Simulating a validation error
        mockMvc.perform(post("/register")
                                .param("firstName", "valid")
                                .param("lastName", "user")
                                .param("email", "") // Empty email to simulate error
                                .param("password", "validPassword")
                                .with(csrf())
                        // ... set other necessary parameters
                )
                .andExpect(status().isOk())
                .andExpect(view().name("client/auth/register"));
    }


    @Test
    public void testFindUserByUsername(){
        User currentUser = this.userService.getUserByEmail("testuser@gmail.com");
        System.out.println("expected: test user");
        System.out.println("Actual: " + currentUser.getFullName());

    }
    // You should also consider adding more test cases to cover other edge cases.
}