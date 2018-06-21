package com.example.danieltilley.time2work;

import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import java.text.SimpleDateFormat;

//This class displays a list of months to the users. A user picks a month and is brought to the DisplayHours Screen
public class Display extends BaseDrawerActivity {

    //Variables
    ListView monthsList;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getLayoutInflater().inflate(R.layout.activity_display, frameLayout);
        setTitle(getString(R.string.page_title_display));

        //create variables
        initialise();

        //set onclick listener
        monthsList.setOnItemClickListener(new AdapterView.OnItemClickListener() {

            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {

                // ListView Clicked item index
                int itemPosition = position;
                // ListView Clicked item value
                String itemValue = (String) monthsList.getItemAtPosition(position);

                //New intent to go to the Display hours class
                Intent i = new Intent(getApplicationContext(), DisplayHours.class);

                //Key that determines what data to show on next screen
                //get the item position and add the year to it
                String strName = getItemToString(itemPosition);
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy");
                String thisYear = formatter.format( new java.util.Date() );
                strName += "/" + thisYear;

                //Add key to intent and start activity
                i.putExtra("MONTH_KEY", strName);
                startActivity(i);

            }//end onItemClick
        });//end setOnItemClickListener
    }//end onCreate


    //method that converts the item position to month string
    public String getItemToString(int i){

        //String to return
        String month = null;

        //switch statement to determine the month
        switch (i){
            case 0:{
                month = "01";
                break;
            }//end case

            case 1:{
                month = "02";
                break;
            }//end case

            case 2:{
                month = "03";
                break;
            }//end case

            case 3:{
                month = "04";
                break;
            }//end case

            case 4:{
                month = "05";
                break;
            }//end case

            case 5:{
                month = "06";
                break;
            }//end case

            case 6:{
                month = "07";
                break;
            }//end case

            case 7:{
                month = "08";
                break;
            }//end case

            case 8:{
                month = "09";
                break;
            }//end case

            case 9:{
                month = "10";
                break;
            }//end case

            case 10:{
                month = "11";
                break;
            }//end case

            case 11:{
                month = "12";
                break;
            }//end case
        }//end switch

        return month; //return month id
    }//end getItemToString


    //initialise variables
    public void initialise(){
        //get array in string file
        Resources resources = getResources();
        String[] months = resources.getStringArray(R.array.Months);

        //find listview
        monthsList = (ListView) findViewById(R.id.monthsList);

        //create adapter
        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this,
                android.R.layout.simple_list_item_1, android.R.id.text1, months);

        //assign adapter to list
        monthsList.setAdapter(adapter);
    }//end initialise


    //Used to finish activity
    public boolean onNavigationItemSelected(MenuItem item) {
        super.onNavigationItemSelected(item);
        finish();
        return true;
    }//end onNavigationItemSelected
}//end class
