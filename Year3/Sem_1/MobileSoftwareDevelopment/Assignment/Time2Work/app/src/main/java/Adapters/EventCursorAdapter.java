package Adapters;

import android.content.Context;
import android.database.Cursor;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CursorAdapter;
import android.widget.TextView;

import com.example.danieltilley.time2work.R;

/**
 * Created by danieltilley on 10/11/2016.
 */

//Class to add database items to listview on the DisplayHours page
public class EventCursorAdapter extends CursorAdapter{

    public EventCursorAdapter(Context context, Cursor cursor) {
        super(context, cursor, 0);
    }

    // The newView method is used to inflate a new view and return it,
    // you don't bind any data to the view at this point.
    @Override
    public View newView(Context context, Cursor cursor, ViewGroup parent) {
        return LayoutInflater.from(context).inflate(R.layout.eventrow, parent, false);
    }//end newView


    // The bindView method is used to bind all data to a given view
    // such as setting the text on a TextView.
    @Override
    public void bindView(View view, Context context, Cursor cursor) {

        // Find fields to populate in inflated template
        TextView date = (TextView) view.findViewById(R.id.TextView_row_date_data);
        TextView startTime = (TextView) view.findViewById(R.id.TextView_row_start_time_data);
        TextView endTime = (TextView) view.findViewById(R.id.TextView_row_end_time_data);

        // Extract properties from cursor
        String dateString = " " + cursor.getString(cursor.getColumnIndexOrThrow(context.getString(R.string.events_db_date_column_name)));
        String startTimeString = " " + cursor.getString(cursor.getColumnIndexOrThrow(context.getString(R.string.events_db_start_time_column_name)));
        String endTimeString = " " + cursor.getString(cursor.getColumnIndexOrThrow(context.getString(R.string.events_db_end_time_column_name)));

        // Populate fields with extracted properties
        date.setText(dateString);
        startTime.setText(startTimeString);
        endTime.setText(endTimeString);

    }//end bindView
}//end EventCursorAdapter
