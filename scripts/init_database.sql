/*
===============================================================================
Database Initialization
===============================================================================
Script Purpose:
    This script creates the Bronze, Silver, and Gold databases.

WARNING:
    Running this script will drop the existing bronze, silver, and gold
    databases if they exist.

    All data in those databases will be permanently deleted.
===============================================================================
*/

-- Drop existing databases
DROP DATABASE IF EXISTS bronze;
DROP DATABASE IF EXISTS silver;
DROP DATABASE IF EXISTS gold;

-- Create Bronze database
CREATE DATABASE bronze;

-- Create Silver database
CREATE DATABASE silver;

-- Create Gold database
CREATE DATABASE gold;