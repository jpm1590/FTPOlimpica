package Interface;

import static Interface.Start.*;
import cz.dhl.ftp.Ftp;
import cz.dhl.ftp.FtpConnect;
import cz.dhl.ftp.FtpFile;
import cz.dhl.io.CoFile;
import cz.dhl.io.CoLoad;
import cz.dhl.io.LocalFile;
import java.io.IOException;

public class Palabras extends Thread {

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

                CoFile Remoto, Local;
                Remoto = new FtpFile("c:/ADX_UDT1/LDCLVSEG." + pru.get(NEGpos.get(i)).get(0), cl);
                Local = new LocalFile("C:/Users/olimpica/Desktop/jpm1590/Palabras/PALABRAS/palabras_18/N" + pru.get(NEGpos.get(i)).get(0) + ".csv");
                
                //CoLoad.copy(Local, Remoto); //DWN
                CoLoad.copy(Remoto, Local); //UP
            } catch (IOException ioe) {
            } finally {
                System.out.println(pru.get(NEGpos.get(i)).get(0) + " " + pru.get(NEGpos.get(i)).get(1));
                cl.disconnect();
            }
        }
    }
}
