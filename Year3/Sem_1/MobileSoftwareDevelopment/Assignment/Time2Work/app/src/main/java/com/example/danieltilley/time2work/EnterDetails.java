package com.example.danieltilley.time2work;

import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.MenuItem;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class EnterDetails extends BaseDrawerActivity {

    //declare variables
    private String USER_PREFS_NAME;
    private String PREFS_KEY_FIRST_NAME;
    private String PREFS_KEY_LAST_NAME;
    private String PREFS_KEY_BUSINESS_NAME;
    private String PREFS_KEY_HOURLY_RATE;
    private final String PREFS_KEY_NOT_FOUND = "Not found";
    SharedPreferences UserPrefs; //shared preferences object
    SharedPreferences.Editor editor; //shared prefs editor

    private TextView firstNameTextView;
    private TextView lastNameTextView;
    private TextView businessNameTextView;
    private TextView hourlyRateTextView;

    private EditText firstNameEditText;
    private EditText lastNameEditText;
    private EditText businessNameEditText;
    private EditText hourlyRateEditText;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getLayoutInflater().inflate(R.layout.activity_enter_details, frameLayout);
        setTitle(getString(R.string.page_title_enter_details));
        initialise();

        //check if items have been already stored or not
        if (checkAlreadyStored()){
            setStoredText();
        }//end if
    }//end onCreate


    @Override
    public void onBackPressed() {

        //don't allow user to go back if they have not signed up for first time.
        if (checkAlreadyStored()){
            super.onBackPressed();
        }//end if
    }//end onBackPressed


    //initialise variables
    public void initialise(){

        //Text Views
        firstNameTextView = (TextView) findViewById(R.id.textView_first_name);
        lastNameTextView = (TextView) findViewById(R.id.textView_last_name);
        businessNameTextView = (TextView) findViewById(R.id.textView_business_name);
        hourlyRateTextView = (TextView) findViewById(R.id.textView_hourly_rate);

        //Edit Texts
        firstNameEditText = (EditText) findViewById(R.id.editText_first_name);
        lastNameEditText = (EditText) findViewById(R.id.editText_last_name);
        businessNameEditText = (EditText) findViewById(R.id.editText_business_name);
        hourlyRateEditText = (EditText) findViewById(R.id.editText_hourly_rate);

        //Shared preferences
        USER_PREFS_NAME = this.getString(R.string.user_prefs_file); //shared preferences file
        PREFS_KEY_FIRST_NAME = this.getString(R.string.user_prefs_first_name_key);
        PREFS_KEY_LAST_NAME = this.getString(R.string.user_prefs_last_name_key);
        PREFS_KEY_BUSINESS_NAME = this.getString(R.string.user_prefs_business_name_key);
        PREFS_KEY_HOURLY_RATE = this.getString(R.string.user_prefs_hourly_rate_key);
        UserPrefs = getSharedPreferences(USER_PREFS_NAME, 0);
        editor = UserPrefs.edit();
    }//end initialise


    //methods that are called when buttons are clicked on screen
    //onclick listeners implemented in xml
    public void submitDetails (View v){

        //check if no details are blank
        if (checkEnteredDetails()){

            //Send details to shared preferences file
            sendToFile();

            //Toast to tell user details have been submitted
            Toast.makeText(getApplicationContext(), R.string.toast_details_submitted,Toast.LENGTH_SHORT).show();
        }//end if
    }//end submit details


    //set all edit text fields to blank
    public void resetDetails (View v){

        //set to blank
        firstNameEditText.setText("");
        lastNameEditText.setText("");
        businessNameEditText.setText("");
        hourlyRateEditText.setText("");

        //Toast to tell user details have been reset
        Toast.makeText(getApplicationContext(), R.string.toast_details_reset,Toast.LENGTH_SHORT).show();
    }//end reset details


    //sends details to shared preferences file
    public void sendToFile(){

        //get variables and send to file
        editor.putString(PREFS_KEY_FIRST_NAME, firstNameEditText.getText().toString());
        editor.putString(PREFS_KEY_LAST_NAME, lastNameEditText.getText().toString());
        editor.putString(PREFS_KEY_BUSINESS_NAME, businessNameEditText.getText().toString());
        editor.putString(PREFS_KEY_HOURLY_RATE, hourlyRateEditText.getText().toString());
        editor.commit();
    }//end send to file


    //checks if user has already stored shared preferences
    public boolean checkAlreadyStored(){

        //checks if shared preferences file contains the data
        if (UserPrefs.contains(PREFS_KEY_FIRST_NAME) &&
                UserPrefs.contains(PREFS_KEY_LAST_NAME) &&
                UserPrefs.contains(PREFS_KEY_BUSINESS_NAME) &&
                UserPrefs.contains(PREFS_KEY_HOURLY_RATE)) {
            return true;
        }//end if

        else{
            return false;
        }//end else
    }//end checkAlreadyStored


    //method to set the Edit text to already entered details
    public void setStoredText(){
        firstNameEditText.setText(UserPrefs.getString(PREFS_KEY_FIRST_NAME,PREFS_KEY_NOT_FOUND));
        lastNameEditText.setText(UserPrefs.getString(PREFS_KEY_LAST_NAME,PREFS_KEY_NOT_FOUND));
        businessNameEditText.setText(UserPrefs.getString(PREFS_KEY_BUSINESS_NAME,PREFS_KEY_NOT_FOUND));
        hourlyRateEditText.setText(UserPrefs.getString(PREFS_KEY_HOURLY_RATE,PREFS_KEY_NOT_FOUND));
    }//end set stored text


    //check if info entered is blank
    public boolean checkEnteredDetails(){

        //initialise variables
        String origionalMessage = "The following fields are blank: ";
        String errorMessage = "The following fields are blank: "; //will be displayed on screen to user

        //check if fields are blank
        if (firstNameEditText.getText().toString().equals("")){
            errorMessage += "First name, ";
        }//end if

        if (lastNameEditText.getText().toString().equals("")){
            errorMessage += "Last name, ";
        }//end if

        if (businessNameEditText.getText().toString().equals("")){
            errorMessage += "Business name, ";
        }//end if

        if (hourlyRateEditText.getText().toString().equals("")){
            errorMessage += "Hourly rate, ";
        }//end if

        //check contents of message
        if (errorMessage.equals(origionalMessage)){
            return true;
        }//end if

        else{
            //Tidy error message up and remove comma at end of string.
            StringBuilder tidyString = new StringBuilder(errorMessage);
            tidyString.deleteCharAt(tidyString.length()-2);

            //Toast to tell user details are blank
            Toast.makeText(getApplicationContext(),tidyString,Toast.LENGTH_LONG).show();
            errorMessage = origionalMessage;
            return false;
        }//end else
    }//end checkEnteredDetails


    //Used to finish activity
    public boolean onNavigationItemSelected(MenuItem item) {
        super.onNavigationItemSelected(item);

        finish();
        return true;
    }//end onNavigationItemSelected
}//end class
