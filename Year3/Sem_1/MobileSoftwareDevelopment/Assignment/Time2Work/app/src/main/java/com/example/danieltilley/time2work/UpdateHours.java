package com.example.danieltilley.time2work;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.DatePickerDialog;
import android.app.TimePickerDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.database.Cursor;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.TimePicker;
import android.widget.Toast;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import DAO.DBManager;

//This class is responsible for showing items and allowing a user to update / delete them
public class UpdateHours extends Activity {

    //Variables
    private DBManager db;
    private TextView textViewDate;
    private TextView textViewStartTime;
    private TextView textViewEndTime;
    private TextView textViewComments;
    private TextView textViewHours;
    private TextView textViewMins;
    private Button deleteButton;
    private Cursor cursor;
    private Intent receiveIntent;
    private int id;
    private AlertDialog.Builder dialog;

    //hidden variables
    private DatePickerDialog.OnDateSetListener date;
    private Calendar dateCalendar;
    private Calendar timeCalendar;
    private EditText editTextDate;
    private EditText editTextStartTime;
    private EditText editTextEndTime;
    private EditText editTextComments;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_update_hours);

        //initialise variables and set text
        initialise();
        setText();

        deleteButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                //show our alert dialog
                dialog = new AlertDialog.Builder(UpdateHours.this);
                dialog.setTitle(R.string.update_hours_dialog_title);
                dialog.setMessage(R.string.update_hours_dialog_message);
                dialog.setCancelable(false);
                dialog.setIcon(android.R.drawable.ic_delete);

                //set buttons is dialog
                //positive
                dialog.setPositiveButton(("Yes"),

                        new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialog, int which) {
                                //delete from database
                                callDBDelete();

                            }
                        });

                //negative
                dialog.setNegativeButton(("No"),

                        new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialog, int which) {
                                //close dialog
                                dialog.cancel();
                            }
                        });

                //create dialog
                AlertDialog alertD = dialog.create();

                //show dialog when button is clicked
                alertD.show();
            }
        });

        //for date. Can't use onClick in XML due to method call order.
        date = new DatePickerDialog.OnDateSetListener() {

            @Override
            public void onDateSet(DatePicker view, int year, int monthOfYear, int dayOfMonth) {

                // TODO Auto-generated method stub
                dateCalendar.set(Calendar.YEAR, year);
                dateCalendar.set(Calendar.MONTH, monthOfYear);
                dateCalendar.set(Calendar.DAY_OF_MONTH, dayOfMonth);
                updateLabel();
            }//end onDateSet
        };//end onDateListener

        editTextDate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                new DatePickerDialog(UpdateHours.this, date,
                        dateCalendar.get(Calendar.YEAR),
                        dateCalendar.get(Calendar.MONTH),
                        dateCalendar.get(Calendar.DAY_OF_MONTH)).show();
            }
        });//end setOnClickClickListener
    }//end onCreate


    public void setText(){
        //try open db
        try{
            db.open();
            cursor = db.getEvent(id);
            db.close();
        }//end try

        catch (Exception e){
            Toast.makeText(getApplicationContext(),R.string.toast_db_error,Toast.LENGTH_SHORT).show();
        }//end catch

        //Declare and initialise
        String date = "Date: ";
        String startTime = "Start time: ";
        String endTime = "End time: ";
        String comments = "Comments: ";
        String hours = "Hours worked: ";
        String mins = "Mins worked: ";

        // Extract properties from cursor
        date += cursor.getString(cursor.getColumnIndexOrThrow(getString(R.string.events_db_date_column_name)));
        startTime += cursor.getString(cursor.getColumnIndexOrThrow(getString(R.string.events_db_start_time_column_name)));
        endTime += cursor.getString(cursor.getColumnIndexOrThrow(getString(R.string.events_db_end_time_column_name)));
        comments += cursor.getString(cursor.getColumnIndexOrThrow(getString(R.string.events_db_comments_column_name)));
        hours += cursor.getString(cursor.getColumnIndexOrThrow(getString(R.string.events_db_total_hours_column_name)));
        mins += cursor.getString(cursor.getColumnIndexOrThrow(getString(R.string.events_db_total_mins_column_name)));

        //check if comments are blank or not
        if (comments.equals("Comments: ")){
            comments += "No comments";
        }//end if

        // Populate fields with extracted properties
        textViewDate.setText(date);
        textViewStartTime.setText(startTime);
        textViewEndTime.setText(endTime);
        textViewComments.setText(comments);
        textViewHours.setText(hours);
        textViewMins.setText(mins);
    }//end setText


    public void initialise(){
        //Variables
        textViewDate = (TextView) findViewById(R.id.textView_update_date);
        textViewStartTime = (TextView) findViewById(R.id.textView_update_start_time);
        textViewEndTime = (TextView) findViewById(R.id.textView_update_end_time);
        textViewComments = (TextView) findViewById(R.id.textView_update_comments);
        textViewHours = (TextView) findViewById(R.id.textView_update_hours);
        textViewMins = (TextView) findViewById(R.id.textView_update_mins);
        deleteButton = (Button) findViewById(R.id.update_button_delete);
        db = new DBManager(getApplicationContext());
        receiveIntent = getIntent();
        id = receiveIntent.getIntExtra("EVENT_ID",-1);

        //hidden variables
        editTextDate = (EditText) findViewById(R.id.editText_date);
        editTextStartTime = (EditText) findViewById(R.id.editText_start_time);
        editTextEndTime = (EditText) findViewById(R.id.editText_end_time);
        editTextComments = (EditText) findViewById(R.id.editText_comments);
        dateCalendar = Calendar.getInstance();
        timeCalendar = Calendar.getInstance();
    }//end initialise


    public void updateEvent(View v){

        RelativeLayout updateView = (RelativeLayout) findViewById(R.id.updateView);
        updateView.setVisibility((updateView.getVisibility() == View.VISIBLE) ? View.GONE : View.VISIBLE);
    }//end updateEvent


    public void callDBDelete(){
        //open db
        try {
            db.open();
            if (db.deleteEvent(id)) {
                Toast.makeText(getApplicationContext(), R.string.toast_delete_sucess, Toast.LENGTH_LONG).show();
                db.close();
                finish();
            }//end if

            else {
                Toast.makeText(getApplicationContext(), R.string.toast_delete_failure, Toast.LENGTH_LONG).show();
                db.close();
            }//end else
        }//end try

        catch(Exception e){
            Toast.makeText(getApplicationContext(),R.string.toast_db_error,Toast.LENGTH_SHORT).show();
        }//end catch
    }//end call db delete


    //CODE FOR HIDDEN VIEWS


    //Onclick methods implemented in XML
    //set start time
    public void setStartTime (View v){
        int hour = timeCalendar.get(Calendar.HOUR_OF_DAY);
        int minute = timeCalendar.get(Calendar.MINUTE);

        TimePickerDialog mTimePicker;

        mTimePicker = new TimePickerDialog(UpdateHours.this, new TimePickerDialog.OnTimeSetListener() {
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

        mTimePicker = new TimePickerDialog(UpdateHours.this, new TimePickerDialog.OnTimeSetListener() {
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
            Toast.makeText(getApplicationContext(), R.string.toast_details_updated,Toast.LENGTH_SHORT).show();
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
        //get text / hours and mins
        String date = editTextDate.getText().toString();
        String startTime  = editTextStartTime.getText().toString();
        String endTime = editTextEndTime.getText().toString();
        String comments = editTextComments.getText().toString();
        int hours = 0;
        int mins = 0;

        DateFormat sdf = new SimpleDateFormat("hh:mm");

        //try get mins and hours
        try {
            Date time1 = sdf.parse(startTime);
            Date time2 = sdf.parse(endTime);

            long diff = Math.abs(time2.getTime() - time1.getTime());
            int diffMins = (int)diff / (60 * 1000);

            Toast.makeText(getApplicationContext(),"" + time2.getTime() + " " + time1.getTime(),Toast.LENGTH_SHORT).show();

            //Check if there are any extra mins
            if (diffMins % 60 == 0){
                hours = (diffMins / 60);
            }//end if

            else{
                mins = (diffMins % 60);
                hours = (diffMins - mins)/60;
            }//end else
        }//end try
        catch (ParseException e) {
            Toast.makeText(getApplicationContext(),R.string.toast_error,Toast.LENGTH_SHORT).show();
        }//end catch

        /*
        //try open db
        try{
            String a = getString(R.string.events_db_id_column_name) + "='" + id + "'";
            db.open();
            db.updateEvent(a,date,startTime,endTime,comments,hours,mins);
            db.close();
        }//end try

        catch (Exception e){
            Toast.makeText(getApplicationContext(),R.string.toast_db_error,Toast.LENGTH_SHORT).show();
        }//end catch

        */
    }//end send to db
}//end class
