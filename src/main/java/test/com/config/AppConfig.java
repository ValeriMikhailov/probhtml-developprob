package test.com.config;

import test.com.dao.OrderDao;
import test.com.dao.impl.OrderDaoImpl;
import test.com.entity.Order;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
//@PropertySource(value = {"classpath:auth.properties"})
public class AppConfig {
//    @Autowired
//    private Environment environment;

//    @Bean
//    public UserDetailsService userDetailsService() {
//        JdbcDaoImpl jdbcDao = new JdbcDaoImpl();
//        jdbcDao.setDataSource(dataSource());
//        jdbcDao.setUsersByUsernameQuery(environment.getRequiredProperty("usersByQuery"));
//        jdbcDao.setAuthoritiesByUsernameQuery(environment.getRequiredProperty("rolesByQuery"));
//        return jdbcDao;
//    }

//    @Bean
//    public DriverManagerDataSource dataSource() {
//        DriverManagerDataSource dataSource = new DriverManagerDataSource();
//        dataSource.setDriverClassName(environment.getRequiredProperty("jdbc.postgresql.driver"));
//        dataSource.setUrl(environment.getRequiredProperty("jdbc.postgresql.url"));
//        dataSource.setUsername(environment.getRequiredProperty("jdbc.postgresql.name"));
//        dataSource.setPassword(environment.getRequiredProperty("jdbc.postgresql.password"));
//        return dataSource;
//    }

//    @Bean
//    public JdbcTemplate jdbcTemplate() {
//        JdbcTemplate jdbcTemplate = new JdbcTemplate();
//        jdbcTemplate.setDataSource(dataSource());
//        return jdbcTemplate;
//    }

    @Bean
    public OrderDao orderDao(){
        return new OrderDaoImpl(Order.class);
    }
}
