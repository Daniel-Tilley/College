package com.example.danieltilley.time2work;

import android.os.Bundle;
import android.view.View;

//This class extends the enter details class and calls alot of its methods
public class SignUp extends EnterDetails {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_enter_details);
        super.initialise();
    }//end onCreate


    @Override
    public void onBackPressed() {

        //don't allow user to go back if they have not signed up for first time.
        if (super.checkAlreadyStored()){
            super.onBackPressed();
        }//end if
    }//end onBackPressed


    //methods that are called when buttons are clicked on screen
    //onclick listeners implemented in xml
    public void submitDetails (View v){

        if (super.checkEnteredDetails()){
            super.submitDetails(v);
            finish();
        }//end if
    }//end submit details


    //set all edit text fields to blank
    public void resetDetails (View v){
        super.resetDetails(v);
    }//end reset details
}//end class