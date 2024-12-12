package dev.nemi.americano;

public class Http400 extends RuntimeException {
  public Http400(String message) {
    super(message);
  }
}
