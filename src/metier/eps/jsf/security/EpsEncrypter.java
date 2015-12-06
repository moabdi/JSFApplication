package metier.eps.jsf.security;
import javax.crypto.Cipher;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigInteger;
import java.security.Key;
import java.security.InvalidKeyException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
public class EpsEncrypter {
	   

	        private static String algorithm = "DESede";
	        private static Key key = null;
	        private static Cipher cipher = null;

	        private static void setUp() throws Exception {
	            //key = KeyGenerator.getInstance(algorithm).generateKey();
	            key = KeyGenerator.getInstance(algorithm).generateKey();
	            cipher = Cipher.getInstance(algorithm);
	        }
private static void GenKeyInFile() throws KeyStoreException, NoSuchAlgorithmException, CertificateException{
	
	FileOutputStream fos;
	try {
		FileInputStream fis = null;
		KeyStore ks = KeyStore.getInstance(KeyStore.getDefaultType());
		try {
			fos = new java.io.FileOutputStream("test.ks");
			//ks.setKeyEntry("alias", key, "changeit".toCharArray(), null);
			ks.store(null, "changeit".toCharArray());
			ks.store(fos, "changeit".toCharArray());
			fis = new java.io.FileInputStream("test.ks");
			
			ks.load(null, "changeit".toCharArray());
			ks.load(fis, "changeit".toCharArray());
			} 
		finally {
			if (fis != null) {
				fis.read();
				fis.available();
				fis.close();
			
			}
			}

		
		//fos = new FileOutputStream("test.ks");
		
		
		ks.load(null, "changeit".toCharArray());
		fis.close();
		
		//fos.write(6);
		
	//	fos.close();
		ks.load(fis, "changeit".toCharArray());
		fis.close();
		ks.setKeyEntry("alias", key, "changeit".toCharArray(), null);
		//ks.store(fos, "changeit".toCharArray());
	} catch (FileNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}	catch(IOException e){
			e.printStackTrace();
		}
	}
	
	
	//ks.load(fis, "changeit".toCharArray());

public static String hashPassword(String password) {
	String hashword = null;
	try {
	MessageDigest md5 = MessageDigest.getInstance("MD5");
	md5.update(password.getBytes());
	BigInteger hash = new BigInteger(1, md5.digest());
	hashword = hash.toString(16);
	} catch (NoSuchAlgorithmException nsae) {
	// ignore
	}
	return hashword;
	}


	        public static void main(String[] args) 
	           throws Exception {
	        	
	        	hashPassword("Xmax");
	        	System.out.print(hashPassword("bits"));
	      /*      setUp();
	            GenKeyInFile();
	      */
	     /*       
	            if (args.length !=1) {
	                System.out.println(
	                  "USAGE: java LocalEncrypter " +
	                                         "[String]");
	                System.exit(1);
	            }
	            byte[] encryptionBytes = null;
	            String input = args[0];
	            System.out.println("Entered: " + input);
	            encryptionBytes = encrypt(input);
	            System.out.println(
	              "Recovered: " + decrypt(encryptionBytes));
*/	        }

	        public static byte[] encrypt(String input)
	            throws InvalidKeyException, 
	                   BadPaddingException,
	                   IllegalBlockSizeException,
	                   Exception{
				setUp();
	            cipher.init(Cipher.ENCRYPT_MODE, key);
	            byte[] inputBytes = input.getBytes();
	            return cipher.doFinal(inputBytes);
	            
	        }

	        public static String decrypt(byte[] encryptionBytes)
	            throws InvalidKeyException, 
	                   BadPaddingException,
	                   IllegalBlockSizeException,
	                   Exception{
	        	setUp();
				cipher.init(Cipher.DECRYPT_MODE, key);
	            byte[] recoveredBytes = 
	              cipher.doFinal(encryptionBytes);
	            String recovered = 
	              new String(recoveredBytes);
	            return recovered;
	          }
	   
}
