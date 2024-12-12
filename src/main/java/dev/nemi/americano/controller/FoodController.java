package dev.nemi.americano.controller;


import dev.nemi.americano.Http404;
import dev.nemi.americano.service.FoodRequestDTO;
import dev.nemi.americano.service.FoodService;
import dev.nemi.americano.service.FoodViewDTO;
import dev.nemi.americano.service.PaginatedDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import javax.validation.Valid;

@Log4j2
@Controller
@RequiredArgsConstructor
public class FoodController {

  private final FoodService foodService;

  @GetMapping("/food")
  public String index(
    @Valid @ModelAttribute("requestDTO") FoodRequestDTO request,
    BindingResult requestBR,
    Model model) {
    if (requestBR.hasErrors()) {
      return "redirect:/food";
    }
    PaginatedDTO<FoodViewDTO> paginatedDTO = foodService.getFoods(request);
    model.addAttribute("foodDTO", paginatedDTO);
    return "food/index";
  }

  @GetMapping("/food/view/{id}")
  public String view(
    @PathVariable("id") long id,
    @ModelAttribute("requestDTO") FoodRequestDTO request,
    BindingResult requestBR, Model model) {
    if (requestBR.hasErrors()) return "redirect:/food/view/" + id;
    FoodViewDTO foodDTO = foodService.getFood(id);
    if (foodDTO == null) throw new Http404("Food not found");

    model.addAttribute("foodDTO", foodDTO);
    return "food/view";
  }

  @GetMapping("/food/create")
  public String create() {
    return "food/create";
  }
}
