package test.com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class AppController {
//    @RequestMapping("/")
//    public String helloPage() {
//        return "order";
//    }

//    @RequestMapping("/order")
//    public String iRockPage() {
//        return "order";
//    }
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView welcomePage(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/order");
        return modelAndView;
    }
}
