package select;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

import java.io.IOException;

public class Reduce extends Reducer<LongWritable,Text,NullWritable,Text> {
    @Override
    public void reduce(final LongWritable key, final Iterable<Text> values,
                       final Context context) throws IOException, InterruptedException {


        for (Text value : values) {
            context.write( NullWritable.get(), value);
        }


    }
}