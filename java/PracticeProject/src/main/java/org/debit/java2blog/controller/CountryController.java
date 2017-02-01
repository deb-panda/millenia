package org.debit.java2blog.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.debit.java2blog.bean.Country;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CountryController {
	
	@RequestMapping(value = "/countries", method = RequestMethod.GET,headers="Accept=application/json")
	public List<Country> getCountries(HttpServletRequest request)
	{
		System.out.println("Request uri is --> "+request.getRequestURI());
		List<Country> listOfCountries = new ArrayList<Country>();
		listOfCountries=createCountryList();
		System.out.println("This is a test");
		
		return listOfCountries;
	}
	
	@RequestMapping(value = "/countries1", method = RequestMethod.GET,headers="Accept=application/json",produces="application/json")
	public Map<String,List<List>>  getCountries1()
	{
		System.out.println("This is a test1");
		
		List<String>returnList = createStringList();
		List  mainList = new ArrayList<String>();
		mainList.add(returnList);
		Map<String,List<List>> demoMap = new HashMap<String,List<List>>();
		demoMap.put("datas", mainList);
		return demoMap;
	}

	@RequestMapping(value = "/country/{id}", method = RequestMethod.GET,headers="Accept=application/json")
	public Country getCountryById(@PathVariable int id)
	{
		List<Country> listOfCountries = new ArrayList<Country>();
		listOfCountries=createCountryList();

		for (Country country: listOfCountries) {
			if(country.getId()==id)
				return country;
		}
		
		return null;
	}

// Utiliy method to create country list.
	public List<Country> createCountryList()
	{
		Country indiaCountry=new Country(1, "India");
		Country chinaCountry=new Country(4, "China");
		Country nepalCountry=new Country(3, "Nepal");
		Country bhutanCountry=new Country(2, "Bhutan");

		List<Country> listOfCountries = new ArrayList<Country>();
		listOfCountries.add(indiaCountry);
		listOfCountries.add(chinaCountry);
		listOfCountries.add(nepalCountry);
		listOfCountries.add(bhutanCountry);
		return listOfCountries;
	}
	
	
	public List<String> createStringList(){
		List<String> strList = new ArrayList<String>();
		strList.add("A");
		strList.add("B");
		strList.add("C");
		strList.add("D");
		return strList;
		
	}
}
