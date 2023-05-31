package com.kh.finalkh11.controller;

import java.io.File;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalkh11.configuration.CustomFileuploadProperties;

@RestController
@RequestMapping("/img")
public class ImgController {
	@Autowired private CustomFileuploadProperties fileuploadProperties;
	
	private File dir;
	@PostConstruct
	public void init() {
		dir = new File(fileuploadProperties.getPath());
	}
	 
}
