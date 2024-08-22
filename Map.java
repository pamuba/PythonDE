package select;


import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

import java.io.IOException;

public class Map extends Mapper<LongWritable,Text,LongWritable,Text> {

    @Override
    public void map(LongWritable key, Text value, Context context) throws IOException, InterruptedException
    {
        String line = value.toString();
        String[] data = line.split(",");


        if(data[0].equals("SYMBOL")){
            return;
        }


        if (data[0].equals("3MINDIA") && data[1].equals("EQ")){

           String output = data[0]+" , "+data[2]+" , "+data[5]+" , "+data[10];
           // symbol,     open,        close,         date

            context.write(key, new Text(output));
        }


            }
        }