package com.modules;

import com.domain.URLFormatObject;
import com.exceptions.InvalidURLFormatException;

public class URLParser {

    public URLFormatObject parseURL(String url) throws InvalidURLFormatException{

//        System.out.println("URL passed: "+url);
        URLFormatObject formatObject = new URLFormatObject();
        String [] urlSplits = url.split("/");
//        System.out.println("urlSplits total:"+urlSplits.length);

        if(urlSplits.length!= 4 || !urlSplits[0].equalsIgnoreCase("http:"))
           throw new InvalidURLFormatException();

//        System.out.println("ITS HERE");
//        System.out.println("protocol: "+urlSplits[0].split(":")[0]);
//        System.out.println("path : "+urlSplits[3]);

        formatObject.setProtocol(urlSplits[0].split(":")[0]);
        formatObject.setPath(urlSplits[3]);

        String [] urlSubSlits = urlSplits[2].split("\\.");
//        System.out.println("length of urlSubSplits: "+urlSubSlits.length);

        if(!(urlSubSlits.length==3 || urlSubSlits.length==4))
            throw new InvalidURLFormatException();

//        System.out.println("its after urlSubSplits");

//
//        if(urlSplits.length!= 4 || !urlSplits[0].equalsIgnoreCase("http:")
//            || (urlSplits[2].split("\\.").length!=3
//                || urlSplits[2].split("\\.").length!=4))
//            throw new InvalidURLFormatException();
        // if it is 3 splits then first one has to be www
        // if it is 4 splits then first three have to be numbers and fourth one split on :
        //  should be number

        if(urlSubSlits.length==3){
            if(!urlSubSlits[0].equalsIgnoreCase("www"))
                throw new InvalidURLFormatException();
            formatObject.setDomainName(urlSplits[2]);
        }
        int portNumber =0;
        if(urlSubSlits.length==4){
            try {
                Integer.parseInt(urlSubSlits[0]);
                Integer.parseInt(urlSubSlits[1]);
                Integer.parseInt(urlSubSlits[2]);
                String [] portSplits = urlSubSlits[3].split(":");
                if(portSplits.length!=2)
                    throw new InvalidURLFormatException();
                else{
                    Integer.parseInt(portSplits[0]);
                    portNumber = Integer.parseInt(portSplits[1]);
                    formatObject.setPort(new Integer(portNumber).toString());
                }
               formatObject.setIpAddress(urlSplits[2].split(":")[0]);
            }catch (NumberFormatException exp){
                throw new InvalidURLFormatException();
            }
        }

        return formatObject;
    }
}
