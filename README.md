# ManOfMaths

First we will deal with the table: we will present a list a famous mathematicians



<img src="/images/table.PNG" alt="Drawing" style="width: 100px;"/>

After we have an editable and serializable list we can add the search functionality.

Here is the complete list of code task (work in progress) to complete the task


  **Build the screen to add/edit a Mathematician**

We will build a screen with two TextFields and a UIImage, on the textfield the user will write down the
name and year of birth of the mathematician. We will add a GestureRecognizer in order to get a photo of the 
users photo library.

**Build the TableList**

This screen will present the list of the mathematicians. Note that we will need to create a CustomCell.

**Define your Data model**

The MathMan.h and MathMan.m will modelize a mathematician.

**Implement navegation**

We will use navigation controllers and segues to create the navigation flow of our application.

**Implement edit and delete behaviour**

We will use the prepareForSegue: method to identifiy which segue is ocurring and display the apropiate information on the MathsMan screen. You’ll differentiate the segues based on the identifiers you assigned to them earlier: AddItem (modal segue) and ShowDetail (show segue).

**To update the implementation of unwindToMealList: to add or replace Mathematicians**

At this point, you should be able to click a table view cell to navigate to the MathMan scene, and see it prepopulated with data about the mathematician. If you click Save, the changes you made should overwrite the existing mathematician in the list.

**Persist Data**

We will need to save a mathematician list across app sessions. We'll use NSCoding as the data persistence mechanism.

**Implement the search behaviour**

We will use the UISearchController.


