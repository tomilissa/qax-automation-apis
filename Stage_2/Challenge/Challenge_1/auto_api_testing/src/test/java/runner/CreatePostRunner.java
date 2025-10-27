package runners;

import com.intuit.karate.junit5.Karate;

public class CreatePostRunner {

    @Karate.Test
    Karate testCreatePost() {
        return Karate.run("classpath:features/posts/create-post.feature");
    }
}