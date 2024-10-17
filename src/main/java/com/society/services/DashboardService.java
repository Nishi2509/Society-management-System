package com.society.services;

import java.util.HashMap;

public interface DashboardService {

    HashMap getPaidAndUnpaidOwners(String year, String month, int blockId);

    HashMap getDasBlockDetails(int blockId);

    HashMap getDasDetails();

    HashMap getUserDasDetails();
}
