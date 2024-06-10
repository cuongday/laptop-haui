package com.ndc.laptopvn.repository;

import com.ndc.laptopvn.domain.User;

import jakarta.transaction.Transactional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User save(User user);
    List<User> findOneByEmail(String email);

    User findFirstById(long id);

    void deleteById(long id);

    boolean existsByEmail(String email);

    User findByEmail(String email);

    Page<User> findAll(Pageable pageable);

    @Transactional
    @Modifying
    @Query("update User u set u.password = ?2 where u.email = ?1")
    void updatePassword(String email ,String password);

    @Query(
            value = " SELECT u.* " +
                    " FROM users u " +
                    "INNER JOIN roles r ON u.role_id = r.id " +
                    "WHERE (?1 IS NULL OR LOWER(u.full_name) LIKE CONCAT('%',LOWER(?1),'%')) " +
                    "AND (?2 IS NULL OR LOWER(r.description) LIKE CONCAT('%',LOWER(?2),'%'))",
            countQuery =" SELECT count(u.id) " +
                    " FROM users u " +
                    "INNER JOIN roles r ON u.role_id = r.id " +
                    "WHERE (?1 IS NULL OR LOWER(u.full_name) LIKE CONCAT('%',LOWER(?1),'%')) " +
                    "AND (?2 IS NULL OR LOWER(r.description) LIKE CONCAT('%',LOWER(?2),'%'))",
            nativeQuery = true
    )
    Page<User> filterUserByNameAndEmailAndRoleDes(String fullName, String roleDescription, Pageable pageable);


}
