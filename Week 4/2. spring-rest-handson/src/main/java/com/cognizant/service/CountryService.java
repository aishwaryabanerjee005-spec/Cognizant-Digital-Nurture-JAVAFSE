package com.cognizant.service;

import com.cognizant.model.Country;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CountryService {
    public List<Country> getAllCountries() {
        List<Country> countries = new ArrayList<>();
        countries.add(new Country("IN", "India"));
        countries.add(new Country("US", "United States"));
        countries.add(new Country("UK", "United Kingdom"));
        return countries;
    }
}
