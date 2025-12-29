package runners;

import com.intuit.karate.junit5.Karate;

public class CommentsRunner {

    @Karate.Test
    Karate testComments() {
        return Karate.run("classpath:features/posts/comments.feature");
    }
}