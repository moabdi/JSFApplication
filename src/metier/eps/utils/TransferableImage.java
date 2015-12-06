package metier.eps.utils;

import java.awt.*; 
import java.awt.datatransfer.*; 
import java.io.*; 

public class TransferableImage implements Transferable{ 
   private Image image; 
   public TransferableImage(Image uneImage){ 
      image = uneImage;    
   }    
   public Object getTransferData(DataFlavor flavor) 
                     throws UnsupportedFlavorException, 
                             IOException{ 
      if(!isDataFlavorSupported(flavor)){throw new UnsupportedFlavorException(flavor);} 
      return image;    
   } 
   public DataFlavor[] getTransferDataFlavors(){ 
      return new DataFlavor[]{DataFlavor.imageFlavor}; 
   } 
   public boolean isDataFlavorSupported(DataFlavor flavor){ 
      return DataFlavor.imageFlavor.equals(flavor);    
   } 
} 

