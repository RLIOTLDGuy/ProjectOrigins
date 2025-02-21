buffer = buffer_create(6, buffer_grow, 1);

buffer_write(buffer, buffer_u16, x);
buffer_write(buffer, buffer_u16, y);
buffer_write(buffer, buffer_u8, 100);
buffer_write(buffer, buffer_u8, 50);

buffer_write(buffer, buffer_string, "happy 413 :)");
buffer_write(buffer, buffer_u16, 1337);