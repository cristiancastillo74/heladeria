package com.heladeria.heladeria.dto;

import java.math.BigDecimal;

public record PurchaseOrderItemResponseDTO(
        Long itemId,
        String name,
        Double currentStock,
        String unit,
        BigDecimal quantity,
        BigDecimal unitPrice
) {}