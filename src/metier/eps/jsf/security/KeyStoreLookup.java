package metier.eps.jsf.security;

import javax.crypto.Cipher;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;
import javax.security.cert.Certificate;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Key;
import java.security.InvalidKeyException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
public class KeyStoreLookup {
	public static void main(String args[]) {
		try {
			KeyStore ks = 
                      KeyStore.getInstance(KeyStore.getDefaultType());
			String fname = "test.keystore";
			FileInputStream fis = new FileInputStream(fname);
			ks.load(null, null);
			ks.load(fis, null);
			if (ks.isKeyEntry(args[0])) {
				System.out.println(args[0] +
								" is a key entry in the keystore");
				char c[] = new char[args[1].length()];
				args[1].getChars(0, c.length, c, 0);
				System.out.println("The private key for" + args[0] + 
                            " is " + ks.getKey(args[0], c));
				java.security.cert.Certificate[] certs = ks.getCertificateChain(args[0]);
				if (certs[0] instanceof X509Certificate) {
					X509Certificate x509 = (X509Certificate) certs[0];
					System.out.println(args[0] + " is really " +
						x509.getSubjectDN());
				}
				if (certs[certs.length - 1] instanceof
									 X509Certificate) {
					X509Certificate x509 = (X509Certificate) 
										certs[certs.length - 1];
					System.out.println(args[0] + " was verified by " +
						x509.getIssuerDN());
				}
			}
			else if (ks.isCertificateEntry(args[0])) {
				System.out.println(args[0] +
							" is a certificate entry in the keystore");
				java.security.cert.Certificate c = ks.getCertificate(args[0]);
				if (c instanceof X509Certificate) {
					X509Certificate x509 = (X509Certificate) c;
					System.out.println(args[0] + " is really " +
						x509.getSubjectDN());
					System.out.println(args[0] + " was verified by " +
						x509.getIssuerDN());
				}
			}
			else {
				System.out.println(args[0] +
						" is unknown to this keystore");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
