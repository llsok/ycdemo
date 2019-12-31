package com.yc.http.tomcat.v3;

import java.util.HashMap;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

public class WebXmlParser {
	
	private HashMap<String, String> contentTypeMap = new HashMap<>();

	@SuppressWarnings("unchecked")
	public WebXmlParser(String webPath) {
		SAXReader reader = new SAXReader();
		Document doc;
		try {
			doc = reader.read(WebXmlParser.class.getResourceAsStream("web.xml"));
		} catch (DocumentException e) {
			throw new RuntimeException(e);
		}
		
		for (Element no : (List<Element>) doc.getRootElement().elements("mime-mapping")) {
			// 鏂囦欢鍚嶅悗缂�
			String suffix = no.element("extension").getText();
			String contentType = no.element("mime-type").getText();
			contentTypeMap.put(suffix, contentType);
		}
	}
	
	public String getContentType(String suffix){
		String contentType = contentTypeMap.get(suffix);
		return contentType == null ? "text/html" : contentType;
	}
	
}
