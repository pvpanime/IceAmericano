package dev.nemi.americano.service;

import lombok.*;
import org.checkerframework.checker.nullness.qual.Nullable;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Positive;
import java.net.URLEncoder;
import java.time.LocalDateTime;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class FoodRequestDTO {

  public static final int DEFAULT_SIZE = 10;
  public static final String DEFAULT_SIZE_STR = DEFAULT_SIZE + "";
  public static final FoodRequestDTO DEFAULT = FoodRequestDTO.builder().build();

  @Builder.Default
  @Min(value = 1)
  @Positive
  private long page = 1;

  @Builder.Default
  @Min(value = 1)
  @Max(value = 100)
  @Positive
  private int size = DEFAULT_SIZE;



  
  private String[] searchFor;

  @Builder.Default
  private String search = "";

  private Integer matchStatus;
  private LocalDateTime rangeStart;
  private LocalDateTime rangeEnd;

  private Integer minPrice;
  private Integer maxPrice;
  
  
  

  public long getSkip() {
    return (page - 1) * size;
  }

  public String usePage(long pg) {
    StringBuilder sb = new StringBuilder();
    if (pg != 1) sb.append("&page=").append(pg);
    if (size != DEFAULT_SIZE) sb.append("&size=").append(size);
    sb.append(this.getSearchQuestion());
    String search = sb.toString();
    return search.isEmpty() ? "" : search.replaceFirst("&", "?");
  }

  public String usePage() {
    return usePage(this.page);
  }

  @SneakyThrows
  public String getSearchQuestion() {
    StringBuilder sb = new StringBuilder();
    if (searchFor != null) {
      for (String s : searchFor) {
        sb.append("&searchFor=").append(URLEncoder.encode(s, "UTF-8"));
      }
    }
    if (search != null && !search.isEmpty()) {
      sb.append("&search=").append(URLEncoder.encode(search, "UTF-8"));
    }
    if (matchStatus != null) {
      sb.append("&matchStatus=").append(matchStatus);
    }
    if (rangeStart != null && rangeEnd != null) {
      sb.append("&rangeStart=").append(rangeStart);
      sb.append("&rangeEnd=").append(rangeEnd);
    }
    return sb.toString();
  }

  public boolean isSearchFor(String s) {
    if (searchFor == null) return false;
    for (String t : searchFor) {
      if (t.equals(s)) return true;
    }
    return false;
  }
}
