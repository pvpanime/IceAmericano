package dev.nemi.americano.service;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Positive;
import java.time.LocalDateTime;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class FoodEditDTO {
    private long id;

    @NotNull @NotEmpty
    private String name;

    @NotNull @NotEmpty
    private String description;

    @Positive
    private long wonPrice;

    @NotNull
    private LocalDateTime until;
}
