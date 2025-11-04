package runners;

import com.intuit.karate.junit5.Karate;

public class UserRunner {

    @Karate.Test
    Karate testGetUser() {
        return Karate.run("classpath:features/bookStore").tags("@get, @create1");
    }
}