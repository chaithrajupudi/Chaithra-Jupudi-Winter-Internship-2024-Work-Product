# Chaithra-Jupudi-Winter-Internship-2024-Work-Product

This repository consists of the work I have done during my internship. As our team is customer facing, I have committed information and code that can be publicly exposed separately into this repository.

The repository contains two branches, each representing a distinct project I worked on:

- **buyer-app**: This branch includes Dart files for the application's UI and Node.js files for the APIs used.
  
- **mystore-landing-zone**: Here, you'll find code related to the deployment and infrastructure of the mystore application.
# Buyer app - Voice Enabled Shopping

## Introduction
This document outlines the design for a buyer application that leverages voice interaction for a completely voice-driven shopping experience. The app will utilize a central database (PostgreSQL) and Google Cloud Platform (GCP) storage for product information and image hosting, respectively.

## Functionality
### Database Integration:
* The app will connect to a central PostgreSQL database to retrieve product information.
* An API call will be made to fetch relevant product data based on user search queries.

### Voice Search:
* Users will be able to search for products using natural language voice commands.
* The app will leverage speech recognition technology to convert spoken words into search queries.

### App navigation:
* Users can navigate through the product list using voice commands (e.g., "scroll down," "scroll up"). The app will respond accordingly
* The users can also add the products to the cart or wishlist with voice commands.

### Voice Purchase:
* Users can select a product for purchase by specifying a unique identifier (e.g., "buy the third one").
* The app will process the voice command and initiate the purchase process (potentially directing the user to a separate payment gateway through voice instructions).


## Technology stack
### Backend
* Programming Language : Node JS
* Database: PostgreSQL
### Frontend:
* Mobile development framework: FlutterFlow
* Speech Recognition API
* Text-to-Speech API for voice feedback from the app


### User Experience (UX) Flow
1. User opens the app.
2. User gives a voice search command (e.g., "I want to buy a Kanchipuram saree").
3. The app utilizes speech recognition to convert the command into a search query.
4. An API call is made to the PostgreSQL database to retrieve relevant product information.
5. User navigates through the product list using voice commands.
6. User adds the product of their choice to the cart or wish list to view later
7. User selects an individual product for purchase by specifying a unique identifier or describing a specific attribute (voice command).
8. The user may also navigate to the cart page through voice and proceed to checkout by giving a voice command.
9. The app processes the voice command and initiates the purchase process where the user can select the mode of payment of their choice. 
10. The order is confirmed and expected delivery date is displayed.


## Detailed Explanation Of Middleware Use Cases
### Text Translation (Optional):
This is useful when the buyer app needs to support voice search in multiple languages. The API can identify the language of a spoken phrase for further translation.

### UI Action (Core Functionality):
This API is crucial for the buyer app as it converts voice commands into actionable UI commands for searching, navigating product listings, and initiating purchases.

Middleware usecases  | APIs           | End points                                               |
-------------------- | -------------- | -------------------------------------------------------  |
Text Translation     | detect-remote  | https://apps.gcpwkshpdev.com/languages/detect            |
UI Action            | UIAction-Text  | https://apps.gcpwkshpdev.com/text/action/v2?type=json    |

## Figma screens
<p align="center">
    <img src="https://github.com/chaithrajupudi/Chaithra-Jupudi-Winter-Internship-2024-Work-Product/blob/buyer-app/assets/Home.png" width="200" height="auto"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <img src="https://github.com/chaithrajupudi/Chaithra-Jupudi-Winter-Internship-2024-Work-Product/blob/buyer-app/assets/Microphone%20greeting.png" width="200" height="auto"/>
</p>
<p align="center">
    <img src="https://github.com/chaithrajupudi/Chaithra-Jupudi-Winter-Internship-2024-Work-Product/blob/buyer-app/assets/Microphone%20search.png" width="200" height="auto"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <img src="https://github.com/chaithrajupudi/Chaithra-Jupudi-Winter-Internship-2024-Work-Product/blob/buyer-app/assets/Microphone%20search%20action.png" width="200" height="auto"/>
</p>
<p align="center">
    <img src="https://github.com/chaithrajupudi/Chaithra-Jupudi-Winter-Internship-2024-Work-Product/blob/buyer-app/assets/Search%20results.png" width="200" height="auto"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <img src="https://github.com/chaithrajupudi/Chaithra-Jupudi-Winter-Internship-2024-Work-Product/blob/buyer-app/assets/Search%20results%20action.png" width="200" height="auto"/>
</p>
<p align="center">
    <img src="https://github.com/chaithrajupudi/Chaithra-Jupudi-Winter-Internship-2024-Work-Product/blob/buyer-app/assets/Added%20to%20cart.png" width="200" height="auto"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <img src="https://github.com/chaithrajupudi/Chaithra-Jupudi-Winter-Internship-2024-Work-Product/blob/buyer-app/assets/Product%20details.png" width="200" height="auto"/>
</p>
<p align="center">
    <img src="https://github.com/chaithrajupudi/Chaithra-Jupudi-Winter-Internship-2024-Work-Product/blob/buyer-app/assets/Cart.png" width="200" height="auto"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <img src="https://github.com/chaithrajupudi/Chaithra-Jupudi-Winter-Internship-2024-Work-Product/blob/buyer-app/assets/Payment.png" width="200" height="auto"/>
</p>
<p align="center">
    <img src="https://github.com/chaithrajupudi/Chaithra-Jupudi-Winter-Internship-2024-Work-Product/blob/buyer-app/assets/Order%20placed.png" width="200" height="auto" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <img src="https://github.com/chaithrajupudi/Chaithra-Jupudi-Winter-Internship-2024-Work-Product/blob/buyer-app/assets/Languages.png" width="200" height="auto"/>
</p>

## Database Integration for Buyer & Seller App 
### Data Model
The database will consist of the following core tables:
1. Products:
    * index (integer)
    * name (string)
    * price (float)
    * rating (float)
    * image (string)
    * description (string)
    * is_favorite (boolean)
    * is_in_cart (boolean)
    * quantity (float)
    * category (string)
2. Sellers:
    * id (integer)
    * username (string)
    * password (string)

### Database Interactions
The application will interact with the PostgreSQL database using the following operations:

**Buyer App:**
* Read operation
  * Search for products based on title, description, attributes or category (by querying the Products table).
  * Retrieve product details (title, description, image URL, attributes) for a specific product ID.

**Seller App:**
* Create operation
  * Create a new product entry (inserting data into the Products table).

* Read operation
  * Retrieve a list of all products created by a specific seller (using seller_id in the Products table).
  * Retrieve details of a specific product for editing (using product ID in the Products table)

* Update operation
  * Update product details (title, description, attributes) for a specific product (updating relevant fields in the Products table).

* Delete operation
  * Delete a product (deleting the corresponding entry from the Products table).
