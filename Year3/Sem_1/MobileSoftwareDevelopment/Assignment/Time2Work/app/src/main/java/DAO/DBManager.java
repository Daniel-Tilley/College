package DAO;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.widget.Toast;

import com.example.danieltilley.time2work.R;

import java.sql.SQLException;

/**
 * Created by danieltilley on 12/11/2016.
 */

//This class is responsible for getting / posting to the events table db.

//Reference, This code was taken from:
//MSD 3 class

public class DBManager {

    //Variables for db
    private static final int DATABASE_VERSION = 1;
    private static String DATABASE_NAME = "";
    private static String TABLE_EVENTS = "";

    private static String KEY_ID = "";
    private static String KEY_EVENT_DATE = "";
    private static String KEY_EVENT_START_TIME = "";
    private static String KEY_EVENT_END_TIME = "";
    private static String KEY_EVENT_COMMENTS = "";
    private static String KEY_EVENTS_HOURS_WORKED = "";
    private static String KEY_EVENTS_MINUTES_WORKED = "";

    private static String CREATE_EVENTS_TABLE = "";

    private final Context context; //context received from activity
    private MyDatabaseHelper DBHelper; //db helper class
    private SQLiteDatabase db; //readable / writable db


    // we must pass the context from our class that we called from
    public DBManager(Context ctx) {
        this.context = ctx;

        //Assign strings from String file
        DATABASE_NAME = ctx.getString(R.string.event_db_name);
        TABLE_EVENTS = ctx.getString(R.string.events_db_table_name);

        KEY_ID = ctx.getString(R.string.events_db_id_column_name);
        KEY_EVENT_DATE = ctx.getString(R.string.events_db_date_column_name);
        KEY_EVENT_START_TIME = ctx.getString(R.string.events_db_start_time_column_name);
        KEY_EVENT_END_TIME = ctx.getString(R.string.events_db_end_time_column_name);
        KEY_EVENT_COMMENTS = ctx.getString(R.string.events_db_comments_column_name);
        KEY_EVENTS_HOURS_WORKED = ctx.getString(R.string.events_db_total_hours_column_name);
        KEY_EVENTS_MINUTES_WORKED = ctx.getString(R.string.events_db_total_mins_column_name);


        //Assign create statement to string
        CREATE_EVENTS_TABLE = "CREATE TABLE " + TABLE_EVENTS + " " + "(" +
                KEY_ID + " INTEGER PRIMARY KEY autoincrement, " +
                KEY_EVENT_DATE + " TEXT not null, " +
                KEY_EVENT_START_TIME + " TEXT not null, " +
                KEY_EVENT_END_TIME + " TEXT not null, " +
                KEY_EVENT_COMMENTS + " TEXT not null, " +
                KEY_EVENTS_HOURS_WORKED + " integer not null, " +
                KEY_EVENTS_MINUTES_WORKED + " integer not null);";

        //Declare new helper class
        DBHelper = new MyDatabaseHelper(context);
    }//end constructor


    //data base handler class
    private static class MyDatabaseHelper extends SQLiteOpenHelper {

        public MyDatabaseHelper(Context context) {
            super(context, DATABASE_NAME, null, DATABASE_VERSION);
        }//end constructor


        @Override
        public void onCreate(SQLiteDatabase db) {
            db.execSQL(CREATE_EVENTS_TABLE);
        }//end on create


        @Override
        public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
            db.execSQL("DROP TABLE IF EXISTS " + TABLE_EVENTS);
            onCreate(db);
        }//end on upgrade
    }//end MyDataBaseHelper


    public DBManager open() //throws SQLException {
    {
        db = DBHelper.getWritableDatabase();
        return this;
    }//end open


    public void close() {
        DBHelper.close();
    }//end close


    public long insertEvent(String date, String startTime, String endTime, String comments, int hours, int minutes) {
        ContentValues initialValues = new ContentValues();
        initialValues.put(KEY_EVENT_DATE, date);
        initialValues.put(KEY_EVENT_START_TIME, startTime);
        initialValues.put(KEY_EVENT_END_TIME, endTime);
        initialValues.put(KEY_EVENT_COMMENTS, comments);
        initialValues.put(KEY_EVENTS_HOURS_WORKED, hours);
        initialValues.put(KEY_EVENTS_MINUTES_WORKED, minutes);
        return db.insert(TABLE_EVENTS, null, initialValues);
    }//end insert event


    public long updateEvent(String where, String date, String startTime, String endTime, String comments, int hours, int minutes) {
        ContentValues initialValues = new ContentValues();
        initialValues.put(KEY_EVENT_DATE, date);
        initialValues.put(KEY_EVENT_START_TIME, startTime);
        initialValues.put(KEY_EVENT_END_TIME, endTime);
        initialValues.put(KEY_EVENT_COMMENTS, comments);
        initialValues.put(KEY_EVENTS_HOURS_WORKED, hours);
        initialValues.put(KEY_EVENTS_MINUTES_WORKED, minutes);
        return db.update(TABLE_EVENTS, initialValues, where, null);
    }//end insert event


    public Cursor getEvent(int id) {
        Cursor mCursor = db.rawQuery(
                "SELECT * FROM " + TABLE_EVENTS +" WHERE " + KEY_ID + " = " + id + ";", null);

        if (mCursor != null) {
            mCursor.moveToFirst();
        }//end if

        return mCursor;
    }//end get task


    public Cursor getCertainMonths(String condition){
        Cursor mCursor = db.rawQuery(
                "SELECT * FROM " + TABLE_EVENTS + " WHERE " +
                        KEY_EVENT_DATE + " LIKE " + "'%/"+ condition +"' ORDER BY " + KEY_EVENT_DATE +" ASC", null);

        if (mCursor != null) {
            mCursor.moveToFirst();
        }//end if

        return mCursor;
    }//end get certain months


    public boolean deleteEvent(int rowId) {
        // delete statement. If any rows deleted (i.e. >0), returns true
        return db.delete(TABLE_EVENTS, KEY_ID +
                "=" + rowId, null) > 0;
    }//end deleteTask


    //for testing
    /*
    public Cursor getAll() {
        Cursor mCursor = db.rawQuery(
                "SELECT * FROM " + TABLE_EVENTS, null);

        if (mCursor != null) {
            mCursor.moveToFirst();
        }//end if

        return mCursor;
    }//end get all
    */
}//end class DBManager
