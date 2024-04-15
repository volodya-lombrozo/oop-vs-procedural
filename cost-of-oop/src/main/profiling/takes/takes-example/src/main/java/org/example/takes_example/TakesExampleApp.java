package org.example.takes_example;

import java.io.IOException;
import java.util.concurrent.atomic.AtomicLong;
import org.takes.Request;
import org.takes.Response;
import org.takes.Take;
import org.takes.facets.fork.FkRegex;
import org.takes.facets.fork.TkFork;
import org.takes.http.Exit;
import org.takes.http.FtBasic;
import org.takes.rq.RqHref;
import org.takes.rs.RsText;
import org.takes.rs.RsWithType;

public class TakesExampleApp {

    private static final AtomicLong COUNTER = new AtomicLong(0L);

    public static void main(String[] args) throws IOException {
        new FtBasic(
            new TkFork(
                new FkRegex(
                    "/message",
                    new JsonResponse()
                )
            ),
            8080
        ).start(Exit.NEVER);
    }

    private static class JsonResponse implements Take {

        @Override
        public Response act(final Request req) throws IOException {
            return new RsWithType(
                new RsText(
                    String.format(
                        "{\"id\":\"%d\",\"client_timestamp\":\"%s\",\"timestamp\":\"%d\"}",
                        TakesExampleApp.COUNTER.incrementAndGet(),
                        new RqHref.Smart(req).single("timestamp"),
                        System.currentTimeMillis()
                    )
                ),
                "application/json"
            );
        }
    }
}
