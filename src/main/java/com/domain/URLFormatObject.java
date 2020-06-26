package com.domain;

public class URLFormatObject {

    private String protocol;
    private String domainName;
    private String ipAddress;
    private String port;
    private String path;

    public String getProtocol() {
        return protocol;
    }

    public void setProtocol(String protocol) {
        this.protocol = protocol;
    }

    public String getDomainName() {
        return domainName;
    }

    public void setDomainName(String domainName) {
        this.domainName = domainName;
    }

    public String getIpAddress() {
        return ipAddress;
    }

    public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress;
    }

    public String getPort() {
        return port;
    }

    public void setPort(String port) {
        this.port = port;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    @Override
    public String toString() {
        String returnString ="";
        if(protocol!=null && !protocol.isEmpty())
            returnString = returnString.concat("Protocol: ").concat(this.protocol);
        if(domainName!=null && !domainName.isEmpty())
            returnString = returnString.concat(" || DomainName: ").concat(this.domainName);
        if(ipAddress!=null && !ipAddress.isEmpty())
            returnString = returnString.concat(" || ipAddress: ").concat(this.ipAddress);
        if(port!=null && !port.isEmpty())
            returnString = returnString.concat(" || port: ").concat(this.port);
        if(path!=null && !path.isEmpty())
            returnString = returnString.concat(" || path: ").concat(this.path);

        return returnString;

    }
}
