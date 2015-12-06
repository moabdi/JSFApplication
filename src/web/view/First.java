package web.view;

import java.awt.Component;
import java.awt.Dimension;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartFrame;
import org.jfree.chart.JFreeChart;
import org.jfree.data.PieDataset;
import org.jfree.data.general.DefaultPieDataset;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

/**
* A simple introduction to using JFreeChart. This demo is described in the
* JFreeChart Developer Guide.
*/
public class First {
        
//      * Definition du format utilise pour les dates
        static DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
        
        
/**
* The starting point for the demo.
*
* @param args ignored.
*/
public static void main(String[] args) {
// create a dataset...
DefaultPieDataset data = new DefaultPieDataset();
data.setValue("Category 1", 43.2);
data.setValue("Category 2", 27.9);
data.setValue("Category 3", 79.5);
// create a chart...
JFreeChart chart = ChartFactory.createPieChart(
"Sample Pie Chart",
(PieDataset) data,
true, // legend?
true, // tooltips?
false // URLs?
);
// create and display a frame...
ChartFrame frame = new ChartFrame("First", chart);
frame.pack();
frame.setVisible(true);
saveComponentAsJPEG(frame.getChartPanel(),dateFormat.format(new Date())+"-chart.jpg");
}

public static void saveComponentAsJPEG(Component myComponent, String filename) {
    Dimension size = myComponent.getSize();
    BufferedImage myImage = new BufferedImage(size.width, size.height,BufferedImage.TYPE_INT_RGB);
    Graphics2D graph = myImage.createGraphics();
    myComponent.paint(graph);
    try {
      OutputStream out = new FileOutputStream(filename);
      JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
      encoder.encode(myImage);
      out.close();
      System.out.println("la courbe a été sauvée dans le fichier "+filename);
    } catch (Exception e) {
      System.out.println("Impossible de sauver la courbe : "+e);
    }
 } 
}