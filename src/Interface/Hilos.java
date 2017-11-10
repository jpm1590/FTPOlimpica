package Interface;

import static Interface.Start.*;
import cz.dhl.ftp.Ftp;
import cz.dhl.ftp.FtpConnect;
import cz.dhl.ftp.FtpFile;
import cz.dhl.io.CoFile;
import cz.dhl.io.CoLoad;
import cz.dhl.io.LocalFile;
import java.io.IOException;

public class Hilos extends Thread {

    @Override
    public void run() { //Hilo proceso de Carga o Descarga de archivos por FTP
        //*
        for (Integer NEGpo : NEGpos) {
            Start.jTextField4.setText(pru.get(NEGpo).get(0) + "  /  " + pru.get(NEGpo).get(1));
            System.out.println(pru.get(NEGpo).get(0) + " " + pru.get(NEGpo).get(1));

            FtpConnect cn = FtpConnect.newConnect("ftp://" + pru.get(NEGpo).get(1));
            cn.setUserName("heberard");
            cn.setPassWord("cancer06");
            Ftp cl = new Ftp();
            try {
                cl.connect(cn);

                CoFile Remoto[] = new CoFile[LOCAL.size()];
                for (int k = 0; k < LOCAL.size(); k++) {
                    Remoto[k] = new FtpFile(REMOTE.get(k), cl);
                }
                for (int i1 = 0; i1 < LOCAL.size(); i1++) {
                    if (UPDOWN == 2) {
                        CoLoad.copy(Remoto[i1], LOCAL.get(i1));
                    } else if (UPDOWN == 1) {
                        CoLoad.copy(LOCAL.get(i1), Remoto[i1]);
                    }
                }
            } catch (IOException ioe) {
            } finally {
                cl.disconnect();
            }
            String area = Start.jTextArea1.getText();
            
        }//*/        
    }
}
