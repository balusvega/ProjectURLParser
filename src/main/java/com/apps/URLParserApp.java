package com.apps;

import com.exceptions.InvalidURLFormatException;
import com.modules.URLParser;

public class URLParserApp {

    public static void main(String[] args) {

        URLParser aParser = new URLParser();
        String result=null;

    // TC:1 - Validate if URL format is correct with a domain name

        result = URLParserApp.testURLFormat(aParser, "http://www.testdomain.com/testpath");
//        System.out.println(result);
        if(result.equals("Protocol: http || DomainName: www.testdomain.com || path: testpath"))
            System.out.println("Test Case of valid URL domain name is PASSED  "+result);
        else
            System.out.println("Test Case of valid URL domain name is FAILED  "+result);

        // TC:2 - Validate if URL format is correct with an IP Address
        result = URLParserApp.testURLFormat(aParser, "http://24.106.206.2:10080/autotools");
//        System.out.println(result);
        if(result.equals("Protocol: http || ipAddress: 24.106.206.2 || port: 10080 || path: autotools"))
            System.out.println("Test Case of valid URL with IP Address is PASSED  "+result);
        else
            System.out.println("Test Case of valid URL with IP Address is FAILED  "+result);

        // TC:3 - Validate if URL format is correct with a domain name and extended path
        result = URLParserApp.testURLFormat(aParser, "http://www.testdomain.com/testpath1/testpath2/testpath3");

        if(result.equals("EXCEPTION"))
            System.out.println("Test Case of invalid URL domain name is PASSED  "+result);
        else
            System.out.println("Test Case of invalid URL domain name is FAILED  "+result);


    }

    private static  String testURLFormat(URLParser aURLParser, String URLInput){
        String result;
        try {
            result = aURLParser.parseURL(URLInput).toString();

        } catch (InvalidURLFormatException exp) {
            result = "EXCEPTION";
        }
        return result;
    }
}
