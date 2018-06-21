package com.example.danieltilley.time2work;

import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.design.widget.NavigationView;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.MenuItem;
import android.widget.FrameLayout;

/**
 * Created by danieltilley on 12/11/2016.
 */

//This class is going to be used as a "base" activity for other classes to extend from.
    //It allows other classes to use the nav drawer that is implemented below
//Reference. The following code is from
//http://stackoverflow.com/questions/19442378/navigation-drawer-to-switch-activities-instead-of-fragments

public class BaseDrawerActivity extends AppCompatActivity implements NavigationView.OnNavigationItemSelectedListener {

    //variables
    DrawerLayout drawerLayout; //used to find layout
    Toolbar toolbar; //used to find toolbar
    FrameLayout frameLayout; //used to find frame layout
    NavigationView navigationView; //used to find navigationView


    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        //Initialise view, toolbar and nav drawer
        super.onCreate(savedInstanceState);
        super.setContentView(R.layout.activity_base_drawer);;

        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        frameLayout = (FrameLayout) findViewById(R.id.content_frame);

        drawerLayout = (DrawerLayout) findViewById(R.id.drawer_layout);
        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
                this, drawerLayout, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
        drawerLayout.setDrawerListener(toggle);
        toggle.syncState();

        navigationView = (NavigationView) findViewById(R.id.nav_view);
        navigationView.setNavigationItemSelectedListener(this);
    }//end on create


    @Override
    public void onBackPressed() {

        //check if drawer open or not
        if (drawerLayout.isDrawerOpen(GravityCompat.START)) {
            drawerLayout.closeDrawer(GravityCompat.START);
        }//end if
        else {
            super.onBackPressed();
        }//end else
    }//end onBackPressed


    //Method to check what button is pressed
    @Override
    public boolean onNavigationItemSelected(MenuItem item) {

        int id = item.getItemId(); //item that is pressed id

        //to prevent current item select over and over
        if (item.isChecked()){
            drawerLayout.closeDrawer(GravityCompat.START);
            return false;
        }//end if

        //switch statement to choose the item, starts activity when selected
        switch (id){

            case R.id.main_menu:{
                break;
            }//end case

            case R.id.your_details:{
                startActivity(new Intent(getApplicationContext(), EnterDetails.class));
                break;
            }//end case

            case R.id.input_screen:{
                startActivity(new Intent(getApplicationContext(), InputScreen.class));
                break;
            }//end case

            case R.id.view_hours:{
                startActivity(new Intent(getApplicationContext(), Display.class));
                break;
            }//end case
        }//end switch

        //close the drawer
        drawerLayout.closeDrawer(GravityCompat.START);
        return true;
    }//end on Nav
}//end BaseActivityClass

//reference complete
