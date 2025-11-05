package runners;

import com.intuit.karate.junit5.Karate;

public class GeneralRunner {

    @Karate.Test
    Karate testUserPostComment() {
        return Karate.run("classpath:features/").tags("@create");
    };
    }