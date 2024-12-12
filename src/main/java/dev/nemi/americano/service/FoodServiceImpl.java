package dev.nemi.americano.service;

import dev.nemi.americano.mapper.FoodMapper;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class FoodServiceImpl implements FoodService {

  private final FoodMapper foodMapper;
  private final ModelMapper modelMapper;

  @Override
  public PaginatedDTO<FoodViewDTO> getFoods(FoodRequestDTO foodRequestDTO) {
    List<FoodViewDTO> list = foodMapper.getFoods(foodRequestDTO).stream().map(v -> modelMapper.map(v, FoodViewDTO.class)).collect(Collectors.toList());
    long total = foodMapper.getFoodCount(foodRequestDTO);
    PaginatedDTO<FoodViewDTO> paginatedDTO =
      PaginatedDTO.<FoodViewDTO>withAll()
        .ls(list)
        .total(total)
        .requestDTO(foodRequestDTO)
        .build();
    return paginatedDTO;
  }

  @Override
  public FoodViewDTO getFood(long id) {
    FoodVO foodVO = foodMapper.getFood(id);
    if (foodVO == null) return null;
    return modelMapper.map(foodVO, FoodViewDTO.class);
  }

  @Override
  public void createFood(FoodCreateDTO foodCreateDTO) {
    foodMapper.createFood(modelMapper.map(foodCreateDTO, FoodVO.class));
  }

  @Override
  public void editFood(FoodEditDTO foodEditDTO) {
    foodMapper.updateFood(modelMapper.map(foodEditDTO, FoodVO.class));
  }

  @Override
  public void deleteFood(long id) {
    foodMapper.deleteFood(id);
  }
}
