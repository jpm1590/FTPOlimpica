package Interface;

import static Interface.Start.NEGpos;
import static Interface.Start.pru;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;

public class Process1 {

    public static void main() {
        for (int i = 0; i < NEGpos.size(); i++) {
            //NEG / IP
            //NEG:  pru.get(i).get(0);
            //IP:   pru.get(i).get(1);

            //BufferedReader ent = new BufferedReader(new FileReader("Neg/Back" + pru.get(i).get(0) + ".bat"));
            try {
                FileOutputStream fos = new FileOutputStream("Neg/Back" + pru.get(i).get(0) + ".bat");
                OutputStreamWriter osw = new OutputStreamWriter(fos);
                BufferedWriter sal = new BufferedWriter(osw);
                sal.write("@ftp.exe -n -i -s:traeback.txt " + pru.get(i).get(1) + " > ftp.log");
                sal.close();
            } catch (IOException ioe) {
            }
        }
    }
}
