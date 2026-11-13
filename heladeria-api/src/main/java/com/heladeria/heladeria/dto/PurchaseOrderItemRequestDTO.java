package com.heladeria.heladeria.dto;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.DecimalMin;
import java.math.BigDecimal;

public record PurchaseOrderItemRequestDTO(
        @NotNull Long itemId,
        @NotNull @DecimalMin(value = "0.0", inclusive = false) BigDecimal quantity,
        BigDecimal unitPrice
) {}