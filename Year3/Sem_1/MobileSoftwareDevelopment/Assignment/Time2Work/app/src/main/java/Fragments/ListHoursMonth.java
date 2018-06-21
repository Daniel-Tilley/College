package Fragments;

import android.app.Activity;
import android.content.Intent;
import android.content.res.Resources;
import android.database.Cursor;
import android.database.DatabaseUtils;
import android.support.v4.app.Fragment;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import com.example.danieltilley.time2work.R;
import com.example.danieltilley.time2work.UpdateHours;

import Adapters.EventCursorAdapter;
import DAO.DBManager;

/**
 * Created by danieltilley on 17/11/2016.
 */

//This fragment class is responsible for listing all entries
public class ListHoursMonth extends Fragment{

    private DBManager db;
    private ListView eventsList;
    private Intent recieveIntent;
    private String position;

    private TextView title;
    private View rootView;
    private Activity referenceActivity;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {

        rootView = inflater.inflate(R.layout.fragment_display_hours_list,container,false);
        initialise();
        getListCertainEvents();



        eventsList.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> av, View view, int position, long arg) {
                Cursor mycursor = (Cursor) av.getItemAtPosition(position);

                int event_id = mycursor.getInt(0);

                Intent i = new Intent(getContext(),UpdateHours.class);
                i.putExtra("EVENT_ID", event_id);
                startActivity(i);
            }
        });

        return rootView;
    }//end onCreateView

    public void initialise(){
        referenceActivity = getActivity();
        eventsList = (ListView) rootView.findViewById(R.id.listView_events);
        db = new DBManager(getContext());

        title = (TextView) rootView.findViewById(R.id.fragment_display_list_title);
        recieveIntent = referenceActivity.getIntent();
        position = recieveIntent.getStringExtra("MONTH_KEY");
    }//end initialise


    public void getListCertainEvents(){
        try{
            db.open();
            Cursor cursor = db.getCertainMonths(position);
            EventCursorAdapter eventCursorAdapter = new EventCursorAdapter(getContext(),cursor);

            if (eventCursorAdapter.getCount()!=0){
                eventsList.setAdapter(eventCursorAdapter);
                title.setText("Tap an item to view it");
            }//end if

            else{
                String displayText = "No items for " + getMonth();
                title.setText(displayText);
            }//end else
            db.close();
        }//end try

        catch (Exception e){
            Toast.makeText(getContext(),"Error opening db",Toast.LENGTH_SHORT).show();
        }//end catch
    }//end getCertainEvents


    public String getMonth (){
        //Must parse key received from previous screen
        String getMonthKey = position.substring(0,2);

        //get months array stored in string file
        Resources resources = getResources();
        String[] months = resources.getStringArray(R.array.Months);

        //declare month string to be returned and set as the title
        String month = "";

        //switch statement to decide what month to pick from
        switch (getMonthKey){
            case "01":{
                month = months[0];
                break;
            }//end case

            case "02":{
                month = months[1];
                break;
            }//end case

            case "03":{
                month = months[2];
                break;
            }//end case

            case "04":{
                month = months[3];
                break;
            }//end case

            case "05":{
                month = months[4];
                break;
            }//end case

            case "06":{
                month = months[5];
                break;
            }//end case

            case "07":{
                month = months[6];
                break;
            }//end case

            case "08":{
                month = months[7];
                break;
            }//end case

            case "09":{
                month = months[8];
                break;
            }//end case

            case "10":{
                month = months[9];
                break;
            }//end case

            case "11":{
                month = months[10];
                break;
            }//end case

            case "12":{
                month = months[11];
                break;
            }//end case
        }//end switch

        return month;
    }//end get month


    @Override
    public void onResume() {
        super.onResume();
        getListCertainEvents();
    }//end onResume
}//end Class
