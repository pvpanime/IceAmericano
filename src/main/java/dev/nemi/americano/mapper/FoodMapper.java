package dev.nemi.americano.mapper;

import dev.nemi.americano.service.FoodRequestDTO;
import dev.nemi.americano.service.FoodVO;

import java.util.List;

public interface FoodMapper {
  List<FoodVO> getFoods(FoodRequestDTO request);
  long getFoodCount(FoodRequestDTO request);

  FoodVO getFood(long id);
}
