package Interface;

import static Interface.Start.*;
import cz.dhl.ftp.Ftp;
import cz.dhl.ftp.FtpConnect;
import cz.dhl.ftp.FtpFile;
import cz.dhl.io.CoFile;
import cz.dhl.io.CoLoad;
import cz.dhl.io.LocalFile;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Process2 extends Thread {

    @Override
    public void run() { //Hilo proceso de Carga o Descarga de archivos por FTP
        //*
        for (int i = 0; i < NEGpos.size(); i++) {

            Start.jTextField4.setText(pru.get(NEGpos.get(i)).get(0) + "  /  " + pru.get(NEGpos.get(i)).get(1));

            FtpConnect cn = FtpConnect.newConnect("ftp://" + pru.get(NEGpos.get(i)).get(1));
            cn.setUserName("heberard");
            cn.setPassWord("cancer06");

            Ftp cl = new Ftp();
            try {
                cl.connect(cn);

                CoFile Remoto, Local, Remoto1, Local1, Remoto2, Local2, Remoto3, 
                        Local3, Remoto4, Local4, Remoto5, Local5, Remoto6, Local6;
                
                Remoto = new FtpFile("c:/adx_sdt1/adxhsihf.dat", cl);
                Remoto1 = new FtpFile("c:/adx_Ipgm/EAMTS10L.286", cl);
                Local1 = new LocalFile("Archs/adxhsihf." + pru.get(NEGpos.get(i)).get(0));
                
                /*long longit = Remoto1.length();
                System.out.println(longit);
                System.out.println(Remoto1.propertyString());//*/
                /*Remoto1 = new FtpFile("c:/java/lib/di4690.jar", cl);
                Remoto2 = new FtpFile("c:/java/lib/cry.jar", cl);
                Remoto3 = new FtpFile("c:/java/lib/giropos.jar", cl);
                Remoto4 = new FtpFile("c:/java/bin/giros.pro", cl);
                Remoto5 = new FtpFile("c:/adx_udt1/pluctr.dat", cl);//*/
                
                //Local = new LocalFile("C:/Users/olimpica/Desktop/jpm1590/ipimpred/adxhsihf." + pru.get(NEGpos.get(i)).get(0));
                /*Local1 = new LocalFile("C:/jpm1590/di." + pru.get(NEGpos.get(i)).get(0));
                Local2 = new LocalFile("C:/jpm1590/cry." + pru.get(NEGpos.get(i)).get(0));
                Local3 = new LocalFile("C:/jpm1590/giropos." + pru.get(NEGpos.get(i)).get(0));
                Local4 = new LocalFile("C:/jpm1590/giropro." + pru.get(NEGpos.get(i)).get(0));
                Local5 = new LocalFile("C:/jpm1590/plu." + pru.get(NEGpos.get(i)).get(0));//*/
//Local = new LocalFile("C:/PINOPERA." + pru.get(NEGpos.get(i)).get(0));
                
                CoLoad.copy(Local1, Remoto); //DWN
                /*CoLoad.copy(Local1, Remoto1); //DWN
                CoLoad.copy(Local2, Remoto2); //DWN
                CoLoad.copy(Local3, Remoto3); //DWN
                CoLoad.copy(Local4, Remoto4); //DWN
                CoLoad.copy(Local5, Remoto5); //DWN//*/

                //CoLoad.copy(Remoto, Local); //UP
            } catch (IOException ioe) {
            } finally {
                System.out.println(pru.get(NEGpos.get(i)).get(0) + " " + pru.get(NEGpos.get(i)).get(1));
                cl.disconnect();
            }
        }//*/

        /*
         try {
         FileOutputStream fos = new FileOutputStream("c:/IMPRRED/ipimp.TXT");
         OutputStreamWriter osw = new OutputStreamWriter(fos);
         BufferedWriter sal = new BufferedWriter(osw);

         String linea;
         for (int i = 0; i < NEGpos.size(); i++) {
         BufferedReader ent = new BufferedReader(new FileReader("c:/IMPRRED/IPRED" + pru.get(NEGpos.get(i)).get(0) + ".TXT"));

         for (int j = 0; j < 7; j++) {
         linea = ent.readLine();
         }
         sal.write(pru.get(NEGpos.get(i)).get(0)+";"+ent.readLine());
         sal.newLine();                
         }
         sal.close();
         } catch (FileNotFoundException ex) {
         } catch (IOException ex) {
         }//*/
    }
}
