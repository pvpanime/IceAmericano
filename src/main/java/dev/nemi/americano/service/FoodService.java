package dev.nemi.americano.service;

import org.springframework.stereotype.Repository;


public interface FoodService {
  PaginatedDTO<FoodViewDTO> getFoods(FoodRequestDTO foodRequestDTO);

  FoodViewDTO getFood(long id);
}
