package dev.nemi.americano.service;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class FoodViewDTO {
  private long id;
  private String name;
  private String description;
  private long wonPrice;
  private LocalDateTime until;
}
