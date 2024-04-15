package com.github.volodya.model;

import java.time.LocalDateTime;
import java.util.UUID;

public class MessageStore {

    public String getMessage() {
        return String.format(
            "%s: %s",
            LocalDateTime.now(),
            UUID.randomUUID()
        );
    }

}
