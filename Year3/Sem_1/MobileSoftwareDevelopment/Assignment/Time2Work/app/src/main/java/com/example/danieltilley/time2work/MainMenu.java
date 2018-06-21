package com.example.danieltilley.time2work;


import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;

//Main menu class that is loaded up first upon starting the app
public class MainMenu extends BaseDrawerActivity{

    //variables
    private String USER_PREFS_NAME;
    private String PREFS_KEY_FIRST_NAME;
    private String PREFS_KEY_LAST_NAME;
    private String PREFS_KEY_BUSINESS_NAME;
    private String PREFS_KEY_HOURLY_RATE;
    SharedPreferences UserPrefs; //shared preferences object
    SharedPreferences.Editor editor; //shared prefs editor

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getLayoutInflater().inflate(R.layout.activity_main_menu, frameLayout);
        setTitle(getString(R.string.page_title_main_menu));

        //initialise variables
        initialise();

        //check if the user has signed up or not
        if (!(UserPrefs.contains(PREFS_KEY_FIRST_NAME) &&
                UserPrefs.contains(PREFS_KEY_LAST_NAME) &&
                UserPrefs.contains(PREFS_KEY_BUSINESS_NAME) &&
                UserPrefs.contains(PREFS_KEY_HOURLY_RATE))) {

            startActivity(new Intent(getApplicationContext(), SignUp.class));
        }//end if
    }//end onCreate


    //initialise
    public void initialise(){
        //Shared preferences
        USER_PREFS_NAME = this.getString(R.string.user_prefs_file); //shared preferences file
        PREFS_KEY_FIRST_NAME = this.getString(R.string.user_prefs_first_name_key);
        PREFS_KEY_LAST_NAME = this.getString(R.string.user_prefs_last_name_key);
        PREFS_KEY_BUSINESS_NAME = this.getString(R.string.user_prefs_business_name_key);
        PREFS_KEY_HOURLY_RATE = this.getString(R.string.user_prefs_hourly_rate_key);
        UserPrefs = getSharedPreferences(USER_PREFS_NAME, 0);
        editor = UserPrefs.edit();
    }//end initialise
}//end class
