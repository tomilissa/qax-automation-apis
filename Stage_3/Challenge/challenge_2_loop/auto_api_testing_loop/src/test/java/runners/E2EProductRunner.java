package runners;

import com.intuit.karate.junit5.Karate;

public class E2EProductRunner {

    @Karate.Test
    Karate testE2EProduct() {
        return Karate.run("classpath:features/E2E-product.feature");
    }
}