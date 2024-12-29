package org.keval.ecom.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.hibernate.annotations.CurrentTimestamp;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Data
@Entity
@Component
public class Customer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long cid;
    private String name;
    @Column(unique = true)
    private String email;
    private String password;
    @CurrentTimestamp
    @Column(updatable = false)
    private LocalDateTime createdAt;
    @Enumerated(EnumType.STRING)
    private Role role;
}
