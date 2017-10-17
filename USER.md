# Stock Management System User Guide

## Overview
This stock management system ‘charlotte’ aims to aid users in the maintenance of significant inventories of items. Charlotte is a web application which manages inventory counts over a set of locations and sublocations. 
Charlotte is licensed for use following the terms of a standard MIT License [license](LICENSE)

## Navigation
* Navigate to the website via the URL supplied to you by the Adminsitrator.
* Enter the supplied email and password, and press the white “log in” button.
* Login instructions, or a replacement password can be accessed via the links below the white “Log in” button.
* Ticking the “Remember me” box will keep you logged in permanently on the device that is in use.
* After logging in you will be redirected to the home page.

## Home Page
The home page contains links to the major functionality of the stocktake system: Locations and Stock Items. 
* The Locations page will list items under their respective locations.
* The Stock Items page will show all the locations of a particular item. 
Which page you wish to navigate to will depend on the use case, all tiems can be accessed from each section of the site.

## Locations
The locations page is split into three components
* The navigation bar at the top of the page allows for switching between locations and their predecessors, as well as the ability to log out in the right hand corner.
* The reports component (if you have permissions) will create a series of reports for various purposes, jump to the “Reports” section of this document for more information.
* Finally will be the “Location Tree”. Use the ‘+’ and ‘-’ buttons next to the locations to expand/collapse their sublocations.
 * Clicking on a location will take you to a new page showing all of that location’s sublocations, and any items that are not present in a sublocation. 
 * Clicking on a location will allow you to begin a stocktake from that location - More on this in the “Stock Take” section of this document. 
 
## Stock Items
The Stock Items page is split into three components, similarly to the locations page. 
* At the top of the page is the navigation bar. This contains a link to the home page, and indicates your current location. As you navigate through stock items and their locations, the navigation bar will update to include links to previously visited sections of the site
* A section immediately below the navigation bar which (when you click on a stock item) shows the name of the item and certain properties belonging to it
 * Additional properties may be discovered by navigating to a location through the stock item pages. 
* The third section is a table showing all the items in the system. Click on an item to view its locations.Further click on a location to see additional detail for the particular item(s).

## User Tasks
### Stock Take
* Navigate to the location which enompasses all the sublocations you wish to stocktake for
* Begin the stocktake by pressing the ‘stocktake’ link
* The stocktake begins at the first item in the first room
* Use the numpad on the right of the page to modify the quantity to match actual quantity
* ``+`` and - buttons will increment or decrement by 1
* Previous and Next buttons will save and navigate to the next(or previous) item

### Reports
Stock Item reporting is a function that is only accessible to certain users. Check with your administrator to determine whether or not you have the correct permissions.Reports can be accessed through locations.
* Reports are accessed through locations. 
* Navigate to the location that encompasses all areas you wish to be provided information on. (By clicking on the locations and sublocations in the table on the locations page)
* The reports creation options are visible at the top of the page
* Summary Report
  * Display a combined count of all items at a particular location (and sublocations)
* Order-To report
  * Display values of items which should be ordered
    *Items will be expected to be ordered when the current quantity of that item is less than the required quantity. They will suggest re-ordering to the Order-To value (or required value if no Order-To value is present)
* Subtree-Inclusive
  * A significantly more detailed report which shows item summaries over a location (and sublocations) as well as individual item counts per sublocation. 
* Expiry Report
  * Only available with subtree-inclusive. Shows the additional detail of the expiry dates of certain items under their locations. 
  
### CSV Reports
A basic CSV summary is downloadable which contains the contents of the 'Summary Report'. More detail can be obtained by navigating further into the three. It is possible to download the summaries at any location.

## Administrator Features
Administrators primarily have the additional functionality of being able to create and edit users, as well as editing stock items, and location structure. 

### Item Auditing
Auditing features are accessed by navigating to any particular item instance (through the locations page or stock items page.
* Navigate to the location or item of interest
* Click on the item. Auditing logs will be viewable under the secton 'Audits'

### Location Additions
A “new location” button will be made available immediately below the locations table. If you wish to add a sublocation, navigate to the parent location and click the ‘add sublocation’ button.

### Stock Item Addition
A “new location” button will be made available immediately below the locations table. If you wish to add a sublocation, navigate to the parent location and click the ‘add sublocation’ button.

### Item Addition
There exists the ability to edit the ‘required’ quantity and ‘order-to’ quantities for each location. Do so by navigating to the location, selecting the stock item and pressing the edit button

### User Administration
Additional functionality is available from the home page. The users page allows for the creation and editing of user rights 
