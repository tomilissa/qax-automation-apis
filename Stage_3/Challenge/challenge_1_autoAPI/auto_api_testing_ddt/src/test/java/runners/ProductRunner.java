package runners;

import com.intuit.karate.junit5.Karate;

public class ProductRunner {

    @Karate.Test
    Karate testProduct() {
        return Karate.run("classpath:features/test-product.feature");
    }
}