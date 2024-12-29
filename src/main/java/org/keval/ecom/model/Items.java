package org.keval.ecom.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import org.springframework.stereotype.Component;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Entity
@Data
@Getter
@Setter
@Component
public class Items {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long itemId;
    @NotNull
    private String itemName;
    private String itemDescription;
    private String itemType;
    @NotNull
    private Long itemPrice;
    @NotNull
    private boolean isAvailable;
    public Items(String itemName, String itemDescription, String itemType, Long itemPrice, boolean isAvailable) {
        this.itemName = itemName;
        this.itemDescription = itemDescription;
        this.itemType = itemType;
        this.itemPrice = itemPrice;
        this.isAvailable = isAvailable;
    }
}
