package org.example.vertx_starter;

import io.vertx.core.AbstractVerticle;
import io.vertx.core.Promise;
import io.vertx.core.http.HttpServerRequest;
import io.vertx.core.json.JsonObject;
import io.vertx.core.spi.observability.HttpRequest;

public class MainVerticle extends AbstractVerticle {

    @Override
    public void start(Promise<Void> startPromise) throws Exception {
        vertx.createHttpServer()
            .requestHandler(MainVerticle::handle)
            .listen(
                8888,
                http -> {
                    if (http.succeeded()) {
                        startPromise.complete();
                        System.out.println("HTTP server started on port 8888");
                    } else {
                        startPromise.fail(http.cause());
                    }
                }
            );
    }

    private static void handle(HttpServerRequest req) {
        JsonObject object = new JsonObject()
            .put("name", "Vert.x Starter")
            .put("version", "1.0.0")
            .put("current-time", System.currentTimeMillis())
            .put("javaVersion", System.getProperty("java.version"));
        req.response()
            .putHeader("content-type", "application/json")
            .end(object.toString());
    }
}
