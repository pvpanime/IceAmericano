package dev.nemi.americano.service;

import lombok.*;

import java.time.LocalDateTime;

@Value
@Builder
@AllArgsConstructor
@NoArgsConstructor(force = true)
public class FoodVO {
  long id;
  String name;
  String description;
  long wonPrice;
  LocalDateTime added;
  LocalDateTime until;
}
