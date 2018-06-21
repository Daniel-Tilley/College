package com.example.danieltilley.time2work;


import android.app.DatePickerDialog;
import android.app.TimePickerDialog;
import android.os.Bundle;
import android.view.MenuItem;
import android.view.View;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.TimePicker;
import android.widget.Toast;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import DAO.DBManager;

//This class is responsible for taking in data about events such as time, date etc.

//Reference, code taken from:
// http://stackoverflow.com/questions/14933330/datepicker-how-to-popup-datepicker-when-click-on-edittext

public class InputScreen extends BaseDrawerActivity {

    //Variables
    private DatePickerDialog.OnDateSetListener date;
    private Calendar dateCalendar;
    private Calendar timeCalendar;
    private EditText editTextDate;
    private EditText editTextStartTime;
    private EditText editTextEndTime;
    private EditText editTextComments;
    private DBManager db;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getLayoutInflater().inflate(R.layout.activity_input_screen, frameLayout);
        setTitle(getString(R.string.page_title_input_screen));
        initialise();

        //for date. Can't use onClick in XML due to method call order.
        date = new DatePickerDialog.OnDateSetListener() {

            @Override
            public void onDateSet(DatePicker view, int year, int monthOfYear, int dayOfMonth) {

                dateCalendar.set(Calendar.YEAR, year);
                dateCalendar.set(Calendar.MONTH, monthOfYear);
                dateCalendar.set(Calendar.DAY_OF_MONTH, dayOfMonth);
                updateLabel();
            }//end onDateSet
        };//end onDateListener

        editTextDate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                new DatePickerDialog(InputScreen.this, date,
                        dateCalendar.get(Calendar.YEAR),
                        dateCalendar.get(Calendar.MONTH),
                        dateCalendar.get(Calendar.DAY_OF_MONTH)).show();
            }
        });//end setOnClickClickListener
    }//end onCreate


    //initialise variables
    public void initialise(){
        //Variables
        editTextDate = (EditText) findViewById(R.id.editText_date);
        editTextStartTime = (EditText) findViewById(R.id.editText_start_time);
        editTextEndTime = (EditText) findViewById(R.id.editText_end_time);
        editTextComments = (EditText) findViewById(R.id.editText_comments);
        dateCalendar = Calendar.getInstance();
        timeCalendar = Calendar.getInstance();
        db = new DBManager(getApplicationContext());
    }//end initialise


    //Onclick methods implemented in XML
    //set start time
    public void setStartTime (View v){
        int hour = timeCalendar.get(Calendar.HOUR_OF_DAY);
        int minute = timeCalendar.get(Calendar.MINUTE);

        TimePickerDialog mTimePicker;

        mTimePicker = new TimePickerDialog(InputScreen.this, new TimePickerDialog.OnTimeSetListener() {
            @Override
            public void onTimeSet(TimePicker timePicker, int selectedHour, int selectedMinute) {
                editTextStartTime.setText( selectedHour + ":" + selectedMinute);
            }
        }, hour, minute, true);//Yes 24 hour time
        mTimePicker.setTitle("Select Time");
        mTimePicker.show();
    }//end setStartTime


    //set end time
    public void setEndTime (View v){
        int hour = timeCalendar.get(Calendar.HOUR_OF_DAY);
        int minute = timeCalendar.get(Calendar.MINUTE);

        TimePickerDialog mTimePicker;

        mTimePicker = new TimePickerDialog(InputScreen.this, new TimePickerDialog.OnTimeSetListener() {
            @Override
            public void onTimeSet(TimePicker timePicker, int selectedHour, int selectedMinute) {
                editTextEndTime.setText( selectedHour + ":" + selectedMinute);
            }
        }, hour, minute, true);//Yes 24 hour time

        mTimePicker.setTitle("Select Time");
        mTimePicker.show();
    }//end setEndTime


    //update the edit text to store date
    private void updateLabel() {

        String myFormat = "dd/MM/yyyy"; //In which you need put here
        SimpleDateFormat sdf = new SimpleDateFormat(myFormat, Locale.UK);

        editTextDate.setText(sdf.format(dateCalendar.getTime()));
    }//endUpdateLabel

    //end reference


    //Methods for when buttons are clicked
    //onclick listeners implemented in xml
    public void submitDetails (View v){

        //check if no details are blank
        if (checkEnteredDetails()){

            //Send details to shared preferences file
            sendToDB();

            //Toast to tell user details have been submitted
            Toast.makeText(getApplicationContext(),R.string.toast_details_submitted,Toast.LENGTH_SHORT).show();

            finish();
        }//end if
    }//end submit details


    //set all edit text fields to blank
    public void resetDetails (View v){

        //set to blank
        editTextDate.setText("");
        editTextStartTime.setText("");
        editTextEndTime.setText("");
        editTextComments.setText("");

        //Toast to tell user details have been reset
        Toast.makeText(getApplicationContext(),R.string.toast_details_reset,Toast.LENGTH_SHORT).show();
    }//end reset details


    //check if info entered is blank
    public boolean checkEnteredDetails() {

        //initialise variables
        String origionalMessage = "The following fields are blank: ";
        String errorMessage = "The following fields are blank: "; //will be displayed on screen to user

        //check if fields are blank
        if (editTextDate.getText().toString().equals("")) {
            errorMessage += "Date, ";
        }//end if

        if (editTextStartTime.getText().toString().equals("")) {
            errorMessage += "Start Time, ";
        }//end if

        if (editTextEndTime.getText().toString().equals("")) {
            errorMessage += "End Time, ";
        }//end if

        //check contents of message
        if (errorMessage.equals(origionalMessage)) {
            return true;
        }//end if

        else {
            //Tidy error message up and remove comma at end of string.
            StringBuilder tidyString = new StringBuilder(errorMessage);
            tidyString.deleteCharAt(tidyString.length() - 2);

            //Toast to tell user details are blank
            Toast.makeText(getApplicationContext(), tidyString, Toast.LENGTH_LONG).show();
            errorMessage = origionalMessage;
            return false;
        }//end else
    }//end checkEnteredDetails


    //Send items to db
    public void sendToDB(){

        //get details / initialise variables
        String date = editTextDate.getText().toString();
        String startTime  = editTextStartTime.getText().toString();
        String endTime = editTextEndTime.getText().toString();
        String comments = editTextComments.getText().toString();
        int hours = 0;
        int mins = 0;
        DateFormat sdf = new SimpleDateFormat("hh:mm");

        //try to get times
        try {
            Date time1 = sdf.parse(startTime);
            Date time2 = sdf.parse(endTime);

            long diff = Math.abs(time2.getTime() - time1.getTime());
            int diffMins = (int)diff / (60 * 1000);

            //check if there are extra mins
            if (diffMins % 60 == 0){
                hours = (diffMins / 60);
            }//end if

            else{
                mins = (diffMins % 60);
                hours = (diffMins - mins)/60;
            }//end else
        }//end try

        catch (ParseException e) {
            Toast.makeText(getApplicationContext(), R.string.toast_error,Toast.LENGTH_SHORT).show();
        }//end catch

        //Try open db
        try{
            db.open();
            db.insertEvent(date,startTime,endTime,comments,hours,mins);
            db.close();
        }//end try

        catch (Exception e){
            Toast.makeText(getApplicationContext(), R.string.toast_db_error,Toast.LENGTH_SHORT).show();
        }//end catch
    }//end send to db


    //Used to finish activity
    public boolean onNavigationItemSelected(MenuItem item) {
      super.onNavigationItemSelected(item);

        finish();
        return true;
    }//end onNavigationItemSelected
}//end class InputScreen
