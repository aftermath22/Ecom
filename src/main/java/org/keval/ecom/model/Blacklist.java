package org.keval.ecom.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.hibernate.annotations.CreationTimestamp;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Data
@Entity
@Component
public class Blacklist {
    @Id
    private String email;
    @CreationTimestamp
    @Column(updatable = false)
    private LocalDateTime ListedOn;
    public Blacklist(String email) {
        this.email = email;
    }
}
