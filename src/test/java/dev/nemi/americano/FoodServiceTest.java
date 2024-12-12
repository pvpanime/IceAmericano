package dev.nemi.americano;

import dev.nemi.americano.service.*;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.time.LocalDateTime;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring.xml")
public class FoodServiceTest {

  @Autowired
  private FoodService foodService;

  @Test
  public void getFoodsTest() {
    PaginatedDTO<FoodViewDTO> paginatedDTO = foodService.getFoods(FoodRequestDTO.DEFAULT);
    log.info(paginatedDTO);
  }

  @Test
  public void getFoodTest() {
    FoodViewDTO food1 = foodService.getFood(1L);
    Assertions.assertNull(food1);

    FoodViewDTO food3 = foodService.getFood(3L);
    Assertions.assertNotNull(food3);
    log.info(food3);
  }

  @Test
  public void createFoodTest() {
    foodService.createFood(
      FoodCreateDTO.builder()
        .name("왕만두")
        .description("만두는 속을 꽉 채우는 것이 진짜라고 했다")
        .wonPrice(1000L)
        .until(LocalDateTime.now().plusMonths(1))
        .build()
    );
  }
}
