package runners;

import com.intuit.karate.junit5.Karate;

public class NewProductRunner {

    @Karate.Test
    Karate testNewProduct() {
        return Karate.run("classpath:features/new-product.feature");
    }
}